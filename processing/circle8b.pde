
float circSize= 30;
float t  = 0;
int numDots = 120;
 Circ[] circs;
 soundIn mySound;
      void setup()  {
        size(window.innerWidth-100,window.innerHeight);
        background(#fafafa);
        smooth();
        strokeWeight(0.5);
        circs = new Circ[numDots];
        mySound = new soundIn(this);
        for (int i=0; i<numDots; i++){
          circs[i] = new Circ(t, i);
           t  +=  radians(360/numDots);
        }
        for (int i=0; i<numDots; i++){
           circs[i].draw(80);
        }
    }

   void draw()  {
  background(#fafafa);
     // Polar to Cartesian conversion
     //rotate(radians(frameCount/10));
     for (int i=0; i<numDots; i++){
       float vol = mySound.soundLevel(i,numDots)*1;
       //console.log(vol);
        if (vol>22) vol = 22 + random(-2,2);
       circs[i].draw(vol);
      //}

     }


     }


// int buff = 6000;
var level;

class soundIn{
  private PApplet app;

  soundIn(PApplet papplet){
    app = papplet;
  }


  float soundLevel(int _s, int _n) {
    //console.log(mic.getSprectrum(_s));
    return Sound.mapSound(_s, _n)*0.5;

  }

}



class Circ {
 float x,y, theta;
     float r;
     int me;
 Circ(float _theta, int _me){
  x      =      r * cos(theta);
  y      =      r * sin(theta);
  theta=_theta;
   r = 80;
   me = _me;
 }

  void draw(float _rr){

    noStroke();
    r=120+_rr;
    noFill();
    stroke(0,100);
    ellipse(x+width/2, y+height/2, r/2, r/2);
    fill(0);
    ellipse(x+width/2, y+height/2, 2, 2);
    stroke(0);
    pushMatrix();
      translate(width/2, height/2);
      x      =      r * cos(theta);
      y      =      r * sin(theta);
    popMatrix();

  }


}
