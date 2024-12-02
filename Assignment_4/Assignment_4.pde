boolean goUp = false;
boolean goDown = false;
boolean goLeft = false;
boolean goRight = false;
boolean att = false;
boolean lookRight = false;
float moveX;
float moveY;
float x;
float y;
int health = 6;
int score;
int gameOver;
int hurt;
Charger myCharger;
goblin myGoblin;
tree myTrees;

PImage heart;
tree[] trees = new tree[20];
void setup() {
hurt = 255;
  size( 400, 400);
  heart = loadImage("heart.png");
  myGoblin = new goblin();
  myCharger = new Charger();
  for (int i = 0; i<trees.length; i++) {
    trees[i]  = new tree(30*i-40);
  }
  x=200;
  y=200;
  gameOver = 3;
}
void draw() {
  background(#32C602);
  ellipse(45, 45, 5, 5);
  ellipse(75, 45, 5, 5);
  ellipse(105, 45, 5, 5);
  for (int i =1; (i-1)<gameOver; i++) {
    image(heart, (30*i), 30, 30, 30);
  }
  fill(0);
  myCharger.movement();
  myCharger.display();
  myGoblin.display();
  myGoblin.move();
  fill(0,0,0,hurt);
  rect(x, y, 20, 20);
  for (int i = 0; i<trees.length; i++) {
    trees[i].display();
  }

  move();
  attack();
  fill(225);
  rect(337, 375, 55, 20);
  fill(0);
  text("Score: "+score, 340, 388);
}
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
}
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
  if (att) {
    fill(255);
    rect(x-10+(32*int(lookRight)), y, 10, 5);
    if (gobX >=x-10+(32*int(lookRight)) && gobX<=x+(32*int(lookRight))) {
      if (gobY >=y-2 && gobY<=y+5) {
        gobY = 0;
        gobX = 0;
        score++;
      }
    }
  }
  if (att) {
    if (myCharger.location.x+30 >=x-10+(32*int(lookRight)) && myCharger.location.x<=x+(32*int(lookRight))) {
      if (myCharger.location.x+30 >=x-10+(32*int(lookRight)) && myCharger.location.x<=x+(32*int(lookRight))) {
        if (myCharger.location.y+30 >=y && myCharger.location.y<=y) {
          health--;
        }
      }
    }
  }
  if (health == 0) {
    myCharger.location.y = 0;
    myCharger.location.x = 0;
    myCharger.velocity.x = 0;
    health = 6;
    score = score + 2;
  }
  println(health);
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
void mousePressed() {
  println(mouseX, mouseY);
}
