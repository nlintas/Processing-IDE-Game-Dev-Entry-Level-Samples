class VectorMover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;

  VectorMover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);  
    acceleration = new PVector(-0.001, 0.01);
    topSpeed = 10;
  }

  void step() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }

  void bounceOnEdges() {
    if (location.x>width || location.x<0) velocity.x *= -1;
    if (location.y>height || location.y<0) velocity.y *= -1;
  }

  void passEdges(){
    if (location.x>width) location.x = 0;
    if (location.y>height) location.y =0;
    if (location.x<0) location.x = width;
    if (location.y<0) location.y = height;  
  }

  void display() {
    fill(pink);
    ellipse(location.x, location.y, 50, 50);
  }
}
