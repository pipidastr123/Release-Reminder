from werkzeug.exceptions import HTTPException
from Releases import Releases
from __main__ import app

version = '1.0'

releases = Releases()

@app.route('/')
def root():
    return releases.resp(200, {'message': 'Welcome to the Kursa4 API server'})

@app.errorhandler(400)
def bad_request(e):
    return releases.resp(400, {'error': 'Bad request (400)'})

@app.errorhandler(404)
def page_not_found(e):
    return releases.resp(404, {'error': 'Well, 404 and 404, why murmur about it?'})
    	
@app.errorhandler(Exception)
def handle_error(e):
    code = 500
    if isinstance(e, HTTPException):
        code = e.code
    return releases.resp(code, {'error': str(e)})
    
@app.route('/'+version+'/search/<string:name>', methods=['GET'])
def api_search(name):
    return releases.resp(200, {'results': releases.search(name)})
    	
@app.route('/'+version+'/releases/<string:name>', methods=['GET'])
def api_releases(name):
    return releases.resp(200, {'results': releases.releases(name)})
    	
@app.route('/'+version+'/tracks/<string:artist>/<string:album>', methods=['GET'])
def api_tracks(artist, album):
    return releases.resp(200, {'results': releases.getTracks(album, artist)})

@app.route('/'+version+'/login/<string:username>/<string:password>', methods=['GET'])
def api_login(username, password):
		return releases.login(username, password)
		
@app.route('/'+version+'/register/<string:username>/<string:password>', methods=['GET'])
def api_register(username, password):
		return releases.register(username, password)
    	
@app.route('/'+version+'/addsub/<string:artist>', methods=['GET'])
def api_addsub(artist):
		return releases.addsub(flask.request.headers.get('Token'), artist)

@app.route('/'+version+'/delsub/<string:artist>', methods=['GET'])
def api_delsub(artist):
		return releases.delsub(flask.request.headers.get('Token'), artist)

@app.route('/'+version+'/getsubs', methods=['GET'])
def api_getsubs():
		return releases.getsubs(flask.request.headers.get('Token'))

@app.route('/'+version+'/myreleases', methods=['GET'])
def api_getnewreleases():
		return releases.getnewreleases(flask.request.headers.get('Token'))