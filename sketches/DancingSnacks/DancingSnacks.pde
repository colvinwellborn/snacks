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
  size(600, 600);
  background(0);
  frameRate(60);

  // load sprite sheet
  snacks_sheet = loadImage("snacks.png");
  snacks = new ArrayList<Snack>();
  getSnack();
}

void draw() {
  background(0);
  for (Snack s : snacks) {
    s.display();
    s.update();
  }
}

/*
 * Grabs a random snack from the snacks_sheet
 */
void getSnack() {
  if (snacks.size() < 100) {
    int i = int(random(0, SNACK_COUNT));
    int j = int(random(0, SNACK_COUNT));
    PImage snack = createImage(SNACK_WIDTH, SNACK_HEIGHT, ARGB);
    snack.copy(snacks_sheet, BORDER + i * SNACK_WIDTH, BORDER + j * SNACK_HEIGHT, SNACK_WIDTH, SNACK_HEIGHT, 0, 0, SNACK_WIDTH, SNACK_HEIGHT);
    snacks.add(new Snack(snack));
  }
}

/*
 * Deletes the first snack from the snacks ArrayList
 */
void removeSnack() {
  if (snacks.size() > 0) {
    snacks.remove(0);
  }
}

/*
 * Handles key actions from user
 */
void keyPressed() {
  if (key == ' ') {
    getSnack();
  }
  if (key == 'd') {
    removeSnack();
  }
}

/*
 * A class to represent a Snack.
 * A Snack has a snack PImage and the ability to display itself
 */
public class Snack {
  PImage snack;     // the image of the snack
  PVector v;        // the vector of the snack
  int xVel = 1;    // the x velocity
  int yVel = 1;    // the y velocit

  /*
   * Snack constructor
   */
  public Snack(PImage snack) {
    this.snack = snack;
    v = new PVector(int(random(0, (width - SNACK_WIDTH))), int(random(0, height - SNACK_HEIGHT)));
  }

  /*
   * Output the snack image to the screen
   */
  void display() {
    image(snack, v.x, v.y);
  }

  /*
   * Update the snack's vector
   */
  void update() {
    // Contain the x to the (0, width) range
    if (v.x < 0 || v.x > (width - SNACK_WIDTH)) {
      xVel *= -1;
    }
    // Constrain the y to the (0, height) range
    if (v.y < 0 || v.y > (height - SNACK_HEIGHT)) {
      yVel *= -1;
    }
    // Move the snack
    v.x += xVel;
    v.y += yVel;
  }
}