import flask

app = flask.Flask(__name__)

import api10 #1.0

#app.debug = True  # enables auto reload during development
app.run()