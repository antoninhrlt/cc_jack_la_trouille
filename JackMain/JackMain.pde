import processing.sound.SoundFile;

SoundFile sound;
SoundFile shot_sound;
PImage background;
PFont font;

ArrayList<Orb> orbs;
ArrayList<Entity> houses;

long time_counter;
int score;

void setup() {
  sound = new SoundFile(this, "ressources/Musics/default.wav");
  shot_sound = new SoundFile(this, "ressources/Musics/shot.wav");
  font = createFont("ressources/Police/halloween_font.ttf", 50);
  background = loadImage("ressources/Images/battle_background.png");
  time_counter = millis();

  orbs = new ArrayList();
  houses = new ArrayList();
  for (int i = 1; i < 6; i++) {
    houses.add(
      new Entity("House", 0, i * 120, 130, "ressources/Images/house.png")
    );
  }

  size(1200, 720);
  frameRate(60);
  textFont(font);

  sound.loop();  
}

void draw() {
  clear();
  image(background, 0, 0);
  
  showHouses();
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
  
  image(loadImage("ressources/Images/score_rect.png"), 0, 0);

  text(str(score), 70, 92);  
  text(str(orbs.size()), 1100, 60);
}

void showHouses() {
  for (int i = 0; i < 5; i++) {
    houses.get(i).display();
  }
}

void spawn() {
  if (time_counter <= millis()) {
    orbs.add(new Orb());
    time_counter = millis() + 500;
  }
}

void mousePressed() {
  shot_sound.play();
  fill(255, 45, 0);
  circle(mouseX, mouseY, 10);
  fill(255, 255, 255);
  
  if (mouseButton == LEFT) {
    for (int i = 0; i < orbs.size(); i += 1) {
      if (orbs.get(i).click()) {
        score++;
        
        // DEBUG: 
          println("mouse: " + mouseX + ":" + mouseY);
          println("entity: " + orbs.get(i).x + ":" + orbs.get(i).y + "\n");
      }
    }
  }
}
