/*Mover m[];
Attractor A[];
Repellent R[];*/
Mover m;
float r = 0;
float theta = 0;
float G;
 
void setup() {
  size(880,495);
  background(255);
  /*m = new Mover[10];
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
  }*/
}
 
void draw() {
  //background(255);
  float x = r * cos(theta);
  float y = r * sin(theta);
  //noStroke();
  fill(0);
  //line(width/2,height/2,x + width/2,y+height/2);
  ellipse(x+width/2, y+height/2, 16, 16);
  theta += 0.01;
  r += 0.05;
  //m.display();
  //pushMatrix();
  /*
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
  }*/
}
 