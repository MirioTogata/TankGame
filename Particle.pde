class Particle implements Runner {
  PVector location = new PVector();
  int timer;
  Particle ps;
  
void setup(){
    ps = new Particle(new PVector(width/2, 50));
  }

  Particle(PVector loc_) {
    location = loc_.copy();
    timer = millis();
  }

  void run() {
    ellipseMode(CENTER);
    fill(255, 0, 0);
    ellipse(location.x, location.y, 8, 8);
  }

  boolean remov() {
    if (millis() - timer > 4000) {
      return true;
    } else {
      return false;
    }
  }
}
