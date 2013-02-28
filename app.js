// Generated by CoffeeScript 1.5.0
var app, express, http, jade, path, routes;

express = require('express');

jade = require('jade');

global.controls = require('./js/controls');

global.dbsettings = require('./conf/database.json');

routes = require('./js/routes');

http = require('http');

path = require('path');

app = express();

app.configure(function() {
  app.set('port', process.env.PORT || 2527);
  app.set('views', __dirname + '/jade');
  app.set('view engine', 'jade');
  app.use(express.cookieParser());
  app.use(express.session)({
    secret: 'asfa',
    cookie: {
      path: '/',
      httpOnly: true,
      maxAge: 1000 * 60 * 60 * 24
    }
  });
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
  return console.log("Express server listening on port " + app.get('port'));
});
