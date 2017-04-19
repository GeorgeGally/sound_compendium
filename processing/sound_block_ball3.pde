soundIn mySound;
int num = 30;
float rxp = 0;
float ryp = 0;
BlobBall[] particle ;
float[] z = new float[num];
float[] phi = new float[num];
float[] largos = new float[num];
float radius;
float rx = 0;
float ry =0;

void setup() {
  size(800, 600, P3D);
  background(#111111);
  radius = height/4.5;
  mySound = new soundIn(this);
  particle = new BlobBall[num];
  for (int i=0; i<num; i++){
    particle[i] = new BlobBall(i);
  }
  noiseDetail(3);

}

void draw() {
  background(#ffffff);
  smooth();
  defineLights();
  translate(width/2,height/2);
  fill(#efefef);
  if (mySound.soundLevel(20)>50) {
  rxp = tween(rxp, (mySound.soundLevel(10)*1.9-0.1),10);
  ryp = tween(ryp, (mySound.soundLevel(20)*1.8-0.1),6);
//rxp += mySound.soundLevel(10)*0.02-0.1;
  //ryp += mySound.soundLevel(20)*0.02-0.1;

  //console.log(mySound.soundLevel(10))
  rx = (rx*0.09)+(rxp*0.1);
  ry = (ry*0.09)+(ryp*0.1);
  }
  rotateY(rx);
  rotateX(ry);
  noStroke();

  sphere(radius);

  for (int i=0;i<num;i++){
    particle[i].draw();
  }
}

function tween(pos, target, speed){
  if (speed == undefined) speed = 20;
  pos  += (target - pos)/speed;
  return pos;
}

void defineLights() {
  //  point light on the right
  pointLight(250, 250, 250,   // Color
        400, -230, 720); // Position

  //  directional light from the left
  //directionalLight(202, 202, 202, // Color
    //               1, 0, 0);    // The x-, y-, z-axis direction

  // spotlight from the front
  //spotLight(202, 202, 202,  // Color
    //        0, 40, 200,     // Position
    //        0, -0.5, -0.5,  // Direction
    //        PI / 2, 2);     // Angle, concentration
}

class BlobBall
{
  float z = random(-radius,radius);
  float phi = random(TWO_PI);
  float spike = random(0.15,1.8);

  float largo = random(0.15,1.5);
  float theta = asin(z/radius);
  int count;

  BlobBall(int _c) {
    count = _c;
    spike= 1.0;
  }

  void draw(){

    float level = mySound.soundLevel(count)*0.04;
    if (level>1.5) level = 1.5;
    if (level>0) largo = spike + level;
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

    float xb = xo * largo;
    float yb = yo * largo;
    float zb = zo * largo;

   // beginShape(LINES);

    fill(240);
    noStroke();
    pushMatrix();
    translate (x,y,z-z/2);
    sphere(xb/10);
    popMatrix();


}
}

    var level;

class soundIn{
  private PApplet app;

  soundIn(PApplet papplet){
    app = papplet;
  }

float soundLevel(int _s){
  // return audioChannelVolume[_s]*10;
  return Sound.mapSound(_s, 30, 0, 20);
}


}
