Circle john = new Circle(width/2, height/2, 25);
int borderStroke = 5;

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
  rect(0, 0, width, borderStroke);
  rect(width - borderStroke, 0, borderStroke, height);
  rect(0, height - borderStroke, width, borderStroke);
  rect(0, 0, borderStroke, height);
}

void onAccelerometerEvent(float x, float y, float z)
{
  accelerometerX = x;
  accelerometerY = y;
  accelerometerZ = z;
}
