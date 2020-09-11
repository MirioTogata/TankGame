class Tank {
  color col;
  PVector location = new PVector();
  PVector velocity = new PVector();
  float theta = 0;
  float angleVel = 0.2;
  int lives = 3;
  int dia = 30;
  int bullettime;

  Tank(int x_, int y_, color col_) {
    location.set(x_, y_);
    col = col_;
  }

  void run() {
    if (lives > 0) {
      velocity.set(5*cos(theta), 5*sin(theta));
      pushMatrix();
      noStroke();
      fill(col);
      translate(location.x, location.y);
      rotate(theta);
      rectMode(CENTER);
      ellipse(0, 0, dia, dia);
      rect(15, 0, dia, 5);
      popMatrix();
    }
  }

  void shoot() {
    if (millis() - bullettime > 1000) {
      bullets.add(new bullet(location, velocity));
      bullettime = millis();
    }
  }

  void hit() {
    lives--;
    if (lives == 0) {
      //add 1 til explosion arraylist på locationen
    }
  }
}
