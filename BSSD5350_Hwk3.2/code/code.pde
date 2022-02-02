HelperFunctions hf = new HelperFunctions();

void setup() {
 size(640, 300); //size of canvas
 background(0);
 frameRate(24); //for animations draws 24 fran
 smooth(); //smooths animation frame transitic

 //noLoop(); //only calls draw one time
}

int rotation = 0;
void draw() {
  ColorPalette randomC = new ColorPalette();
  noStroke();
  fill(randomC.getBaseColor());
  pushMatrix();
  drawSquare();
  translate(10,10);
  drawSquare();
  translate(30,30);
  scale(4);
  drawSquare();
  popMatrix();
  translate(width/2, height/2);
  rotate(radians(rotation++));
  drawSquare();
  //hf.save("img");
}

void drawSquare() {
  rectMode(CENTER);
 rect(0,0,width/16, height/16);
}
