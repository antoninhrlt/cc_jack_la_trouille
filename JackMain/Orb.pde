class Orb {
  private int orb_size;
  private int orb_color;
  private int pos_x;
  private int pos_y;
  public boolean clicked;
  
  public Orb() {
    orb_size = int(random(25, 50));
    int[] lines = {180, 300, 420, 540, 660};
    int line_number = int(random(0, 5));
      
    pos_x = 1250;
    pos_y = lines[line_number];
      
    orb_color = color(255, 127, 0);
  }
  
  public void display() {
    pushStyle();
    fill(orb_color);
    noStroke();
    circle(pos_x, pos_y, orb_size);
    popStyle();
  }
  
  public void move() {
    int speed = int(random(2, 5));  
    pos_x -= speed;
  }
  
  
  public int is_alive() {
    if (pos_x < orb_size) {
      return 1;
    }
    if (clicked == true) {
      return 2; // error code too
    }
    return 0;
  }
  
  public boolean click() {
    if (
      mouseX > pos_x - orb_size &&
      mouseX < pos_x + orb_size && 
      mouseY > pos_y - orb_size &&
      mouseY < pos_y + orb_size
    ) {
       clicked = true;
       return true;
    } else {
       clicked = false; 
       return false;
    }
  }
}
