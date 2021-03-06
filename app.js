
/**
 * Module dependencies.
 */

require("coffee-script");
require("express-namespace");


var express = require('express')
  , http = require('http')
  , path = require('path')
  , mongoose = require("mongoose");

mongoose.connect("mongodb://social:Qwer5tgb@alex.mongohq.com:10013/social-research");

var app = express();

app.configure(function(){
  app.set('port', process.env.PORT || 3000);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  
  app.use(require("connect-assets")());
  app.use(require('stylus').middleware(__dirname + '/public'));
  app.use(express.static(path.join(__dirname, 'public')));

});

app.configure('development', function(){
  app.use(express.errorHandler());
});

app.configure('test', function (){
  app.use('port', process.env.PORT + 1 || 3001);
});


require("./apps/risk_management/routes")(app);
require("./apps/risk_management/routes/api-metacategories")(app);
require("./apps/risk_management/routes/api-categories")(app);
require("./apps/risk_management/routes/api-texts")(app);
require("./apps/risk_management/routes/api-severities")(app);
require("./apps/risk_management/routes/api-probabilities")(app);
require("./apps/risk_management/routes/api-risks")(app);

http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});
