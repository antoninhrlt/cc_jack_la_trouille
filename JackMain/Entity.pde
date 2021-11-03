class Entity {
  public String name;
  public int x;
  public int y;
  public int size;
  protected PImage image;
  protected int speed;

  protected boolean clicked;

  public Entity(String name, int x, int y, int size, String imagePath) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.image = loadImage(imagePath);
    
    resize(size);
  }
  
  public void display() {
    pushStyle();
    noStroke();
    image(image, x, y);
    popStyle();
  }
  
  public void resize(int size) {
    this.size = size;
    this.image.resize(size, size);
  }
    
  public boolean click() {
    if (
      mouseX > x - size &&
      mouseX < x + size && 
      mouseY > y - size &&
      mouseY < y + size
    ) {
       clicked = true;
       return true;
    } else {
       clicked = false; 
       return false;
    }
  }
  
   public void move() {
     // created to be overrided
   }
}
