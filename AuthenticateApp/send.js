var http = require('http');
var server = http.createServer ( function(request,response){

response.writeHead(200,{"Content-Type":"text\plain"});
if(request.method == "GET")
    {
        response.end("received GET request.")
    }
else if(request.method == "POST")
    {
        response.end("received POST request.");
    }
else
    {
        response.end("Undefined request .");
    }
    console.log(request);
});

server.listen(5000);
console.log("Server running on port 5000");
