class Team1 extends Tank {

  Team1(int x_, int y_, color col_) {
    super(x_, y_, col_);
  }

  void run() {
    fill(col);
    super.run();
  }

  void collmove() {
    if (key == 'w') {
      if ((get((int)location.x+(int)velocity.x*9, (int)location.y+(int)velocity.y*9) == color(255))) {
        location.add(velocity.mult(1.8));
      }
    } else if (key == 'd') {
      theta += angleVel;
    } else if (key == 'a') {
      theta -= angleVel;
    } else if (key == 's') {
      location.add(velocity.mult(-0.6));
    } else if (key == 'v') {
      super.shoot();
    }
  }
  void shootcoll() {
    if (bulletLoc.x > p2.location.x-20 && bulletLoc.x < p2.location.x+20 && bulletLoc.y > p2.location.y-10 && bulletLoc.y < p2.location.y+10) {
      shooting = false;
      p2.lives--;
      if (p2.lives == 0) {
        p2.explosion();
      }
    }
  }
}
