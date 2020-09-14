class Mine implements Runner {
  PVector location = new PVector();
  int timer;

  Mine(PVector loc_) {
    location = loc_.copy();
    timer = millis();
  }

  void run() {
    rectMode(CENTER);
    fill(160, 82, 45);
    rect(location.x, location.y, 5, 5);
  }

  boolean remov() {
    if (millis() - timer > 4000) {
      //inset small explosion with death radius
      return true;
    } else {
      return false;
    }
  }
}
