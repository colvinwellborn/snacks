/**
 * A silly sketch of dancing snacks, taken from the snacks.png sheet found at
 * https://orig00.deviantart.net/4b9f/f/2013/015/d/3/100_food_sprites_by_neoriceisgood-d5rl3l4.png
 *
 * Author: Samuel Crider
 */
 
static final int SNACK_COUNT = 10;   // Number of sprites in a row of snacks_sheet
static final int BORDER = 2;         // size of border around snack_sheet
static final int SNACK_WIDTH = 62;   // Width of a snack sprite
static final int SNACK_HEIGHT = 62;  // Height of a snack sprite

PImage snacks_sheet;
ArrayList<Snack> snacks;

void setup() {
  // set up screen
  size(300, 300);
  background(0);
  frameRate(5);
  
  // load sprite sheet
  snacks_sheet = loadImage("snacks.png");
  snacks = new ArrayList<Snack>();
  loadSnacks();
}

void draw() {
  background(0);
  drawSnack();
}

/*
 * Loads the snacks array with Snack objects.
 * A Snack object is created for each snack in the snacks_sheet PImage
 */
void loadSnacks() {
  for (int i = 0; i < SNACK_COUNT; i++) {
    for (int j = 0; j < SNACK_COUNT; j++) {
      PImage snack = createImage(width, height, ARGB);
      snack.copy(snacks_sheet, BORDER + i * SNACK_WIDTH, BORDER + j * SNACK_HEIGHT, SNACK_WIDTH, SNACK_HEIGHT, 0, 0, width, height);
      snacks.add(new Snack(snack));
    }
  }
}

/*
 * Draws a random snack from the snacks array
 */
void drawSnack() {
  int i = int(random(0, snacks.size()));
  snacks.get(i).display();
}

/*
 * A class to represent a Snack.
 * A Snack has a snack PImage and the ability to display itself
 */
public class Snack {
  PImage snack;  // the image of the snack
  
  /*
   * Snack constructor
   */
  public Snack(PImage snack) {
    this.snack = snack;
  }
  
  /*
   * Output the snack image to the screen
   */
  void display() {
     image(snack, 0, 0);
  }
}