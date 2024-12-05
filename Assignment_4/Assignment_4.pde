boolean goUp = false;
boolean goDown = false;
boolean goLeft = false;
boolean goRight = false;
boolean att = false;
boolean lookRight = false;
boolean arrowMove;
boolean game = false;
boolean shoot;

float moveX;
float moveY;
float x;
float y;

int health = 6;
int score;
int gameOver;
int hurt;

// calling the objects
Arrows myArrows;
Charger myCharger;
goblin myGoblin;
tree myTrees;

PImage heart;
PImage knight;
PImage goblin;
PImage ghoast;
// initializing the tree aray list
tree[] trees = new tree[20];

void setup() {
  size(400, 400);
  // loading all of the images for the character
  heart = loadImage("heart.png");
  knight = loadImage("knight.png");
  goblin = loadImage("goblin.png");
  ghoast = loadImage("ghoast.png");
  // initializing all the class objects for the enemies and arrows
  myGoblin = new goblin();
  myCharger = new Charger();
  myArrows = new Arrows();
  // this for loop draws all of the trees at the top of the
  // screen. The i values changes the x value of the tree drawing
  for (int i = 0; i<trees.length; i++) {
    trees[i]  = new tree(30*i-40);
  }
  // setting the location values for the knight
  x=200;
  y=200;
  // this is the knight's health
  gameOver = 3;
  // This is used to make the knight sprite fade in and out
  // after being attacked so the player knows they can't get hit
  hurt = 255;
}

void draw() {
  //this displays the title screen
  //this is also the screen that plays when the player 
  //runs out of life
  fill(0);
  rect(0, 0, width, height);
  fill(255);
  textSize(40);
  text("Kights & Goblins", 62, 100);
  fill(#32C602);
  rect(145,120,100,100);
  tint(255, 255, 255, 255);
  image(knight,145,120);
  textSize(20);
  fill(255);
  text("Press Space to play", 120, 250);
  text("Use wasd to move", 125, 270);
  text("Use m to attack", 130, 290);
  text("Once you get a score of 20", 100, 320);
  text("you can shoot your bow by using n!", 80, 340);
  textSize(10);
  // needs user input to run
  if (key == ' ') {
    game();
  }
// this runs the game
  if (game) {
    background(#32C602);
    // draws behind the hearts so the player
    // knows how much life they lost
    ellipse(45, 45, 5, 5);
    ellipse(75, 45, 5, 5);
    ellipse(105, 45, 5, 5);
    // for loop to draws the 
    //hearts according to the health of the player
    for (int i =1; (i-1)<gameOver; i++) {
      tint(255, 255, 255, 255);
      image(heart, (30*i), 30, 30, 30);
    }
    fill(0);
    // keeps the player from using the arrows untill
    // the score is greater then 20
    if (score >= 20) {
      // the arrow can only be shoot when the shoot boolean is false
      //the arrow stays with the player
      if (!shoot) {
        myArrows.move();
      }
     // if the boolean is true then the player can
     // go ahead and shoot their on arrow
      if (shoot) {
        myArrows.movereal();
      }
    }
    // calls all of the funtions in the classes
    // of the enimies and the arrows
    myArrows.display();
    myArrows.hit();
    myCharger.movement();
    myCharger.display();
    myGoblin.display();
    myGoblin.move();
    // below is the knights move and attack function
    move();
    attack();
    // drawing the knight with a hurt value so when 
    // the player gets hit they flicker
    tint(255, 255, 255, hurt);
    //draws the knight with the image i gave it
    image(knight, x, y, 40, 40);
    //for loop to display the trees at the top of the screen
    for (int i = 0; i<trees.length; i++) {
      trees[i].display();
    }
   // displays the score at the botom of the screen
    fill(225);
    rect(337, 375, 55, 20);
    fill(0);
    text("Score: "+score, 340, 388);
    //if the player got hit 3 times then the gave is over
    if (gameOver == 0) {
      game = false;
      
    }
  }
  // runs a funtion that resets all of the values that
  // got changed during the game
  if (game == false) {
    gameReset();
  }
}

// pulling key input and using booleans for movement and attacking
void keyPressed() {
  if (keyCode == 'W') {
    goUp = true;
  }
  if (keyCode == 'S') {
    goDown = true;
  }
  if (keyCode == 'A') {
    goLeft = true;
    lookRight = false;
  }
  if (keyCode == 'D') {
    goRight = true;
    lookRight = true;
  }
  if (keyCode == 'M') {
    att = true;
  }
  if (keyCode == 'N') {
    shoot = true;
  }
}
// seeing if the keys are not being pressed
void keyReleased() {
  if (keyCode == 'W') {
    goUp = false;
  }
  if (keyCode == 'S') {
    goDown = false;
  }
  if (keyCode == 'A') {
    goLeft = false;
  }
  if (keyCode == 'D') {
    goRight = false;
  }
  if (keyCode == 'M') {
    att = false;
  }
}

void attack() {
  // if the attack key was pressed
  if (att) {
    //draws the sword
    fill(255);
    rect(x+(32*int(lookRight)), y+15, 10, 5);
    // checks to see if the goblin was touching the sword
    // if so then it dies
    if (gobX+40 >= x+(22*int(lookRight)) && gobX<=x+5+(32*int(lookRight))) {
      if (gobY+40. >=y-2 && gobY<=y+15) {
        // the goblin respawns randomly on the screen
        gobY = int(random(10, height));
        gobX = int(random(10, width));
        // the player is awarded one point
        score++;
      }
    }
  }
  // the same attacking for the charger enemy
  if (att) {
    // the if statment checks if the sword ever hits the charger
    if (myCharger.location.x+30 >=x-10+(32*int(lookRight)) && myCharger.location.x<=x+(32*int(lookRight))) {
      if (myCharger.location.x+30 >=x-10+(32*int(lookRight)) && myCharger.location.x<=x+(32*int(lookRight))) {
        if (myCharger.location.y+30 >=y && myCharger.location.y<=y) {
         // if the charger is hit then it loses health
          health--;
        }
      }
    }
  }
  // if the charger runs out of health then
  // it also gets randomly placed somewhere on the frame
  if (health == 0) {
    myCharger.location.y = int(random(0, height));
    myCharger.location.x = int(random(0, width));
   // the charger gets its velocity set to zero
    myCharger.velocity.x = 0;
    // give it's health back
    health = 6;
    // the player gets two points
    score = score + 2;
  }
}
void move() {
  //reset the movement to zero
  moveX=0;
  moveY=0;
  //check for vertical movement
  if (goUp) {
    moveY = -2;
  }
  //check for vertical movement
  if (goDown) {
    moveY = 2;
  }
  //check for horizontal movement
  if (goRight) {
    moveX = 2;
  }
  // check for horizantal movement
  if (goLeft) {
    moveX = -2;
  }

  // add the movement
  x= x+moveX;
  y= y+moveY;
}
