Mover[] movers = new Mover[30];
Liquid liquid;
Attractor A;
float G;
 
void setup() {
  size(880,495);
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1,6),random(5,width),0);
  }
  liquid = new Liquid(0,height/2,width,height/2,0.1);
  A = new Attractor();
}
 
void draw() {
  background(255);
}
 