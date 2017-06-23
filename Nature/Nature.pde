Mover m[];
Attractor A[];
float G;
 
void setup() {
  size(880,495);
  background(255);
  m = new Mover[10];
  for(int i=0;i<m.length;i++){
    m[i] = new Mover(random(0.2),random(width),random(height));
  }
  A = new Attractor[3];
  for(int i=0;i<A.length;i++){
    A[i] = new Attractor();
  }
  
}
 
void draw() {
  //background(255);
  for(int i=0;i<A.length;i++){
    A[i].display();
  }
  for(int i=0;i<m.length;i++){
    for(int j=0;j<A.length;j++){
      PVector force = A[j].attract(m[i]);
      m[i].applyForce(force);
    }
    m[i].update();
    m[i].display();
  }
}
 