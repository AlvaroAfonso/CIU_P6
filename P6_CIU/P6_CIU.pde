import processing.sound.*;
import oscP5.*;
OscP5 oscP5;

PVector posePosition;
int found;
float mouthHeight;
float mouthWidth;
float poseScale;

PImage basket;
PImage ball;

float xBallMove, yBallMove, xBallPos, yBallPos;

int points = 0;

void setup() {
  size(650, 500);
  frameRate(50);
  
  basket = loadImage("canasta.png");
  ball = loadImage("bola baloncesto.jpg");
  
  xBallPos = random(width - 110) + 70;
  yBallPos = random(height - 110) + 70;
  
  xBallMove = 3;
  yBallMove = 2;
  
  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "poseScale", "/pose/scale");
  oscP5.plug(this, "posePosition", "/pose/position");
  oscP5.plug(this, "poseOrientation", "/pose/orientation");
  oscP5.plug(this, "mouthWidthReceived", "/gesture/mouth/width");
  oscP5.plug(this, "mouthHeightReceived", "/gesture/mouth/height");
  oscP5.plug(this, "eyeLeftReceived", "/gesture/eye/left");
  oscP5.plug(this, "eyeRightReceived", "/gesture/eye/right");
  oscP5.plug(this, "eyebrowLeftReceived", "/gesture/eyebrow/left");
  oscP5.plug(this, "eyebrowRightReceived", "/gesture/eyebrow/right");
  oscP5.plug(this, "jawReceived", "/gesture/jaw");
  oscP5.plug(this, "nostrilsReceived", "/gesture/nostrils");

  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  noStroke();
  fill(0);
  textSize(20);
}

void draw() {
  
  //comprobar que se detecta el rostro para poder jugar
  if(found != 1){
    //mostramos mensaje de error si no se detecta
    background(102);
    textSize(30);
    textAlign(CENTER);
    text("Check if the FaceOSC is working", width/2, height/2);
  }else if(points < 7){
    //juego
    
    background(102);
    
    help();
    
    image(basket, -posePosition.x+width, posePosition.y-mouthHeight*4, 100, 100);
    
    xBallPos += xBallMove;
    yBallPos += yBallMove;
    
    if ((xBallPos + 25 > width) || (xBallPos - 25 < 0)) {
      xBallMove *= -1;
      xBallPos += xBallMove;
    }
    if ((yBallPos + 25 > height) || (yBallPos - 25 < 0)) {
      yBallMove *= -1;
      yBallPos += yBallMove;
    }
    
    if ((xBallPos<=(0-posePosition.x)+width + mouthWidth*4) && (xBallPos>=(0-posePosition.x)+width-mouthWidth*5) && (yBallPos<=posePosition.y+mouthHeight*4) && (yBallPos>=posePosition.y-mouthHeight*4)) {
        xBallPos = random(width - 110) + 70;
        yBallPos = random(height - 110) + 70;
        points += 1;
    }
    
    image(ball, xBallPos, yBallPos, 50, 50);
    
  }else{
    //victoria
    background(102);

    textAlign(CENTER);
    textSize(50);
    text("VICTORY!!!!", width/2, height/2-100);
    textSize(30);
    text("Press R to play again", width/2, height/2+40);
  }
}

void help() {
  textAlign(LEFT);
  textSize(15);
  text("Move your head to control the game", 20, 40);
  text("Touch the ball to win a point", 20, 60);
  text("Press R to restart game", 20, 80);
  text("7 points to win", 20, 100);
  text("Note: Open the mouth a little bit so the basket get stable", 20, height - 20);

  textAlign(CENTER);
  textSize(25);
  text("Points", width - 90, height - 20);
  text(points, width - 40, height - 20);
}

public void mouthWidthReceived(float w) {
  mouthWidth = w;
}

public void mouthHeightReceived(float h) {
  mouthHeight = h;
}

public void found(int i) {
  found = i;
}

public void posePosition(float x, float y) {
  posePosition = new PVector(x, y);
}

public void poseScale(float s) {
  poseScale = s;
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.isPlugged()==false) {
  }
}

void keyPressed() {
  if (key == 'R' || key == 'r') {
    xBallPos = random(width - 110) + 70;
    yBallPos = random(height - 110) + 70;
    points = 0;
  }
}
