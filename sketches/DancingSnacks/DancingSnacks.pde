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
PImage[][] snacks;

void setup() {
  // set up screen
  size(300, 300);
  background(0);
  frameRate(5);
  
  // load sprite sheet
  snacks_sheet = loadImage("snacks.png");
  snacks = new PImage[SNACK_COUNT][SNACK_COUNT];
  for (int i = 0; i < SNACK_COUNT; i++) {
    for (int j = 0; j < SNACK_COUNT; j++) {
      snacks[i][j] = createImage(width, height, ARGB);
    }
  }
  loadSnacks();
}

void draw() {
  background(0);
  drawSnack();
}

/*
 * Loads the snacks array with snacks from the snacks_sheet PImage
 */
void loadSnacks() {
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      snacks[i][j].copy(snacks_sheet, BORDER + i * SNACK_WIDTH, BORDER + j * SNACK_HEIGHT, SNACK_WIDTH, SNACK_HEIGHT, 0, 0, width, height);
    }
  }
}

/*
 * Draws a random snack from the snacks array
 */
void drawSnack() {
  int i = int(random(0, 10));
  int j = int(random(0, 10));
  image(snacks[i][j], 0, 0);
}