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
boolean steve = false;
boolean kirby = false;
PImage steveImg ;
PImage kirbyImg ;


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
    rectMode(CENTER);

    if (mouseX > width/2-200 && mouseX < width/2+200 && mouseY > 375 - 25 && mouseY < 375 + 25) {
      fill(0, 0, 0);
      rect(width/2, 375, 300, 50); //easter egg for Joseph
      fill(212, 175, 55);
      text("@jo.sephhiiee", width/2, 395);
    }
    if (mouseX > width/2-200 && mouseX < width/2+200 && mouseY > 425-25 && mouseY < 425+25) {
      fill(0, 0, 0);
      rect(width/2, 425, 300, 50);//easter egg for Dylan
      fill(212, 175, 55);
      text("@dylan.the.human", width/2, 445);
    }

    fill(184, 15, 10);
    text("YOUR HIGHSCORE: " + highscore + "\n\nREGULAR MODE \n\nTIME CHALLENGE MODE", width/2, 800);
    rectMode(CENTER);

    //    rect(width/2, 880, 500, 60); guideboxes for level selection
    //    rect(width/2, 980, 500, 60);

    rect(50, height-50, 40, 40);
    textAlign(LEFT);
    text("<-- SUPER MUTE", 100, height-40);
    textAlign(CENTER);
    fill(0, 0, 0);
    if (!kirby && !steve) {
      fill(102, 102, 102);
    }
    circle(width/2, height/2+20, 130);
    fill(85, 179, 247);
    circle(width/2, height/2+20, 100);
    fill(0, 0, 0);
    if (kirby == true) {
      fill(102, 102, 102);
    }
    circle(width/2-250, height/2+20, 130);
    kirbyImg = loadImage("kirbyFix.png");
    kirbyImg.resize(100, 0);
    image(kirbyImg, width/2-250, height/2+20);
    fill(0, 0, 0);
    if (steve == true) {
      fill(102, 102, 102);
    }
    circle(width/2+250, height/2+20, 130);
    steveImg = loadImage("steve.png");
    steveImg.resize(100, 0);
    image(steveImg, width/2+250, height/2+20);
    rectMode(CORNER);
    if (mousePressed && clickDelay == false) {
      clickDelay = true;
      if (mouseX>width/2-250-75 && mouseX<width/2-250+75 && mouseY > height/2+20-75 && mouseY <height/2+20+75) {
        kirby = true;
        steve = false;
      }
      if (mouseX>width/2+250-75 && mouseX<width/2+250+75 && mouseY > height/2+20-75 && mouseY <height/2+20+75) {
        kirby = false;
        steve = true;
      }
      if (mouseX>width/2-75 && mouseX<width/2+75 && mouseY > height/2+20-75 && mouseY <height/2+20+75) {
        kirby = false;
        steve = false;
      }
      if (mouseX>30 && mouseX<70 && mouseY > height-70 && mouseY < height-30) {
        musicOnOrOff();
      }
      if (mouseX > width/2-250 && mouseX < width/2+250 && mouseY > 880-30 && mouseY <880+30) {
        level = 1;
      }
      if (mouseX > width/2-250 && mouseX < width/2+250 && mouseY > 980-30 && mouseY < 980+30) {
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

    textSize(30);
    fill(212, 175, 55);
    textAlign(CENTER);
    text("Highscore: " + highscore, width-175, 50);
    text ("Your Score: " + score, width-190, 90);
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
    textSize(36);
    fill(212, 175, 55);
    textAlign(CENTER);
    text("Highscore: " + highscore, width-175, 50);
    text ("Your Score: " + score, width-190, 90);
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
