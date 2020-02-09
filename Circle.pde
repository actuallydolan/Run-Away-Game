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

  public void display() {
    circle(x, y, 25);
  }

  public void move() {
    x -= accelerometerX;
    y += accelerometerY;
  }
  
  void outOfBounds(){
    if (john.x>width-22.5 || john.y>height-22.5 || john.x<22.5 || john.y<22.5){
      level=1;
    }
  }
}
