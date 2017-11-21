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
  addSnack();
}

void draw() {
  background(0);
  for (Snack s : snacks) {
    s.display();
    s.update();
  }
}

void addSnack() {
  if (snacks.size() < 100) {
    PImage snack = getSnack();
    snacks.add(new Snack(snack));
  }
}

/*
 * Grabs a random snack from the snacks_sheet
 */
PImage getSnack() {
  int i = int(random(0, SNACK_COUNT));
  int j = int(random(0, SNACK_COUNT));
  PImage snack = createImage(SNACK_WIDTH, SNACK_HEIGHT, ARGB);
  snack.copy(snacks_sheet, BORDER + i * SNACK_WIDTH, BORDER + j * SNACK_HEIGHT, SNACK_WIDTH, SNACK_HEIGHT, 0, 0, SNACK_WIDTH, SNACK_HEIGHT);
  return snack;
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
    addSnack();
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
  final float HALF = 0.5;  // a half, for probability

  PImage snack;            // the image of the snack
  PVector pos;             // a vector for snack position
  PVector vel;             // a vector of snack velocity

  /*
   * Snack constructor
   */
  public Snack(PImage snack) {
    this.snack = snack;
    pos = new PVector(int(random(0, (width - SNACK_WIDTH))), int(random(0, height - SNACK_HEIGHT)));
    vel = new PVector(0, 0);
    if (random(0, 1) < HALF) {
      vel.x = -1;
    } else {
      vel.x = 1;
    }
    if (random(0, 1) < HALF) {
      vel.y = -1;
    } else {
      vel.y = 1;
    }
  }

  /*
   * Output the snack image to the screen
   */
  void display() {
    image(snack, pos.x, pos.y);
  }

  /*
   * Update the snack's vector
   */
  void update() {
    // Contain the x to the (0, width) range
    if (pos.x < 0 || pos.x > (width - SNACK_WIDTH)) {
      vel.x *= -1;
      this.snack = getSnack();
    }
    // Constrain the y to the (0, height) range
    if (pos.y < 0 || pos.y > (height - SNACK_HEIGHT)) {
      vel.y *= -1;
      this.snack = getSnack();
    }
    // Move the snack
    pos.x += vel.x;
    pos.y += vel.y;
  }
}