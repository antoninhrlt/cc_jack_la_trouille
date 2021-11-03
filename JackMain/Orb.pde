class Orb extends Entity {  
  public Orb() {
    super("Orb", 0, 0, 100, "ressources/Images/zombitrouille.png"); // x and y are updated later
    
    int[] lines = {180, 300, 420, 540, 660};
    int line_number = int(random(0, 5));
      
    x = 1200;
    y = lines[line_number];
    speed = int(random(2, 7));  
  }
  
  @Override
  public void display() {
    pushStyle();
    noStroke();
    image(image, x, y);
    popStyle();
  }
  
  @Override
  public void move() {
    x -= speed;
  }
  
  public int is_alive() {
    if (x < size) {
      return 1;
    }
    if (clicked == true) {
      return 2; // error code too
    }
    return 0;
  }
}
