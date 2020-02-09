Circle john = new Circle(width/2, height/2, 25);
ArrayList<Enemy> enemies = new ArrayList<Enemy> ();
int borderStroke = 5;
int score = 0;

void setup()
{
  sensor = new KetaiSensor(this);
  sensor.start();
  orientation(PORTRAIT);
  background(0, 204, 228);
  textAlign(CENTER, CENTER);
  textSize(36);
}

void draw()
{
  background(0, 204, 228);
  text("Accelerometer: \n" + 
    "x: " + nfp(accelerometerX, 1, 3) + "\n" +
    "y: " + nfp(accelerometerY, 1, 3) + "\n" +
    "z: " + nfp(accelerometerZ, 1, 3), 0, 0, width, height);
  john.display();
  john.move();
  while (enemies.size() < score) { 
    enemies.add(new Enemy(random(width), random(height), random(1+0.1*score, 3+0.1*score)));
  }
  for (int i = 0; i < enemies.size(); i ++) {
    enemies.get(i).display();
    enemies.get(i).move(john);
  }
  noStroke();
  rect(0, 0, width, borderStroke);
  noStroke();
  rect(width - borderStroke, 0, borderStroke, height);
  noStroke();
  rect(0, height - borderStroke, width, borderStroke);
  noStroke();
  rect(0, 0, borderStroke, height);
  if (mousePressed==true && score < 10) {
    score++;
    System.out.println("work");
  }
  john.outOfBounds();
}

void onAccelerometerEvent(float x, float y, float z)
{
  accelerometerX = x;
  accelerometerY = y;
  accelerometerZ = z;
}
