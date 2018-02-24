import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;

int xPos=200;
int xDir=0;
int yDir=0;
int yPos=200;
int speed=1;
int yspeed=1;
int rectY = 0;

void setup()
{
  oscP5 = new OscP5(this, 9000);
  size (400,400);
  smooth();
  background(0);
  noStroke();
  fill(0,255,0);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      yspeed++;
    } else if (keyCode == DOWN) {
      yspeed--;
    } else if (keyCode == RIGHT){
      xDir = 1;
      //xPos = xPos + 5;
    } else if (keyCode == LEFT) {
      xDir = -1; 
      //xPos = xPos - 5;
    }
  } 
}

void draw() {
  background(0);

  text("SPEED: " + yspeed, 10, 50);
  fill(#FFFFFF);
  ellipse(xPos, 200, 40, 40);
  fill(#6FF123);
  rect(0, rectY, width, 20);
  rectY = rectY + yspeed;
  xPos=xPos+xDir*(yspeed);
  if (rectY > height) rectY = 0;
  if (xPos>width-20 || xPos<20) xDir=0;
}

//Uncomment This and mimic the keyPressed() function above to work with OSC
//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
  //print("Messagae recieved." + theOscMessage.get(0).floatValue());
  if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {
    float whichMove = theOscMessage.get(0).floatValue();//get this parameter
    float movex = theOscMessage.get(1).floatValue();//get this parameter
    float movey = theOscMessage.get(2).floatValue();//get this parameter
    float movez = theOscMessage.get(3).floatValue();//get this parameter

    whichMove = (int) whichMove; //3 categories
    movex = (int)movex;
    movey = (int)movey;
    movez = (int)movez; //2 categories

    //format:
    //x - 1 left 2 right
    //y - 1 high 2 low
    //z - 1 forward 2 back
    
    //if we detected a motion that looks like an arm left movement - x
    if (whichMove == 1) {
      //go positive or negative direction
      if(movex == 1){
        if (xPos>width-20 || xPos<20) xPos = xPos - 2;//xDir = 0; 
        else xDir = -1;
      }
      else if (movex == 2){
        if (xPos>width-20 || xPos<20) xPos = xPos + 2; 
        else xDir = 1;
      }
    }

    //if we detected a motion that looks like a arm down movement - y
    else if (whichMove == 2) {
      if (movey == 1) {
        println("Beep beep! The horn honks.");
      }
      //emergency break only if category 2
      else if (movey == 2) {
        yspeed = 0;
      }
    }
        //if we detected a motion that looks like a arm forward movement - z
    else if (whichMove == 3) {
      //increase or decrease speed
      if (movez == 1){
        if (yspeed < 10) yspeed++;
      }else if(movez == 2){
        if (yspeed > 1) yspeed--;
      }
    }
  }
}