import java.util.Iterator;

PImage playground;
Team1 p1 = new Team1(30,30,color(0,255,0));
Team2 p2 = new Team2(900,700,color(0,0,255));
ArrayList<bullet> bullets = new ArrayList<bullet>();

void setup() {
  size(1000, 800);
  playground = loadImage("playground.jpg");
}

void draw() {
  image(playground, 0, 0);
  p1.run();
  p2.run();
  Iterator<bullet> it = bullets.iterator();
  while(it.hasNext()){
    bullet b = it.next();
    b.run();
    if (b.location.x < 0 || b.location.x > width || b.location.y < 0 || b.location.y > height){
      it.remove();
    }
  }
}

void keyPressed(){
  p1.collmove();
  p2.collmove();
}
