import json
import jwt
import urllib
from DB import DB
import pylast
import requests
import flask
import threading
import concurrent.futures
from secrets import *

class Releases:
	
	network = pylast.LastFMNetwork(api_key=API_KEY, api_secret=API_SECRET)
	
	def resp(self, code, data):
	    return flask.Response(
	        status=code,
	        mimetype="application/json",
	        response=json.dumps(data)+'\n'
	    )
	    
	def search(self, name):
		results = self.network.search_for_artist(name)
		artists=list()
		for res in results.get_next_page():
			artists.append(res.name)
		return artists
		
	def getCoverArt(self, mbid, arts):
		try:
			r = urllib.request.urlopen("http://coverartarchive.org/release/"+mbid)
		except:
			arts[mbid] = None
			return
		if r.getcode() != 200:
			arts[mbid] = None
			return
		jimages = json.loads(r.read().replace(b'http://', b'https://'))['images'][0]
		jimages['thumbnails']['full'] = jimages['image']
		images = jimages['thumbnails']
		arts[mbid] = images
	
	def releases(self, name, dosort = True):
		mbid = self.network.get_artist(name).get_mbid()
		if mbid == None:
			return []
		r = json.loads(urllib.request.urlopen("http://musicbrainz.org/ws/2/release?artist="+mbid+"&limit=100&fmt=json&status=official").read())
		releases = r['releases']
		releases = [v for v in releases if 'date' in v.keys()]
		if dosort:
			releases = sorted(releases, key=lambda x: x['date'], reverse=True)
		result = list()
		arts = dict()
		threads = [threading.Thread(target=self.getCoverArt, args=(release['id'],arts, )) for release in releases]
		for thread in threads:
			thread.start()
		for thread in threads:
			thread.join()
		i=0
		for release in releases:
			result.append({k: release[k] for k in ('date', 'title')})
			result[i]['cover'] = arts[release['id']]
			i+=1
		return [i for n, i in enumerate(result) if i not in result[n + 1:]]
			
	def getTracks(self, name, artist):
		tracks = self.network.get_album(artist, name).get_tracks()
		result = list()
		for i in tracks:
			result.append(i.get_name())
		return result
		
	def login(self, username, password):
		db = DB()
		if db.login(username, password):
			jwttoken = jwt.encode({'user': username, 'id': db.getUserID(username)}, jwtsecret, algorithm='HS256').decode('utf-8')
			return self.resp(200, {'token': jwttoken})
		else:
			return self.resp(500, {'error': 'no such user'})
		del db
	
	def register (self, username, password):
		db = DB()
		if db.regUser(username, password):
			return self.login(username, password)
		else:
			return self.resp(200, {'error': 'fail'})
		del db
		
	def addsub (self, jwttoken, artist):
		db = DB()
		db.addSub(jwt.decode(jwttoken, jwtsecret)['id'], artist)
		return self.resp(200, {'status': 'ok'})
		del db

	def delsub(self, jwttoken, artist):
		db = DB()
		db.delSub(jwt.decode(jwttoken, jwtsecret)['id'], artist)
		return self.resp(200, {'status': 'ok'})
		del db	
		
	def getsubs(self, jwttoken):
		db = DB()
		res = db.getSubList(jwt.decode(jwttoken, jwtsecret)['id'])
		return self.resp(200, {'results': res})
		del db
		
	def getnewreleases(self, jwttoken):
		db = DB()
		sublist = db.getSubList(jwt.decode(jwttoken, jwtsecret)['id'])
		rels = list()
		futures = dict()
		with concurrent.futures.ThreadPoolExecutor() as executor:
			for i in sublist:
				futures[i] = executor.submit(self.releases, i)
		for i in sublist:
			releasess = futures[i].result()
			for n in releasess:
				n.update({'artist': i})
				rels.append(n)
		return self.resp(200, {'results': sorted(rels, key=lambda x: x['date'], reverse=True)})
		del db