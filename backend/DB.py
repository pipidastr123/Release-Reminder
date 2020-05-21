import sqlite3
import os
import hashlib
import binascii


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