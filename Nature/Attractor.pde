class Attractor{

  PVector location;
  float mass;
  float G;
  boolean grabbed;
  PVector distGrab;
  
  public Attractor(){
    location = new PVector(random(width),random(height));
    this.mass = 40;
    G = 0.4;
    grabbed = false;
    distGrab = new PVector(0,0);
  }
  
  void display(){
    stroke(0);
    if(!grabbed){
      distGrab = distance(new PVector(mouseX,mouseY));
    }
    if(!mousePressed){
      fill(175,200);
      grabbed = false;
      distGrab = new PVector(0,0);
    }
    if((mousePressed && isInside(new PVector(mouseX,mouseY))) || grabbed){
      location.x = mouseX + distGrab.x;
      location.y = mouseY + distGrab.y;
      grabbed = true;
      fill(100,250);
    }
    //ellipse(location.x,location.y,mass*2,mass*2);
  }
  
  boolean isInRange(Mover m){
    PVector dir = distance(m.location);
    //PVector dir = this.location.sub(m.location);
    float distance = dir.mag();
    if(distance < mass*40)
      return true;
     else
       return false;
  }
  
  PVector distance(PVector loc){
    return PVector.sub(this.location,loc);
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