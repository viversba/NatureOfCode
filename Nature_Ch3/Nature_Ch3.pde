/*Mover m[];
Attractor A[];
Repellent R[];*/
Ship s;
float r = 0;
float theta = 0;
float G;
 
void setup() {
  size(880,495);
  background(255);
  s = new Ship(4,width/2,height/2);
}
 
void draw() {
  background(255);
  pushMatrix();
  translate(s.location.x,s.location.y);
  rotate(s.angle);
  if(keyPressed){
    if(key == 'z'){
      s.applyForce(new PVector(0,0.2,0));
      
    }
  }
  s.update();
  s.display();
  s.checkEdges();
  popMatrix();
}
 