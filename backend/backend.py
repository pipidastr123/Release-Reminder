import pylast
#import sqlite3
import requests
import flask
from werkzeug.exceptions import HTTPException
import json

API_KEY = "KEY"
API_SECRET = "SECRET"

network = pylast.LastFMNetwork(api_key=API_KEY, api_secret=API_SECRET)

app = flask.Flask(__name__)

def search(name):
	results = network.search_for_artist(name)
	artists=list()
	for res in results.get_next_page():
		artists.append(res.name)
	return artists


def releases(name):
	mbid = network.get_artist(name).get_mbid()
	if mbid == None:
		return []
	r = requests.get(url = "http://musicbrainz.org/ws/2/release?artist="+network.get_artist(name).get_mbid()+"&limit=100&fmt=json&status=official")
	releases = r.json()['releases']
	releases = [v for v in releases if 'date' in v.keys()]
	releases = sorted(releases, key=lambda x: x['date'], reverse=True)
	result = list()
	for release in releases:
		result.append({k: release[k] for k in ('date', 'title')})
	return [i for n, i in enumerate(result) if i not in result[n + 1:]]
		
def getTracks(name, artist):
	tracks = network.get_album(artist, name).get_tracks()
	result = list()
	for i in tracks:
		result.append(i.get_name())
	return result
	
	
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

@app.errorhandler(Exception)
def handle_error(e):
    code = 500
    if isinstance(e, HTTPException):
        code = e.code
    return resp(code, {'error': str(e)})
    
@app.route('/1.0/search/<string:name>', methods=['GET'])
def api_search(name):
    return resp(200, {'results': search(name)})
    	
@app.route('/1.0/releases/<string:name>', methods=['GET'])
def api_releases(name):
    return resp(200, {'results': releases(name)})
    	
@app.route('/1.0/tracks/<string:artist>/<string:album>', methods=['GET'])
def api_tracks(artist, album):
    return resp(200, {'results': getTracks(album, artist)})
    	
#app.debug = True  # enables auto reload during development
app.run()