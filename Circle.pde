import ketai.sensors.*;

KetaiSensor sensor;
float accelerometerX, accelerometerY, accelerometerZ;

class Circle {
  PVector pos = new PVector();
  private float speed;  
 
  
  public Circle (float xx, float yy, float spd) {
    this.pos.x = xx;
    this.pos.y = yy;
    this.speed = spd;
  }
  
  public void display() {
    circle(this.pos.x, this.pos.y,25);
  }
  
  public void move() {
    pos.x += accelerometerX;
    pos.y += accelerometerY;
  }
}
