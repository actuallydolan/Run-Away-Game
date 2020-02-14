class Coin {
  
  private float x;
  private float y;
  PImage img;

  public Coin () {
    x = (float) random(width - 200) + 100;
    y = (float) random(height - 200) + 100;
    img = loadImage("coin.png");
  }

  public Coin (float xx, float yy) {
    x = xx;
    y = yy;
    img = loadImage("coin.png");
  }

  public void update() {
    show();
    checkCollide(john);
  }
  
  public void update2() {
    show();
    checkCollide2(john);
  }

  public void checkCollide(Circle other) {
    float distance_x = other.x - x;
    float distance_y = other.y - y;

    float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
    if (distance < (30)) {
      coins.clear();
      score++;
      coins.add(new Coin());
      playCoin();
    }
  }

  public void checkCollide2(Circle other) {
    float distance_x = other.x - x;
    float distance_y = other.y - y;

    float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
    if (distance < (30)) {
      coins.clear();
      score++;
      coins.add(new Coin(random(borderStroke+50, width-borderStroke-50), 
        random(borderStroke+50, height-borderStroke-50)));
    }
  }

  public void show() {
    image(img, x, y);
  }
}
