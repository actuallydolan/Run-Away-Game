import ketai.sensors.*;
//import java.lang.Math;
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
    coins.get(0).update();
    while (enemies.size() < score) { 
      enemies.add(new Enemy(random(width), random(height), random(1+0.1*score, 3+0.1*score)));
    }
    for (int i = 0; i < enemies.size(); i ++) {
      enemies.get(i).display();
      enemies.get(i).move(john);
      punch(enemies.get(i));
    }
    while (score%4==0 && powerups.size()==0) {
      powerups.add(new PowerUp(random(width), random(height)));
      if (powerups.size()>0) {
        collect(powerups.get(0));
      }
    }
  }

  public void punch(Enemy other) {//player grinch overlap method
    float distance_x = other.x - x;
    float distance_y = other.y - y;
    float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
    if (distance < (16)) {
      john.outOfBounds();
      end = true;
    }
  }
  
  public void collect(PowerUp other) {
    float distance_x = other.x - x;
    float distance_y = other.y - y;
    float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
    if (distance < (20)) {
      john.powerUp();
      score++;
      powerups.clear();
    }
  }
  
  public void powerUp() {
    speed++;
  }
  public void display() {
    circle(x, y, 25);
  }

  public void move() {
    x -= accelerometerX*speed;
    y += accelerometerY*speed;
  }

  void outOfBounds() {
    if (john.x>width-22.5 || john.y>height-22.5 || john.x<22.5 || john.y<22.5) {
      end = true;
    }

    if (end) {
      rect(0, 0, width, height);
      background(255, 0, 0);
      john.x = 1000000000;
      john.y = 1000000000; 
      textAlign(CENTER);
      String s = "Game Over" + "\n" + "tap to play again";
      text(s, width/2, height/2);
      fill(255, 255, 255);

      // String displayScore = "Highscore: " + highScore "\n" + "Your Score: " + score;
      String displayScore = "Your Score: " + score;
      text (displayScore, width-120, 80);

      if (mousePressed) {
        end = false;
        score = 0;
        enemies.clear();
        coins.clear();
        coins.add(new Coin());  
        x = random(width-100)+100;
        y = random(height-100)+100;
        //x = (int) (Math.random()*(width-100)+100);
        //y = (int) (Math.random()*(height-100)+100);
      }
    }
  }
}
