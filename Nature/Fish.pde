class Fish{
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float mass;
 
  Fish() {
    location = new PVector(random(width),random(height/2,height));
    velocity = new PVector(0,0);
    topspeed = 4;
  }
 
  void update() {

    acceleration = new PVector(random(-2,2),random(-2,2));
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,16,16);
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
    }  else if (location.y < height/2) {
      location.y = height/2;
      velocity.y = -velocity.y;
    }
  }
}