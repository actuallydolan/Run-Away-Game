class Coin {

  private float x;
  private float y;
  PImage img;

  public Coin () {
    x = (float) random(width - 50);
    y = (float) random(height - 50);
    img = loadImage("coin.png");
  }

  public void update() {
    show();
    checkCollide(john);
  }

  public void checkCollide(Circle other) {
    float distance_x = other.x - x;
    float distance_y = other.y - y;

    float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
    if (distance < (15)) {
      coins.clear();
      score++;
      coins.add(new Coin());
    } 
  }

  public void show() {
    image (img, x, y);
  }
}
