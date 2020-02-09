Circle john = new Circle(200, 200, 25);
ArrayList<Enemy> enemies = new ArrayList<Enemy> ();
ArrayList<Coin> coins = new ArrayList<Coin> ();
int borderStroke = 10;
int score = 0;
boolean end = false;
PFont font;

void setup()
{
  font = createFont("RetroGaming.ttf", 32);
  textFont(font);
  sensor = new KetaiSensor(this);
  coins.add(new Coin());
  sensor.start();
  orientation(PORTRAIT);
  textSize(36);
}

void draw()
{
  if (!end) {
    background(0, 0, 0);
    String str = "Score: " + score;
    textAlign(RIGHT);
    fill(200,200,200);
    text(str, width - 100, 100);
    john.update();
    noStroke();
    rect(0, 0, width, borderStroke);
    noStroke();
    rect(width - borderStroke, 0, borderStroke, height);
    noStroke();
    rect(0, height - borderStroke, width, borderStroke);
    noStroke();
    rect(0, 0, borderStroke, height);
  } else {
    john.outOfBounds();
  }
}

  void onAccelerometerEvent(float x, float y, float z)
  {
    accelerometerX = x;
    accelerometerY = y;
    accelerometerZ = z;
  }
