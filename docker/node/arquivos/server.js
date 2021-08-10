var express = require('express')
var http = require('http')
var path = require('path')
var reload = require('reload')
var bodyParser = require('body-parser')
var logger = require('morgan')
const fs = require('fs');

var app = express()

app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');

var publicDir = path.join(__dirname, 'public')

app.set('port', 5000)
app.use(logger('dev'))
app.use(bodyParser.json()) // Parses json, multi-part (file), url-encoded

app.get('/monografia', function (req, res) {
    var name = req.query.param1;
    console.log(name)
    fs.writeFileSync('colors.txt', name);
    res.send("Monografia!!")
})

app.get('/', function (req, res) {
    let rawdata = fs.readFileSync('colors.txt');
    console.log(rawdata);
    res.render(path.join(publicDir, 'index.html'), { name: rawdata })
})

var server = http.createServer(app)

// Reload code here
reload(app).then(function (reloadReturned) {
    // reloadReturned is documented in the returns API in the README

    // Reload started, start web server
    server.listen(app.get('port'), function () {
        console.log('Web server listening on port ' + app.get('port'))
    })
}).catch(function (err) {
    console.error('Reload could not start, could not start server/sample app', err)
})