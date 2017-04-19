
soundIn mySound;
int num = 100;
float r;
Ball[] spikes ;
float[] z = new float[num];
float[] phi = new float[num];
float[] spike_lengths = new float[num];
float radius = 200;
float rx = 0;
float ry =0;

void setup() {
  size(800, 600, P3D);
  //size(800, 600);
  radius = height/5.2;
  mySound = new soundIn(this);
  spikes = new Ball[num];
  for (int i=0; i<num; i++){
    spikes[i] = new Ball(i);
  }
  // noiseDetail(3);
}

void draw() {
  background(0);
  lights();
  translate(width/2,height/2);

  rotateY(radians(r));
  r+=0.5;
  // radius -= 0.2;
  float rxp = ((mouseX-(width/2))*0.005);
  float ryp = ((mouseY-(height/2))*0.005);
  rx = (rx*0.9)+(rxp*0.1);
  ry = (ry*0.9)+(ryp*0.1);
  rotateY(rx);
  rotateX(ry);
  fill(0);
  noStroke();
  sphere(radius);


  for (int i=0;i<num;i++){
     spikes[i].drawMe();
   }

}


var level;

class soundIn{
  private PApplet app;

  soundIn(PApplet papplet){
    app = papplet;
  }

float soundLevel(int _s){
  //console.log(audioChannelVolume[_s]*0.01);
  return Sound.spectrum[_s]*0.01;

}

}



class Ball
{
  float z = random(-radius,radius);
  float phi = random(TWO_PI);
  float spike = 1;
  float sw;
  float spike_length = random(1);
  float theta = asin(z/radius);
int count;
Ball(int _c) {
  count = _c;
  spike= 1.2;
  sw= random(0.4,3);
}
    void drawMe(){
    spike_length = spike + abs(mySound.soundLevel(count)*0.2);
    if (spike_length > 2.5) spike_length = 2.5;
    float off =  0;
    float offb = 0;

    float thetaff = theta+off;
    float phff = phi+offb;
    float x = radius * cos(theta) * cos(phi);
    float y = radius * cos(theta) * sin(phi);
    float z = radius * sin(theta);
    float msx= screenX(x,y,z);
    float msy= screenY(x,y,z);

    float xo = radius * cos(thetaff) * cos(phff);
    float yo = radius * cos(thetaff) * sin(phff);
    float zo = radius * sin(thetaff);

    float xb = xo * spike_length;
    float yb = yo * spike_length;
    float zb = zo * spike_length;

    stroke(0);
    strokeWeight(sw);
    stroke(200);
    line(x,y,z, xb,yb,zb);


}
}
