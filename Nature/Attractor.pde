class Attractor{

  PVector location;
  float mass;
  float G;
  
  public Attractor(){
    location = new PVector(width/2,height/2);
    this.mass = 40;
    G = 0.4;
  }
  
  void display(){
    stroke(0);
    if(mousePressed && isInside(new PVector(mouseX,mouseY))){
      location.x = mouseX;
      location.y = mouseY;
      fill(130,150);
      ellipse(location.x,location.y,mass*2,mass*2);
    }
    else{
      fill(175,200);
      ellipse(location.x,location.y,mass*2,mass*2);
    }
  }
  
  boolean isInRange(Mover m){
    PVector dir = PVector.sub(location,m.location);
    //PVector dir = this.location.sub(m.location);
    float distance = dir.mag();
    if(distance < mass*40)
      return true;
     else
       return false;
  }
  
  boolean isInside(PVector position){
    PVector dir = PVector.sub(location,position);
    float distance = dir.mag();
    if(distance < mass)
      return true;
     else
       return false;
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