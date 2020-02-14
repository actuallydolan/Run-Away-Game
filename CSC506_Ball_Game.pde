import cassette.audiofiles.SoundFile;
import processing.sound.*;

//* low priority ** med priority *** high priority
//TODO:*** classic mode - dylan
//TODO:*** sound and music! - joseph
//TODO:*** UI design - dylan
//TODO:** lives - 
//TODO:** button highlight when pressed
//TODO:** easter eggs on tap - dylan
//TODO:* character selection
//TODO: ***fix powerup to three
//TODO:***add mute button

import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import android.content.Context;
import android.app.Activity;

Circle john = new Circle(200, 200, 1);
ArrayList<Enemy> enemies = new ArrayList<Enemy> ();
ArrayList<Coin> coins = new ArrayList<Coin> ();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp> ();
float borderStroke = 10;
int score = 0;
int highscore = 0;
PFont font;
int level = 0;
boolean music = true;
boolean clickDelay = false;


SoundFile deathtetris;
SoundFile nyancat;
SoundFile sonicremix;
SoundFile minecraft;
SoundFile fallenkingdom;
SoundFile coin;
int musicSelection = Math.round(random(3));



void setup()
{
  deathtetris = new SoundFile(this, "deathmodetetris.mp3");
  nyancat = new SoundFile(this, "nyancat.mp3");
  sonicremix = new SoundFile(this, "sonicremix.mp3");
  minecraft = new SoundFile(this, "minecraft.mp3");
  fallenkingdom = new SoundFile(this, "fallenkingdom.mp3");
  playMusic();
  font = createFont("RetroGaming.ttf", 32);
  textFont(font);
  sensor = new KetaiSensor(this);
  coins.add(new Coin());
  sensor.start();
  orientation(PORTRAIT);
  textSize(36);
  highscore = loadHighScore("highscore");
  imageMode(CENTER);
}

public void playCoin() {
  coin = new SoundFile(this, "coin.mp3");
  coin.play();
}

void saveHighScore(int score, String a) {
  if (score > highscore) {
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
  int getScore = sharedPreferences.getInt(n, 0);
  return getScore;
}
void onPause() {
  super.onPause();
  saveHighScore(highscore, "highscore");
}

void musicOnOrOff() {
  if (music) {
    music = false;
    deathtetris.stop();
    nyancat.stop();
    sonicremix.stop();
    minecraft.stop();
    fallenkingdom.stop();
  } else {
    playMusic();
  }
}

void playMusic() {
  if (musicSelection == 0) {
    deathtetris.loop();
    print("hi1");
  } else if (musicSelection == 1) {
    nyancat.loop();
     print("hi2");
  } else if (musicSelection == 2) {
    sonicremix.loop();
     print("hi3");
  } else if (musicSelection == 3) {
    minecraft.loop();
     print("hi3");
  } else {
    fallenkingdom.loop();
     print("hi5");
  }
}

void draw()
{
  if (level==0) {
    background(0, 0, 0);
    textAlign(CENTER);
    fill(212, 175, 55);
    textSize(102);
    text("RUN AWAY", width/2, 150);
    textSize(36);
    text("A RETRO GAME BY", width/2, 300);
    text("JOSEPH CHEN \nDYLAN SHEN \nHARRISON HE", width/2, 400);
    fill(184, 15, 10);
    text("CHOOSE YOUR DIFFICULTY \n\n\nREGULAR MODE \n\n\nTIME CHALLENGE MODE", width/2, 800);
    rectMode(CENTER);
    //rect(width/2, 930, 500, 60);
    //rect(width/2, 1070, 500, 60);
    rect(50, height-50, 40, 40);
    rectMode(CORNER);
    if (mousePressed && clickDelay == false) {
      clickDelay = true;
      if (mouseX>30 && mouseX<70 && mouseY > height-70 && mouseY < height-30) {
        musicOnOrOff();
      }
      if (mouseX > width/2-250 && mouseX < width/2+250 && mouseY > 930-30 && mouseY <930+30) {
        level = 1;
      }
      if (mouseX > width/2-250 && mouseX < width/2+250 && mouseY > 1070-30 && mouseY < 1070+30) {
        level = 3;
      }
    }
  }
  if (level==1) {
    background(0, 0, 0);
    textAlign(RIGHT);
    fill(200, 200, 200);
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
    textSize(22);
    text (displayScore, width-100, 80);
  } 
  if (level==2) {
    john.outOfBounds();
  }
  if (level==3) {
    borderStroke+=0.05;
    background(0, 0, 0);
    textAlign(RIGHT);
    fill(200, 200, 200);
    john.update2();
    noStroke();
    rect(0, 0, width, borderStroke);
    noStroke();
    rect(width - borderStroke, 0, borderStroke, height);
    noStroke();
    rect(0, height - borderStroke, width, borderStroke);
    noStroke();
    rect(0, 0, borderStroke, height);
    String displayScore = "Your Score: " + score;
    textSize(22);
    text (displayScore, width-100, 80);
  }
}


void onAccelerometerEvent(float x, float y, float z)
{
  accelerometerX = x;
  accelerometerY = y;
  accelerometerZ = z;
}

void mouseReleased() {
  clickDelay = false;
}
