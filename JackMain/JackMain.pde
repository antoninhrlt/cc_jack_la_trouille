PImage background;
// Orb orb;
ArrayList<Orb> orbs;
long time_counter;

void setup() {
  size(1200, 720);
  background = loadImage("ressources/Images/training_background.png");
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
      orbs.get(i).click();
    }
  }
}
