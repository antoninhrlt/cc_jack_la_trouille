import processing.sound.SoundFile;

SoundFile sound;
SoundFile shot_sound;
PImage background;
// Orb orb;
ArrayList<Orb> orbs;
long time_counter;

int score;

void setup() {
  size(1200, 720);
  textSize(50);
  
  background = loadImage("ressources/Images/training_background.png");

  shot_sound = new SoundFile(this, "ressources/Musics/shot.wav");
  sound = new SoundFile(this, "ressources/Musics/default.wav");
  sound.loop();
  
  time_counter = millis();
  // orb = new Orb();
  orbs = new ArrayList();
}

void draw() {
  clear();
  image(background, 0, 0);

  // orb.display();
  // orb.move();
  
  spawn();
  for (int i = 0; i < orbs.size(); i++) {
    Orb temp_orb = orbs.get(i);
    if (temp_orb.is_alive() == 0) {
      temp_orb.move();
      temp_orb.display();
    } else {
      orbs.remove(i);
      i--;
    }
  }
  
  text("Score: " + str(score), 10, 50);
}

void spawn() {
  if (time_counter <= millis()) {
    orbs.add(new Orb());
    time_counter = millis() + 200; // may be 1000
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    for (int i = 0; i < orbs.size(); i += 1) {
      if (orbs.get(i).click()) {
        score++;
        shot_sound.play();
      }
    }
  }
}
