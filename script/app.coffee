
# express = require 'express'
# http = require 'http'
# path = require 'path'
# jade = require 'jade'
global.controls = require './public/js/controls'
global.dbsettings = require './conf/database.json'
global.appsettings = require './settings/sms.json'
routes = require './public/js/routes'

# app.get '/', routes.index
routes.index()