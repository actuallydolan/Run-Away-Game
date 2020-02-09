class Coin {
 
  private float x;
  private float y;

  public Circle (float xx, float yy, float spd) {
    x = xx;
    y = yy;
    speed = spd;
  }
  
  public void be() {
    display();
    collide();
  }
  
  public void display() {
    //if no Coin
    //circle(randomx, randomy, size 25)
  }
  
  public void collide() {
    //if radius of circle overlap, then remove
    //use arraylist then??
  }
  
}
