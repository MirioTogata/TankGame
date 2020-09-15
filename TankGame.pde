import java.util.Iterator;
PImage playground;

float ringrad = 800;
Team1 p1 = new Team1(30, 30, color(0, 255, 0));
Team2 p2 = new Team2(900, 700, color(0, 0, 255));
ArrayList<Runner> runn = new ArrayList<Runner>();
Particle ps;

void setup() {
  size(1000, 800);
  playground = loadImage("playground.png");
  ps = new Particle(new PVector(width/2, 50));
}

void draw() {
  image(playground, 0, 0);
  p1.run();
  p2.run();
  ps.run();
  
  Iterator<Runner> Ite = runn.iterator();
  while (Ite.hasNext()) {
    Runner r = Ite.next();
    r.run();
    if (r.remov()) {
      Ite.remove();
    }
  }
  borderdeath();
}

void keyPressed() {
  p1.collmove();
  p2.collmove();
}

void borderdeath() {
  ringrad -= ringrad*0.0004;
  noFill();
  stroke(255, 0, 0);
  strokeWeight(20);
  ellipse(width/2, height/2, ringrad*2, ringrad*2);
}
