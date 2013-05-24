
express = require 'express'
http = require 'http'
path = require 'path'
global.controls = require './public/js/controls'
global.dbsettings = require './conf/database.json'
global.appsettings = require './settings/sms.json'
routes = require './public/js/routes'

global.program =
	firebird: on
	remove: on
	debug: off

app = express()

app.configure ->
	app.set 'port', process.env.PORT || 7072
	app.use express.logger 'dev'
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use app.router
	app.use express.static __dirname

app.configure 'development', () ->
	app.use express.errorHandler()


app.get '/', routes.index


http.createServer(app).listen app.get('port'), () ->
	console.log "server work at http://localhost:" + app.get('port')

