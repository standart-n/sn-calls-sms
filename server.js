// Generated by CoffeeScript 1.6.2
var app, express, http, path, routes;

express = require('express');

http = require('http');

path = require('path');

global.controls = require('./public/js/controls');

global.dbsettings = require('./conf/database.json');

global.appsettings = require('./settings/sms.json');

routes = require('./public/js/routes');

global.program = {
  firebird: true,
  remove: true,
  debug: false
};

app = express();

app.configure(function() {
  app.set('port', process.env.PORT || 7072);
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  return app.use(express["static"](__dirname));
});

app.configure('development', function() {
  return app.use(express.errorHandler());
});

app.get('/', routes.index);

http.createServer(app).listen(app.get('port'), function() {
  return console.log("server work at http://localhost:" + app.get('port'));
});
