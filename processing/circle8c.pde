
float circSize= 30;
float t = 0;
int numDots = 80;
Circ[] circs;
soundIn mySound;

void setup()  {
    size(800,600);
    background(#f7f7f7);
    smooth();
    strokeWeight(0.5);
    circs = new Circ[numDots];
    mySound = new soundIn(this);
    for (int i=0; i<numDots; i++){
      circs[i] = new Circ(t, i);
      t += radians(360/numDots);
      circs[i].draw(60);
    }
  }

void draw()  {
  background(#f7f7f7);
  for (int i=0; i<numDots; i++){
    circs[i].draw(mySound.soundLevel(i, numDots)*0.2);
  }
}



class soundIn{

  private PApplet app;

  soundIn(PApplet papplet){
    app = papplet;
  }

  float soundLevel(int _s, int _n){
    return Sound.mapSound(_s, _n, 20, 80);
  }

}




class Circ {
 float x,y, theta;
 float r;
 int me;
 Circ(float _theta, int _me){
  x = r * cos(theta);
  y = r * sin(theta);
  theta=_theta;
  r = 80;
  me = _me;
 }

 void draw(float _rr){
    noStroke();
    r=80+_rr;
    noFill();
    stroke(0);
    ellipse(x+width/2, y+height/2, _rr+8, _rr+8);
    fill(0);
    ellipse(x+width/2, y+height/2, 2, 2);
    stroke(0);
    x = r * cos(theta);
    y = r * sin(theta);
  }


}
