class Coin {
 
  private float x;
  private float y;

  public Coin () {
    x = (float) random(width - 10);
    y = (float) random(height - 10);
  }
  
  public void update() {
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
    //add points
    //test2
  }
  
}
