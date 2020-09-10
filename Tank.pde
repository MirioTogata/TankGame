class Tank {
  color col;
  PVector location = new PVector();
  PVector velocity = new PVector();
  float theta = 0;
  float angleVel = 0.2;
  PVector bulletLoc = new PVector();
  PVector bulletVel = new PVector();
  boolean shooting = false;
  int lives = 1;

  Tank(int x_, int y_, color col_) {
    location.set(x_, y_);
    col = col_;
  }

  void run() {
    if (lives > 0) {
      velocity.set(5*cos(theta), 5*sin(theta));
      pushMatrix();
      noStroke();
      translate(location.x, location.y);
      rotate(theta);
      rectMode(CENTER);
      rect(0, 0, 40, 20);
      rect(20, 0, 30, 5);
      popMatrix();
    }
    if (shooting == true) {
      bulletLoc.add(bulletVel.mult(2));
      fill(150);
      rect(bulletLoc.x, bulletLoc.y, 5, 5);
      shootcoll();
    }
  }
  void shoot() {
    if (shooting == false) {
      shooting = true;
      bulletLoc.set(location.x, location.y);
      bulletVel.set(velocity.x, velocity.y);
    }
  }

  void shootcoll() {
  }

  void explosion() {
  }
}
