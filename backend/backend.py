# TODO: total code cleanup!

import pylast
import sqlite3
import requests
import hashlib
import binascii
import flask
import os
from werkzeug.exceptions import HTTPException
import json
import jwt

jwtsecret = 'SECRET'
API_KEY = 'SECRET'
API_SECRET = 'SECRET'

class DB:
	def __init__(self):
		self.conn = sqlite3.connect("kursa4.db")
		self.cursor = self.conn.cursor()
		self.cursor.execute("""CREATE TABLE IF NOT EXISTS users
                  (id integer primary key autoincrement,
                   username text, password text)
                   """)
		self.cursor.execute("""CREATE TABLE IF NOT EXISTS subscriptions
                  (id integer,
                   artist text)
                   """)
		self.conn.commit()
	def __del__(self):
		self.conn.close()
	
	def hash_password(self, password):
		salt = hashlib.sha256(os.urandom(60)).hexdigest().encode('ascii')
		pwdhash = hashlib.pbkdf2_hmac('sha512', password.encode('utf-8'), salt, 100000)
		pwdhash = binascii.hexlify(pwdhash)
		return (salt + pwdhash).decode('ascii')

	
	def verify_password(self, stored_password, provided_password):
		salt = stored_password[:64]
		stored_password = stored_password[64:]
		pwdhash = hashlib.pbkdf2_hmac('sha512', 
                                  provided_password.encode('utf-8'), 
                                  salt.encode('ascii'), 
                                  100000)
		pwdhash = binascii.hexlify(pwdhash).decode('ascii')
		return pwdhash == stored_password
	
	def checkUserExists(self, username):
		self.cursor.execute("SELECT id FROM users WHERE username = ?", (username,))
		return self.cursor.fetchone() is not None
		
	def regUser(self, username, password):
		username = str(username)
		password = str(password)
		if not self.checkUserExists(username):
			if len(username)<3 or len(username)>20:
				 raise ValueError('Incorrect username length')
				 return False
			if len(password)<3 or len(password)>20:
				 raise ValueError('Incorrect password length')
				 return False
			self.cursor.execute("INSERT INTO users (username, password) VALUES (?, ?)", (username, self.hash_password(password),))
			self.conn.commit()
			return True
		raise ValueError('User already exists')
		return False
	
	def login(self, username, password):
		username = str(username)
		password = str(password)
		self.cursor.execute("SELECT password FROM users WHERE username = ?", (username, ))
		userrec = self.cursor.fetchone()
		if userrec is None:
			return False
		return self.verify_password(userrec[0], password)
	
	def getUserID(self, username):
		username = str(username)
		self.cursor.execute("SELECT id FROM users WHERE username = ?", (username, ))
		userrec = self.cursor.fetchone()
		if userrec is None:
			return None
		return int(userrec[0])
		
	def checkSubExists(self, userid, sub):
		self.cursor.execute("SELECT id FROM subscriptions WHERE id = ? AND artist = ?", (userid,sub, ))
		return self.cursor.fetchone() is not None
	
	def addSub(self, userid, sub):
		if not self.checkSubExists(userid, sub):
			userid = int(userid)
			sub = str(sub)
			self.cursor.execute("INSERT INTO subscriptions (id, artist) VALUES (?, ?)", (userid, sub, ))
			self.conn.commit()
			return True
		else:
			raise ValueError('Already subscribed')
			return False
		
	def delSub(self, userid, sub):
		userid = int(userid)
		sub = str(sub)
		self.cursor.execute("DELETE FROM subscriptions WHERE id = ? AND artist = ?", (userid, sub, ))
		self.conn.commit()
		return True
		
	def getSubList(self, userid):
		userid = int(userid)
		self.cursor.execute("SELECT artist FROM subscriptions WHERE id = ?", (userid, ))
		subrec = self.cursor.fetchall()
		if subrec is None:
			return None
		return [rec[0] for rec in subrec]


network = pylast.LastFMNetwork(api_key=API_KEY, api_secret=API_SECRET)

app = flask.Flask(__name__)

def search(name):
	results = network.search_for_artist(name)
	artists=list()
	for res in results.get_next_page():
		artists.append(res.name)
	return artists
	

