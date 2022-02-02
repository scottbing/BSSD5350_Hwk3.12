HelperFunctions hf = new HelperFunctions();
PImage img;

int rotation = 0;
int radius = 3;
ArrayList<PVector> spots = new ArrayList<PVector>();

void setup() {
 size(640, 300, P3D); //size of canvas
 loadImagePixels("text.jpg");
 frameRate(24); //for animations draws 24 fran
 smooth(); //smooths animation frame transitic
 noLoop(); //only calls draw one time
}

void loadImagePixels(String filename){
 img = loadImage(filename);
 img.loadPixels();
 int skip = 4;
 for (int x = 0; x < img.width; x+=skip) {
  for (int y = 0; y < img.height; y+=skip) {
   int index = x + y * img.width;
   color c = img.pixels[index]; //everything is black or white
   float b = brightness(c); //get the brightness value from the color
   if (b > 1) {
   }spots.add(new PVector(x,y)); //if it is a white pixel save it
  }
 }
}


void draw() {
  lights();
  background(34);
  ColorPalette randomC = new ColorPalette(); //random color
  translate(width/2.5, height/4, 200);
  for(PVector p : spots) {
    pushMatrix();
    translate(p.x, p.y, random(-1,1));
    rotatingSphere(2);
    popMatrix();
  }
  //hf.save("img");
}

void rotatingSphere(float speed) {
  pushMatrix(); //preserve incoming world state
  //translate(width/2, height/2, -500); // center of screen then z -500
  //rotateY(radians(rotation += speed)); // update rotation with speed
  //noFill(); // wireframe sphere
  noStroke();
  //stroke(255);
  sphere(radius); // radius size
  popMatrix(); // undo all thee changes we made to the world and return to state from 21.
}