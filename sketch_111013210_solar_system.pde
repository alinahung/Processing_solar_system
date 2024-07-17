//111013210 洪郁涵

PImage sunTexture;
import peasy.*;
float r=0;
Planet sun;
PeasyCam cam;
PImage[] Texture = new PImage[8];

void setup(){
  size(600,600,P3D);
  sunTexture = loadImage("sunmap.jpg");
  Texture[0] = loadImage("earthmap1k.jpg");
  Texture[1] = loadImage("jupitermap.jpg");
  Texture[2] = loadImage("marsmap1k.jpg");
  Texture[3] = loadImage("moonmap1k.jpg");
  Texture[4] = loadImage("neptunemap.jpg");
  Texture[5] = loadImage("plutomap1k.jpg");
  Texture[6] = loadImage("saturnmap.jpg");
  Texture[6] = loadImage("mercurymap.jpg");
  cam = new PeasyCam(this,500);
  sun=new Planet(50,0,0,sunTexture);//r,d
  sun.addPlanets(3,0);
}

void draw(){
  background(0);
  lights();
  //translate(width/2,height/2);
  sun.show();
  sun.orbit();
}
