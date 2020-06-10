from DB import DB
from Releases import Releases

db = DB()
releases = Releases()
for i in db.getAllUsers():
	releases.updatecache(i)