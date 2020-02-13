class PowerUp {
  float x;
  float y;
  float radius = 20;
  PImage img;
  int type = 0;

  PowerUp() {
    x = (float) random(width - 100) + 100;
    y = (float) random(height -  100) + 100;
    type = Math.round(random(1));
  }

  PowerUp(float xx, float yy) {
    x = xx;
    y = yy;
  }

  void display() {
    if (type == 0) {
      img = loadImage("powerup.png");
      image (img, x, y);
    } else if (type == 1) {
      img = loadImage("powerup2.png");
      image (img, x, y);
    }
  }

  void activate() {
    if (type == 0) {
      //long start = System.currentTimeMillis();
      //long end = start + 10*1000; // 10 seconds * 1000 ms/sec
      //while (System.currentTimeMillis() < end) {
      speedUp();
      //}
    } else if (type == 1) {
      //long start = System.currentTimeMillis();
      //long end = start + 10*1000; // 10 seconds * 1000 ms/sec
      //while (System.currentTimeMillis() < end) {
      runAway();
      //}
    }
  }

  void speedUp() {
    john.speed++;
  }

  void slowDown() {
    for (int i = 0; i < enemies.size(); i ++) {
      enemies.get(i).slowDown();
    }
  }

  void runAway() {
    for (int i = 0; i < enemies.size(); i ++) {
      enemies.get(i).runAway();
    }
  }
}
