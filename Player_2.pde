class Team2 extends Tank {

  Team2(int x_, int y_, color col_) {
    super(x_, y_, col_);
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
}
