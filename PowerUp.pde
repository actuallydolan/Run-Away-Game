class PowerUp {
  float x;
  float y;
  float radius = 20;
  PImage img;
  
  PowerUp(float xx, float yy) {
    x = xx;
    y = yy;
    img = loadImage("powerup.png");
  }
  
  void display() {
    image (img, x, y);
  }
  
  
}
