class Attractor{

  PVector location;
  float mass;
  float G;
  
  public Attractor(){
    location = new PVector(width/2,height/2);
    this.mass = 40;
    G = 0.2;
  }
  
  void display(){
    stroke(0);
    fill(175,200);
    ellipse(location.x,location.y,mass*2,mass*2);
  }
  
  PVector attract(Mover m){
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,5,25);
    force.normalize();
    float strength = (G*mass*m.mass)/(distance*distance);
    force.mult(strength);
    return force;
  }
}