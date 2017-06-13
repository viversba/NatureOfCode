Mover m[];
Attractor A;
float G;
 
void setup() {
  size(880,495);
  background(255);
  m = new Mover[30];
  for(int i=0;i<m.length;i++){
    m[i] = new Mover(random(3),random(width),random(height));
  }
  A = new Attractor();
}
 
void draw() {
  background(255);
  A.display();
  for(int i=0;i<m.length;i++){
    PVector force = A.attract(m[i]);
    m[i].applyForce(force);
    m[i].update();
    m[i].display();
  }
}
 