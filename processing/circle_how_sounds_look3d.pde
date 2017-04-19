import processing.opengl.*;
import javax.media.opengl.*;
PGraphicsOpenGL pgl;
GL gl;
color c;
float noiseScale=0.02;
float circSize= 4;
float t  =      0;
 int numDots = 360;
 Circ[] circs;
 soundIn mySound;
      void setup()  {
        size(800,600);
        background(#f7f7f7);
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
 // background(255);
  noStroke();
  fill(240,5);
  rect(0,0, width, height);

//fill(0,10);
//rect(0,0, width, height);
  strokeWeight(1);

  for (int i=0; i<numDots; i++){
  //c = color(random(10),random(255),0,100);
  //c = color(random(255),0,0);
  c = color(random(255),random(255));
  stroke(c);
  fill(c);

  float vol = mySound.soundLevel(i)*1.2+random(-25,25);
  if (vol>220) vol = 220 + random(-50,50);
    circs[i].draw(vol);
  }
  noStroke();
  //fill(0);
  //ellipse(width/2,height/2,200,200);
     }

var level;

class soundIn{
  private PApplet app;

  soundIn(PApplet papplet){
    app = papplet;
  }

  float soundLevel(int _s){
    //return audioChannelVolume[_s]*1;
    return Sound.mapSound(_s, 360);
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
    //myCol = color(random(255),255,255);

  }

  void draw(float _vol){
    //   noStroke();
    r=_vol;
    // fill(0);

noFill();
if (random(10) > 7) {
    fill(0); _vol/=2;
    }
    if (x> -width/2 && y> -height/2) {
    ellipse(x+width/2, y+height/2, _vol/10, _vol/10); // Adjust for center of window
    //stroke(myCol);
    // stroke(0,2);
  }
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(r+_vol));

    x      =      r * cos(theta+_vol);
    y      =      r * sin(theta+_vol);

    popMatrix();
  }


}
