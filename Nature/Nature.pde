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
  R[0] = new Repellent(50,50);
  R[1] = new Repellent(50,height-50);
  R[2] = new Repellent(width-50,50);
  R[3] = new Repellent(width-50,height-50);
  /*for(int i=0;i<A.length;i++){
    R[i] = new Repellent();
  }*/
}
 
void draw() {
  background(255);
  frameRate(60);
  /*for(int i=0;i<A.length;i++){
    A[i].display();
  }*/
  for(int i=0;i<R.length;i++){
    R[i].display();
  }
  for(int i=0;i<m.length;i++){
    /*for(int j=0;j<A.length;j++){
      PVector force = A[j].attract(m[i]);
      m[i].applyForce(force);
    }*/
    for(int j=0;j<R.length;j++){
      PVector force = R[j].repell(m[i]);
      m[i].applyForce(force);
    }
    m[i].update();
    m[i].display();
  }
}
 