def getCoverArt(mbid):
	r = requests.get(url = "http://coverartarchive.org/release/"+mbid)
	if r.status_code != 200:
		return None
	jimages = r.json()['images'][0]
	jimages['thumbnails']['full'] = jimages['image']
	images = jimages['thumbnails']
	return images



def releases(name, dosort = True):
	mbid = network.get_artist(name).get_mbid()
	if mbid == None:
		return []
	r = requests.get(url = "http://musicbrainz.org/ws/2/release?artist="+network.get_artist(name).get_mbid()+"&limit=100&fmt=json&status=official")
	releases = r.json()['releases']
	releases = [v for v in releases if 'date' in v.keys()]
	if dosort:
		releases = sorted(releases, key=lambda x: x['date'], reverse=True)
	result = list()
	i=0
	for release in releases:
		result.append({k: release[k] for k in ('date', 'title')})
		result[i]['cover'] = getCoverArt(release['id'])
		i+=1
	return [i for n, i in enumerate(result) if i not in result[n + 1:]]
		
def getTracks(name, artist):
	tracks = network.get_album(artist, name).get_tracks()
	result = list()
	for i in tracks:
		result.append(i.get_name())
	return result
	
def login(username, password):
	db = DB()
	if db.login(username, password):
		jwttoken = jwt.encode({'user': username, 'id': db.getUserID(username)}, jwtsecret, algorithm='HS256').decode('utf-8')
		return resp(200, {'token': jwttoken})
	else:
		return resp(500, {'error': 'no such user'})
	del db
	
def resp(code, data):
    return flask.Response(
        status=code,
        mimetype="application/json",
        response=json.dumps(data)+'\n'
    )


#print(search (input("Search: ")))
#artist = input("Releases: ")
#print (releases (artist))
#print (getTracks(input("List tracks for: "), artist))


@app.route('/')
def root():
    return resp(200, {'message': 'Welcome to the Kursa4 API server'})

@app.errorhandler(400)
def bad_request(e):
    return resp(400, {'error': 'Bad request (400)! Did u make a mistake in ur fkn JSON again?'})


@app.errorhandler(404)
def page_not_found(e):
    return resp(404, {'error': 'Well, 404 and 404, why murmur about it?'})

    
@app.route('/1.0/search/<string:name>', methods=['GET'])
def api_search(name):
    return resp(200, {'results': search(name)})
    	
@app.route('/1.0/releases/<string:name>', methods=['GET'])
def api_releases(name):
    return resp(200, {'results': releases(name)})
    	
@app.route('/1.0/tracks/<string:artist>/<string:album>', methods=['GET'])
def api_tracks(artist, album):
    return resp(200, {'results': getTracks(album, artist)})

@app.route('/1.0/login/<string:username>/<string:password>', methods=['GET'])
def api_login(username, password):
		return login(username, password)
		
@app.route('/1.0/register/<string:username>/<string:password>', methods=['GET'])
def api_register(username, password):
		db = DB()
		if db.regUser(username, password):
			return login(username, password)
		else:
			return resp(200, {'error': 'fail'})
		del db
    	
@app.route('/1.0/addsub/<string:artist>', methods=['GET'])
def api_addsub(artist):
		db = DB()
		db.addSub(jwt.decode(flask.request.headers.get('Token'), jwtsecret)['id'], artist)
		return resp(200, {'status': 'ok'})
		del db

@app.route('/1.0/delsub/<string:artist>', methods=['GET'])
def api_delsub(artist):
		db = DB()
		db.delSub(jwt.decode(flask.request.headers.get('Token'), jwtsecret)['id'], artist)
		return resp(200, {'status': 'ok'})
		del db

@app.route('/1.0/getsubs', methods=['GET'])
def api_getsubs():
		db = DB()
		res = db.getSubList(jwt.decode(flask.request.headers.get('Token'), jwtsecret)['id'])
		return resp(200, {'results': res})
		del db

@app.route('/1.0/myreleases', methods=['GET'])
def api_getnewreleases():
		db = DB()
		sublist = db.getSubList(jwt.decode(flask.request.headers.get('Token'), jwtsecret)['id'])
		rels = list()
		for i in sublist:
			releasess = releases(i)
			for n in releasess:
				n.update({'artist': i})
				rels.append(n)
		print (rels)
		return resp(200, {'results': sorted(rels, key=lambda x: x['date'], reverse=True)})
		del db

#app.debug = True  # enables auto reload during development
app.run()