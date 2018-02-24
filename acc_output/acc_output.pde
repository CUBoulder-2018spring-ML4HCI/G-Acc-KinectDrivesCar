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

void draw()
{
  background(0);
  
  text("SPEED: " + yspeed, 10, 50);
  fill(#FFFFFF);
  ellipse(xPos, 200, 40, 40);
  fill(#6FF123);
  rect(0, rectY, width, 20);
  rectY = rectY + yspeed;
  xPos=xPos+xDir*(yspeed);
  if (rectY > height){
    rectY = 0;
  }
  if (xPos>width-20 || xPos<20)
  {
    xDir=0;
  }
}

//Uncomment This and mimic the keyPressed() function above to work with OSC
//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
  print("Messagae recieved." + theOscMessage.get(0).floatValue());
 if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {
        float move = theOscMessage.get(0).floatValue();//get this parameter
        
        move = (int)move;
        
        if (move == 1){
          if (yspeed < 10) yspeed++;
        }else if(move == 2){
          if (yspeed > 0) yspeed--;
        }else if(move == 3){
           if (xPos>width-20 || xPos<20) xDir = 0; 
           else xDir = -1;
        }else if (move == 4){
           if (xPos>width-20 || xPos<20) xDir = 0; 
           else xDir = 1;
        }
        else if (move == 5) {
          yspeed = 0;
        }
        else {
          print("Error. Unhandled class.");
        }
 }
}