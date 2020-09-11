class bullet {
  PVector location = new PVector();
  PVector velocity = new PVector();
  int dia = 5;

  bullet(PVector loc_, PVector enhedv) {
    location = loc_.copy();
    velocity = (enhedv.copy());
    location.add((velocity.copy()).mult(5));
  }

  void run() {
    location.add(velocity);
    fill(150);
    ellipse(location.x, location.y, dia, dia);
    collision();
  }

  void collision() {
    if (get((int)location.x+(int)velocity.x, (int)location.y+(int)velocity.y) == color(0) || tankcoll()) {
      location.set(0, 2000); //iterator sletter den når den er udenfor skærmen
    }
  }

  boolean tankcoll() {
    if (dist(location.x, location.y, p1.location.x, p1.location.y) < (dia+p1.dia)/2) {
      p1.hit();
      return true;
    } else if (dist(location.x, location.y, p2.location.x, p2.location.y) < (dia+p2.dia)/2) {
      p2.hit();
      return true;
    } else {
      return false;
    }
  }
}
