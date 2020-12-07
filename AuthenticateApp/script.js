(function() {
    var width = 500;
    var height = 0;
  
    var streaming = false;
  
    var video = null;
    var canvas = null;
    var startbutton = null;

    var cnp = null;
    var state = 0;
    var succeeded = 0;
    var url = null;
    var counter = 0;

    var t = document.createTextNode("Hello World");
  
    function startup() {
        textbox = document.getElementById("textbox");
        video = document.getElementById('video');
        canvas = document.getElementById('canvas');
        startbutton = document.getElementById('startbutton');

        navigator.mediaDevices.getUserMedia({video: true, audio: false})
                              .then(function(stream) {
                                  video.srcObject = stream;
                                  video.play();
                              })
                              .catch(function(err) {
                                  console.log("An error occurred: " + err);
                              });

        video.addEventListener('canplay', function(ev) {
            if (!streaming) {
                height = video.videoHeight / (video.videoWidth/width);
            
                if (isNaN(height)) {
                    height = width / (4/3);
                }
            
                video.setAttribute('width', width);
                video.setAttribute('height', height);
                canvas.setAttribute('width', width);
                canvas.setAttribute('height', height);
                streaming = true;
            }
        }, false);

        startbutton.addEventListener('click', function(ev){
            takepicture();
            ev.preventDefault();
        }, false);
        
        clearphoto();

        console.log("Please take a photo of your identity card");
        textbox.textContent = "Please take a photo of your identity card";
    }
  
    function clearphoto() {
      var context = canvas.getContext('2d');
      context.fillStyle = "#AAA";
      context.fillRect(0, 0, canvas.width, canvas.height);
  
      var data = canvas.toDataURL('image/png');
    }
  
    function takepicture() {
        var context = canvas.getContext('2d');
        if (width && height) {
            canvas.width = width;
            canvas.height = height;
            context.drawImage(video, 0, 0, width, height);

            var data = canvas.toDataURL();

            const Http = new XMLHttpRequest();
            var url='http://localhost:5000';

            if (succeeded == 1) {
                state++;
                succeeded = 0;
            }

            switch (state) {
                case 0:
                    url = 'http://localhost:5000/first_photo'
                    break;
                case 1:
                    url = 'http://localhost:5000/second_photo'
                    break;
                case 2:
                    url = 'http://localhost:5000/third_photo'
                    break;
                default:
                    break;
            }
            

            Http.open("POST", url);
            Http.send(JSON.stringify({"image": data}));

            Http.onreadystatechange = (e) => {
                counter++;
                counter = counter % 2

                if (counter == 0) {
                      if (Http.responseText.length == 13 || Http.responseText == "Success") {

                        if (state == 0) {
                            var confirmed = confirm("Proceed with this CNP?\n" + Http.responseText);

                            if (confirmed) {
                                succeeded = 1;
                                console.log(Http.responseText);

                                console.log("Please take a photo of yourself with your eyes opened");
                                textbox.textContent = "Please take a photo of yourself with your eyes opened";
                            }
                        }
                        else if (state == 1) {
                            succeeded = 1;
                            console.log(Http.responseText);

                            console.log("Please take a photo of yourself with your eyes closed and slightly change position");
                            textbox.textContent = "Please take a photo of yourself with your eyes closed and slightly change position";

                        }
                        else {
                            location.replace("http://localhost:8080/main_page.html");
                        }

                        
                      }
                      else {
                        switch (state) {
                        case 0:
                            console.log("Couldn't identify text. Please try again");
                            textbox.textContent = "Couldn't identify text. Please try again";
                            break;
                        case 1:
                            if (Http.responseText == "EyesClosed") {
                                console.log("Opened eyes not found");
                                textbox.textContent = "Opened eyes not found";
                            }
                            else {
                                console.log("Face doesn't match. Please try again");
                                textbox.textContent = "Face doesn't match. Please try again";
                            }

                            break;
                        case 2:
                            if (Http.responseText == "EyesOpened") {
                                console.log("Closed eyes not found");
                                textbox.textContent = "Closed eyes not found";
                            }
                            else if (Http.responseText == "SimilarImage") {
                                console.log("Images are similar. Please try switching your position");
                                textbox.textContent = "Images are similar. Please try switching your position";
                            }
                            else {
                                console.log("Face doesn't match. Please try again");
                                textbox.textContent = "Face doesn't match. Please try again";
                            }
                            break;
                        default:
                            break;
                        }
                    }
                }

              
            }
            
        } else {
            clearphoto();
        }
    }

    window.addEventListener('load', startup, false);
})();
