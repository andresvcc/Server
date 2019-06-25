/********************************************************
    App
*********************************************************
    Andres Vicente Caballero Cantillo
    Alex erne
    Projet Transversal I
    Group 5 - Système de recommendation	de produits
**********************************************************/

var express = require('express');
var path = require('path');
var logger = require('morgan');
var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);
var AirbrakeClient = require('airbrake-js');
var airbrakeExpress = require('airbrake-js/dist/instrumentation/express')

var options = {
    host: "cvktne7b4wbj4ks1.chr7pe7iynqr.eu-west-1.rds.amazonaws.com",
    port: 3306,
    user: "qcnhaabcxfs4vawh",
    password: "hzy3paln8zyfakt1",
    database: "uwim13lh799gyhlm"
};

var sessionStore = new MySQLStore(options);

const router = require('./routes/api')
const bd = require('./routes/mysql')

var app = express();
var cors = require('cors');

var airbrake = new AirbrakeClient({
    projectId: 232890,
    projectKey: 'a57cef3b28d78aa8e4df6e0217f4accb'
  });

// This middleware should be used before any routes are defined.
app.use(airbrakeExpress.makeMiddleware(airbrake))

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));
app.use(cors())
app.use('/Photo', express.static('public/images'));  
app.set('trust proxy', 1) // trust first proxy
app.use(session({
    key: 'session_cookie_name',
    secret: 'session_cookie_secret',
    store: sessionStore,
    resave: false,
    saveUninitialized: false,
    cookie  : { expires : new Date(Date.now() + (60 * 1000 * 60)) }
}));

app.use(express.static(path.join(__dirname, 'build')));
app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname, 'build', 'index.html'));
});

router.api(app, sessionStore) //envoie app vers routage de api
bd.routerMysql(app, sessionStore ) //envoie app vers routage de mysql


  
// Error handler middleware should be the last one.
// See http://expressjs.com/en/guide/error-handling.html
app.use(airbrakeExpress.makeErrorHandler(airbrake))  
module.exports = app;
