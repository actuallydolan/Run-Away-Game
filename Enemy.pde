class Enemy {
  float x;
  float y;
  float health;
  float radius = 20;
  float speed;
  PImage img;

  Enemy(float xx, float yy, float spd) {//constructor
    x = xx;
    y = yy;
    speed = spd;        
    img = loadImage("Enemy.png");
  }

  void display() {//displays the image of a grinch 
    image (img, x, y);
  }

  void move(Circle player) {//moves the grinch towards the current position of the player
    float xDiff = x - player.x;
    float yDiff = y - player.y;
    float angle = atan2(yDiff, xDiff);
    x -= cos(angle)*speed;
    y -= sin(angle)*speed;
  }
}
