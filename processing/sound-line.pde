import processing.opengl.*;
import javax.media.opengl.*;
PGraphicsOpenGL pgl;
GL gl;
color c;
float noiseScale=0.02;
   float circSize= 4;
   float t  =      0;
 int numDots = 460;
 Circ[] circs;
 soundIn mySound;
      void setup()  {
        size(800,600);
        background(#f3f3f3);
       //smooth();
      //  colorMode(RGB,255);

        circs = new Circ[numDots];
        mySound = new soundIn(this);
        for (int i=0; i<numDots; i++){
          circs[i] = new Circ(i, i);
           t  +=  radians(i);
        }
    }

void draw()  {

  //background(255,255,255,0.1);
  fill(225,20);
  rect(0,0, width, height);
  noStroke();
  strokeWeight(1);

  for (int i=0; i<numDots; i++){
  //c = color(random(10),random(255),0,100);
  //c = color(random(255),0,0);
  c = color(random(255),random(255));
      //  c = color(0,20);
     stroke(c);
     fill(c);

     float vol = mySound.soundLevel(i)*1.5;
     //if (vol>120) vol = 120 + random(-2,2);
       circs[i].draw(vol);

     }
      noStroke();
//fill(0);
//ellipse(width/2,height/2,200,200);
     }
 // int buff = 6000;
var level;

class soundIn{
  private PApplet app;

  soundIn(PApplet papplet){
    app = papplet;
  }

  float soundLevel(int _s){
    return Sound.mapSound(_s, 460);
  }


}


class Circ {
  float x,y, theta;
  float r;
  int me;
  color myCol;

  Circ(float _theta, int _me){
    x      =      r * cos(theta);
    y      =      r * sin(theta);
    theta=_theta;
    r = 60;
    me = _me;
  }

  void draw(float _vol){
    //   noStroke();
    r=_vol*0.9;
    // fill(0);

noFill();
pushMatrix();
translate(width/2, height/2);
rotate(radians(r));
//stroke(vol);
  //  if (x> -width/2 && y> -height/2) {
    //ellipse(x+width/2, y+height/2, _vol/10, _vol/10); // Adjust for center of window
    line(-r*15, -r*15, r*15, r*15); // Adjust for center of window
    //stroke(myCol);
    // stroke(0,2);
 // }




    x      =      r * cos(theta);
    y      =      r * sin(theta);

    popMatrix();
  }


}
