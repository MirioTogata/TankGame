class Particle {
  PVector location = new PVector();
  PVector velocity = new PVector();
  float lifespan;

  Particle(PVector loc_, PVector vel_) {
    location.set(loc_);
    velocity.set(vel_);
    lifespan = 250;
  }

  void display() {
    lifespan -= 10;
    fill(255, 0, 0, lifespan);
    noStroke();
    ellipse(location.x, location.y, 5, 5);

    location.add(velocity);
  }

  boolean removee() {
    if (lifespan < 0) {
      return true;
    } else { 
      return false;
    }
  }
}
