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
    int coinCount = 0;

     if(coinCount == 0) {
	    circle(x, y, 16);
	    ++coinCount;
   }
  }
  
  public boolean collide(float a, float b, float c, float d, float e, float f) {
	boolean isColliding = false;
	if(dist(a, b, d, e) < c + f)) {
		isColliding = true;
	}
	return isColliding;
}
  
}
