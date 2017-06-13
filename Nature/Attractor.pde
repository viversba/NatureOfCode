class Attractor{

  PVector location;
  float mass;
  
  public Attractor(){
    location = new PVector(width/2,height/2);
    this.mass = 20;
  }
  
  void display(){
    stroke(0);
    fill(175,200);
    ellipse(location.x,location.y,mass*2,mass*2);
  }
}