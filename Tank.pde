class Tank {
  color col;
  PVector location = new PVector();
  PVector velocity = new PVector();
  float theta = 0;
  float angleVel = 0.1;
  int lives = 3;
  boolean dead = false;
  int dia = 30;
  int bullettime;
  int minetime;
  char[] keys;
  boolean[] keypress;

  Tank(int x_, int y_, color col_) {
    location.set(x_, y_);
    col = col_;
    keypress = new boolean[6];
  }

  void run() {
    if (lives > 0) {
      pushMatrix();
      noStroke();
      fill(col);
      translate(location.x, location.y);
      rotate(theta);
      rectMode(CENTER);
      ellipse(0, 0, dia, dia);
      rect(15, 0, dia, 5);
      popMatrix();
      move();
    }
    if (dist(location.x, location.y, width/2, height/2) > ringrad) {
      lives = 0;
      explode();
    }
  }

  void hit() {
    lives--;
    if (lives <= 0) {
      explode();
    }
  }

  void explode() {
    if (dead == false) {
      //runn.add(new Explosion(location, 20));
      dead = true;
    }
  }

  void move() {
    velocity.set(3*cos(theta), 3*sin(theta));
    if (keypress[0]) {
      if ((get((int)location.x+(int)velocity.x*20, (int)location.y+(int)velocity.y*20) == color(255))) {
        location.add(velocity.mult(1.8));
      }
    }
    if (keypress[1]) {
      theta += angleVel;
    }
    if (keypress[2]) {
      theta -= angleVel;
    }
    if (keypress[3]) {
      location.add(velocity.mult(-0.6));
    }
    if (keypress[4]) {
      if (dead == false && millis() - bullettime > 1000) {
        runn.add(new bullet(location, velocity));
        bullettime = millis();
      }
    }
    if (keypress[5]) {
      if (dead == false && millis() - minetime > 1000) {
        runn.add(new Mine(location));
      }
    }
  }
  void keyPressedd() {
    for (int i = 0; i < keys.length; i++) {
      if (key == keys[i]) {
        keypress[i] = true;
      }
    }
  }
  void keyReleasedd() {
    for (int i = 0; i < keys.length; i++) {
      if (key == keys[i]) {
        keypress[i] = false;
      }
    }
  }
}
