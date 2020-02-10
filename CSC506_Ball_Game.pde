import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.context.Context;
import android.app.Activity;

Circle john = new Circle(200, 200, 25);
ArrayList<Enemy> enemies = new ArrayList<Enemy> ();
ArrayList<Coin> coins = new ArrayList<Coin> ();
int borderStroke = 10;
int score = 0;
int highscore = 0;
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
  highscore = loadInt("highscore");
}
void saveHighScore(int score, String a) {
  if(score > highscore) {
    highscore = score;
  }
  SharedPreferences sharedPreferences; 
  SharedPreferences.Editor editor;
  Activity act;
  act = this.getActivity();
  sharedPreferences = PreferenceManager.getDefaultSharedPreferences(act.getApplicationContext());
  editor = sharedPreferences.edit();
  editor.putInt(a, score);
  editor.commit();
}
int loadHighScore(String n) {
  SharedPreferences sharedPreferences;
  Activity act;
  act = this.getActivity();
  sharedPreferences = PreferenceManager.getDefaultSharedPreferences(act.getApplicationContext());
  int getScore = sharedPreferences.getInt(n);
  return getScore;
}
void onPause() {
  super.onPause();
  saveHighScore(highscore, "highscore");
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
    String displayScore = "Your Score: " + score;
    text (displayScore, width-120, 80);
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
