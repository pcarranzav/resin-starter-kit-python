var app = require('express')();
console.log('Hello world!');

app.get('/', function (req, res) {
	res.send('Hello World!');
});

var server = app.listen(80, function(){
	console.log('Server running on port 80.');
})
