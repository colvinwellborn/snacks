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
static final int Y_COLLISION = 1;    // Represents two snacks intersecting vertically
static final int X_COLLISION = 2;    // Represents two snacks intersecting horizontally 

final color PINK = color(255, 106, 213);
final color PURPLE = color(173, 140, 255);

PImage splash_screen;                // splash screen for program load
boolean isSplash;                    // true if in splash screen; false else
PImage snacks_sheet;                 // sprite sheet of all snacks
ArrayList<Snack> snacks;             // a container for all Snack objects
PFont font;                          // font object for cheesy 80's font

/*
 * Prepares the canvas, loads the snack_sheet,
 * and adds an initial snack
 */
void setup() {
  // set up screen
  size(600, 600);
  splash_screen = loadImage("snax_deluxe.png");
  splash_screen.resize(width, height);
  isSplash = true;

  // sets up the font
  font = createFont("SFAlienEncounters-Italic.ttf", 100);
  textFont(font);

  // load sprite sheet
  snacks_sheet = loadImage("snacks_nofill.png");
  snacks = new ArrayList<Snack>();
}

/*
 * Draws any snacks in the snacks ArrayList
 */
void draw() {
  while (isSplash) {
    image(splash_screen, 0, 0);
    return;
  }
  // Draw the gradient
  for (int i = 0; i <= height; i++) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(PINK, PURPLE, inter);
    stroke(c);
    line(0, i, width, i);
  }
  // Write the text
  text("Snacks!", 65, 100, width, height);
  text("Snacks!", 65, 250, width, height);
  text("Snacks!", 65, 400, width, height);
  //Display the snacks
  for (Snack s : snacks) {
    s.display();
    s.update();
  }
  for (int i = 0; i < snacks.size(); i++) {
    for (int j = i + 1; j < snacks.size(); j++) {
      if (snacks.get(i).intersects(snacks.get(j).getPos()) == Y_COLLISION) {
        snacks.get(i).invertY();
        snacks.get(j).invertY();
      } else if (snacks.get(i).intersects(snacks.get(j).getPos()) == X_COLLISION) {
        snacks.get(i).invertX();
        snacks.get(j).invertX();
      }
    }
  }
}

/*
 * Adds a snack to the snacks ArrayList
 */
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
    if (isSplash) {
      isSplash = false;
    }
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
      this.invertX();
      this.snack = getSnack();
    }
    // Constrain the y to the (0, height) range
    if (pos.y < 0 || pos.y > (height - SNACK_HEIGHT)) {
      this.invertY();
      this.snack = getSnack();
    }
    // Move the snack
    pos.add(vel);
  }

  PVector getPos() {
    return pos;
  }

  int intersects(PVector other) {
    PVector dist = new PVector(abs(pos.x - other.x), abs(pos.y - other.y));
    if (dist.x < SNACK_WIDTH && dist.y < SNACK_HEIGHT) {
      if (dist.x < dist.y) {
        return Y_COLLISION;
      }
      return X_COLLISION;
    }
    return 0;
  }

  void invertX() {
    vel.x *= -1;
  }

  void invertY() {
    vel.y *= -1;
  }
}