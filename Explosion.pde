class Explosion implements Runner {
  ArrayList<Particle> explo = new ArrayList<Particle>();
  PVector location = new PVector();
  int lifespan;

  Explosion(PVector loc, int num) {
    location.set(loc);
    lifespan = millis();
    for (int i = 0; i < num; i++) {
      float angle = map(i, 0, num, 0, 2*PI);
      PVector vel = new PVector(5*cos(angle), 5*sin(angle));
      explo.add(new Particle(loc, vel));
    }
  }

  void run() {
    for (Particle p : explo) {
      p.display();
      if (p.removee()) {
        explo.remove(p);
      }
    }
    if (dist(location.x,location.y,p1.location.x,p2.location.y) < 20){
      p1.lives = 0;
      p1.explode();
    }
    if (dist(location.x,location.y,p2.location.x,p2.location.y) < 20){
      p2.lives = 0;
      p2.explode();
    }
  }
  boolean remov() { 
    if (millis() - lifespan > 5000) {
      return true;
    } else {
      return false;
    }
  }
}
