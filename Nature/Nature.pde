Mover m[];
Attractor A[];
Repellent R[];
float G;
 
void setup() {
  size(880,495);
  background(255);
  m = new Mover[10];
  for(int i=0;i<m.length;i++){
    m[i] = new Mover(2,random(width),random(height));
  }
  A = new Attractor[3];
  for(int i=0;i<A.length;i++){
    A[i] = new Attractor();
  }
  R = new Repellent[4];
  for(int i=0;i<A.length;i++){
    R[i] = new Repellent();
  }
}
 
void draw() {
  background(255);
  frameRate(60);
  for(int i=0;i<A.length;i++){
    A[i].display();
  }
  for(int i=0;i<m.length;i++){
    for(int j=0;j<A.length;j++){
      PVector force = A[j].attract(m[i]);
      m[i].applyForce(force);
    }
    for(int j=0;j<m.length;j++){
      if(i!=j){
        PVector force = m[j].attract(m[i]);
        m[i].applyForce(force);
      }
    }
    m[i].update();
    m[i].display();
  }
}
 