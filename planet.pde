class Planet{
 float radius;
 float distance;
 float angle;
 Planet[] childPlanets;
 float orbitSpeed;
 PVector v,v2;
 PShape globe;

 Planet(float r,float d,float o,PImage img){
   v = PVector.random3D();
   radius=r;
   distance=d;
   v.mult(d);
   angle=random(TWO_PI);
   orbitSpeed=o;
   noStroke();
   noFill();
   globe = createShape(SPHERE,radius);
   globe.setTexture(img);
   
 }
 
  void addPlanets(int total,int level){
   childPlanets=new Planet[total];
   for(int i=0;i<total;i++){
     float r=radius*0.5;
     float d=random(100/(level+1),200);
     float o=random(-0.05,0.05);
     //PImage img = loadImage("sunmap.jpg");
     int index = int(random(0,Texture.length));
     
     childPlanets[i]=new Planet(r,d,o,Texture[index]);
     if(level<1){
       int child=int(random(0,4));
       childPlanets[i].addPlanets(child,level+1);
     }
   }
  }
  
  void orbit(){
    angle=angle+orbitSpeed;
    if(childPlanets !=null){
    for(int i=0;i<childPlanets.length;i++){
      childPlanets[i].orbit();
    }
   }
  }
 
 void show(){
  pushMatrix();
  PVector v2 = new PVector(1,0,1);//(到太陽的向量)
  PVector p = v.cross(v2);//(當時旋轉的向量)
  rotate(angle,p.x,p.y,p.z);
  translate(v.x,v.y,v.z);
  noStroke();
  fill(255);
  rotate(angle);
  //translate(distance,0);
  shape(globe);
  //sphere(radius);
  //ellipse(0,0,radius*2,radius*2);
  if(childPlanets !=null){
    for(int i=0;i<childPlanets.length;i++){
      childPlanets[i].show();
    }
  }
  popMatrix();
 }
}
