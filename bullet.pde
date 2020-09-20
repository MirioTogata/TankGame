class bullet implements Runner {
  PVector location = new PVector();
  PVector velocity = new PVector();
  int dia = 5;
  boolean ricochet = false;

  bullet(PVector loc_, PVector v) {
    location = loc_.copy();
    velocity = (v.copy().mult(2));
    location.add((velocity.copy()).mult(8));
  }

  void run() {
    location.add(velocity);
    fill(150);
    ellipse(location.x, location.y, dia, dia);
    collision();
  }

  boolean remov() {
    if (location.x < 0 || location.x > width || location.y < 0 || location.y > height) {
      return true;
    } else {
      return false;
    }
  }

  void collision() {
    if (dist(location.x, location.y, p1.location.x, p1.location.y) < (dia+p1.dia)/2) {
      p1.hit();
      location.set(0, 2000); //iterator sletter den når den er udenfor skærmen
    } else if (dist(location.x, location.y, p2.location.x, p2.location.y) < (dia+p2.dia)/2) {
      p2.hit();
      location.set(0, 2000); //iterator sletter den når den er udenfor skærmen
    }
  
    if (ricochet == false) {
      
      int colorCodeX = get((int)location.x+(int)velocity.x, (int)location.y);
      int colorCodeY = get((int)location.x, (int)location.y+(int)velocity.y);
      if (colorCodeX == color(0)) {
        velocity.x *= -1;
        ricochet = true;
      }
      if (colorCodeY == color(0)) {
        velocity.y *= -1;
        ricochet = true;
      }
    } else if (get((int)location.x+(int)velocity.x, (int)location.y+(int)velocity.y) == color(0)) {
      location.set(0, 2000);
    }
  }
}
