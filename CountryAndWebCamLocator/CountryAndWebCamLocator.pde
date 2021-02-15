import ipcapture.IPCapture;

PImage backgroundMap;
IPCapture webcamera;

void setup() {
  size(1024, 512);
  backgroundMap = loadImage("World Map 02 - Mercator.jpg");
  imageMode(CENTER);
}

void draw(){
  background(backgroundMap);
  if (webcamera != null){
    if (webcamera.isAvailable()) {
      webcamera.read();
    }
    image(webcamera, width / 2, height /2, 640, 360);
  }
}

// When the mouse is clicked, lookup what country's coordinates match the x and y position of the mouse
// Print that country's name to the console
//find the closest webcamera that corresponds to the mouse position
// Create an IPCapture object to connect to the webcamera, and start the camera
void mouseClicked(){
  float whereLatitude = map(mouseY, 0, height, 90, -90);
  float whereLongitude = map(mouseX, 0, width, -180, 180);
  println(lookupCountry(whereLatitude, whereLongitude));
  String webcamURL = webcamClosestTo(mouseX, mouseY);
  webcamera = new IPCapture(this, webcamURL, "","");
  webcamera.start();
}

//When a key is pressed, if a camera is active/has been started, stop it.
//Null value is assigned to webcamera so that when the camera is null, no image will be drawn
void keyPressed(){
  if (webcamera != null && webcamera.isAlive()) {
    webcamera.stop();
  }
  webcamera = null;
}
