'use strict';

const express = require('express');

// Constants
const PORT = 5000;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
    res.send('Hello World');
});


app.get('/sms', function (req, res) {
    const teste = req.query.param1
    console.log(teste)
    res.set('Content-Type', 'text/plain')
    res.send(`You sent: ${teste} to Express\n`)
})

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
