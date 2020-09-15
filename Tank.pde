class Tank {
  color col;
  PVector location = new PVector();
  PVector velocity = new PVector();
  float theta = 0;
  float angleVel = 0.3;
  int lives = 3;
  int dia = 30;
  int bullettime;
  char[] keys;

  Tank(int x_, int y_, color col_) {
    location.set(x_, y_);
    col = col_;
  }

  void run() {
    if (lives > 0) {
      velocity.set(6*cos(theta), 6*sin(theta));
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
    if (dist(location.x, location.y, width/2, height/2) > ringrad) {
      lives = 0;
      //add 1 til explosion arraylist på locationen
    }
  }

  void shoot() {
    if (lives > 0 && millis() - bullettime > 1000) {
      runn.add(new bullet(location, velocity));
      bullettime = millis();
    }
  }

  void hit() {
    lives--;
    if (lives == 0) {
      //add 1 til explosion arraylist på locationen
      
     }
  }

  void collmove() {
    if (key == keys[0]) {
      if ((get((int)location.x+(int)velocity.x*9, (int)location.y+(int)velocity.y*9) == color(255))) {
        location.add(velocity.mult(1.8));
      }
    } else if (key == keys[1]) {
      theta += angleVel;
    } else if (key == keys[2]) {
      theta -= angleVel;
    } else if (key == keys[3]) {
      location.add(velocity.mult(-0.6));
    } else if (key == keys[4]) {
      shoot();
    } else if (key == keys[5]) {
      runn.add(new Mine(location));
    }
  }
}
