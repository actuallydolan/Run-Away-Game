import ketai.sensors.*;
//import java.lang.Math;
KetaiSensor sensor;
float accelerometerX, accelerometerY, accelerometerZ;

class Circle {

  public float speed;  
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
      powerups.add(new PowerUp());
    }
    if (powerups.size()>0) {
      powerups.get(0).display();
      collect(powerups.get(0));
    }
  }

  public void update2() {
    display();
    move();
    outOfBounds2();
    coins.get(0).update2();
    while (enemies.size() < score) { 
      enemies.add(new Enemy(random(width), random(height), random(1+0.3*score, 3+0.3*score)));
    }
    for (int i = 0; i < enemies.size(); i ++) {
      enemies.get(i).display();
      enemies.get(i).move(john);
      punch(enemies.get(i));
    }
    while (score%4==0 && powerups.size()==0) {
      powerups.add(new PowerUp(random(borderStroke+50, width-borderStroke-50), 
        random(borderStroke+50, height-borderStroke-50)));
    }
    if (powerups.size()>0) {
      powerups.get(0).display();
      collect(powerups.get(0));
    }
  }

  public void punch(Enemy other) {//player grinch overlap method
    float distance_x = other.x - x;
    float distance_y = other.y - y;
    float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
    if (distance < (25)) {
      john.outOfBounds();
      level = 2;
    }
  }

  public void collect(PowerUp other) {
    float distance_x = other.x - x;
    float distance_y = other.y - y;
    float distance = sqrt(distance_x * distance_x + distance_y * distance_y);
    if (distance < (45)) {
      other.activate();
      score++;
      powerups.clear();
    }
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
      level = 2;
    }

    if (level==2) {
      rect(0, 0, width, height);
      background(255, 0, 0);
      john.x = 1000000000;
      john.y = 1000000000; 
      textSize(32);
      textAlign(CENTER);
      String s = "Game Over" + "\n" + "tap to play again";
      text(s, width/2, height/2);
      fill(255, 255, 255);
      // String displayScore = "Highscore: " + highScore "\n" + "Your Score: " + score;
      String displayScore = "Your Score: " + score;
      text (displayScore, width/2, 80);
      saveHighScore(score, "highscore");
      text ("HIGHSCORE: " + highscore, width/2, 130); 

      if (mousePressed) {
        level = 0;
        speed = 1;
        score = 0;
        borderStroke = 10;
        enemies.clear();
        coins.clear();
        powerups.clear();
        coins.add(new Coin());  
        x = random(width-100)+100;
        y = random(height-100)+100;
        //x = (int) (Math.random()*(width-100)+100);
        //y = (int) (Math.random()*(height-100)+100);
      }
    }
  }

  void outOfBounds2() {
    if (john.x>width-borderStroke-22.5 || john.y>height-borderStroke-22.5 
      || john.x<borderStroke+22.5 || john.y<borderStroke+22.5) {
      level = 2;
    }

    if (level==2) {
      rect(0, 0, width, height);
      background(255, 0, 0);
      john.x = 1000000000;
      john.y = 1000000000; 
      textSize(32);
      textAlign(CENTER);
      String s = "Game Over" + "\n" + "tap to play again";
      text(s, width/2, height/2);
      fill(255, 255, 255);
      // String displayScore = "Highscore: " + highScore "\n" + "Your Score: " + score;
      String displayScore = "Your Score: " + score;
      text (displayScore, width/2, 80);
      saveHighScore(score, "highscore");
      text ("HIGHSCORE: " + highscore, width/2, 130); 

      if (mousePressed) {
        level = 0;
        speed = 1;
        score = 0;
        borderStroke = 10;
        enemies.clear();
        coins.clear();
        powerups.clear();
        coins.add(new Coin());  
        x = random(width-100)+100;
        y = random(height-100)+100;
        //x = (int) (Math.random()*(width-100)+100);
        //y = (int) (Math.random()*(height-100)+100);
      }
    }
  }
}
