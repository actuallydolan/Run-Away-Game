import ketai.sensors.*;

KetaiSensor sensor;
float accelerometerX, accelerometerY, accelerometerZ;

class Circle {

  private float speed;  
  private float x;
  private float y;

  public Circle (float xx, float yy, float spd) {
    x = xx;
    y = yy;
    speed = spd;
  }

  public void update() {
    display();
    move();
    outOfBounds();
    while (enemies.size() < score) { 
      enemies.add(new Enemy(random(width), random(height), random(1+0.1*score, 3+0.1*score)));
    }
    for (int i = 0; i < enemies.size(); i ++) {
      enemies.get(i).display();
      enemies.get(i).move(john);
      punch(enemies.get(i)); //checks if grinch hits player
    }
  }

  public void punch(Enemy other) {//player grinch overlap method
    float distance_x = other.x - x;
    float distance_y = other.y - y;

    float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
    if (distance < (other.radius/2 + 25/2)) {
      john.outOfBounds();
    }
  }

  public void display() {
    circle(x, y, 25);
  }

  public void move() {
    x -= accelerometerX;
    y += accelerometerY;
  }

  void outOfBounds() {
    if (john.x>width+12.5 || john.y>height+12.5 || john.x<12.5 || john.y<12.5) {
      rect(0, 0, width, height);
      background(255, 0, 0);
      john.x = 1000000000;
      john.y = 1000000000; 
      String s = "Game Over" + "\n" + "tap to play again";
      text(s, width/2, height/2);
      fill(255, 255, 255);
    }
  }
}
