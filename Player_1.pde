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
}
