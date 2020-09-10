class Team2 extends Tank {

  Team2(int x_, int y_, color col_) {
    super(x_, y_, col_);
  }

  void run() {
    fill(col);
    super.run();
  }

  void collmove() {
    if (key == 'i') {
      if ((get((int)location.x+(int)velocity.x*9, (int)location.y+(int)velocity.y*9) == color(255))) {
        location.add(velocity.mult(1.8));
      }
    } else if (key == 'l') {
      theta += angleVel;
    } else if (key == 'j') {
      theta -= angleVel;
    } else if (key == 'k') {
      location.add(velocity.mult(-0.6));
    } else if (key == 'b') {
      super.shoot();
    }
  }
  void shootcoll() {
    if (bulletLoc.x > p1.location.x-20 && bulletLoc.x < p1.location.x+20 && bulletLoc.y > p1.location.y-10 && bulletLoc.y < p1.location.y+10) {
      shooting = false;
      p1.lives--;
      if (p1.lives == 0) {
        p1.explosion();
      }
    }
  }
}
