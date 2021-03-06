class Mover{
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float mass;
 
  Mover(float m, float x, float y){
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topspeed = 4;
  }
 
  void update() {
 
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    stroke(122,47,78);
    fill(122,47,78);
    ellipse(location.x,location.y,mass*16,mass*16);
  }
 
  void checkEdges() {
 
    if (location.x > width) {
      location.x = width;
      velocity.x = -velocity.x;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x = -velocity.x;
    }
 
    if (location.y > height) {
      location.y = height;
      velocity.y = -velocity.y;
    }
  }
  
  boolean isInside(Liquid l){
    if(location.x > l.x && location.x<(l.x+l.w) && location.y > l.y && location.y<l.y+l.h){
      return true;
    }
    else{
      return false;
    }
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void drag(Liquid l){
    float speed = velocity.mag();
    float dragMagnitude = l.c * speed * speed;
    PVector drag = velocity.get();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMagnitude);
    applyForce(drag);
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
  
  PVector repell(Mover m){
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    if(distance >= mass*4){
      distance = constrain(distance,5,25);
      force.normalize();
      float strength = (G*mass*m.mass)/(distance*distance);
      force.mult(strength);
      return force;
    }
    else{
      distance = constrain(distance,5,25);
      force.normalize();
      float strength = (G*mass*m.mass)/(distance*distance);
      force.mult(-strength);
      return force;
    }
  }
}