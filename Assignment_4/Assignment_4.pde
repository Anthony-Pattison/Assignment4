boolean goUp = false;
boolean goDown = false;
boolean goLeft = false;
boolean goRight = false;
float moveX;
float moveY;
float x;
float y;
goblin myGoblin;
tree myTrees;
tree[] trees = new tree[20];
void setup() {
  size( 400, 400);
  myGoblin = new goblin();
  for (int i = 0; i<trees.length; i++) {
    trees[i]  = new tree(30*i-40);
  }
  x=200;
  y=200;
}
void draw(){
  background(#32C602);
  fill(0);
  myGoblin.display();
  myGoblin.move();
  rect(x, y, 20, 20);
   for (int i = 0; i<trees.length; i++) {
    trees[i].display();
  }
  move();
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
  }
  if (keyCode == 'D') {
    goRight = true;
    
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
    rect(x+20,y,20,5);
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
void mousePressed() {
  println(mouseX, mouseY);
}
