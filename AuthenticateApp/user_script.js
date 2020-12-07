(function () {
    const Http = new XMLHttpRequest();
    var url='http://localhost:5000/read_database/';
    Http.open("GET", url);
    Http.send("");
})()
