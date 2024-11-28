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
<<<<<<< HEAD
int score;
=======
Charger myCharger;
>>>>>>> charger
goblin myGoblin;
tree myTrees;

tree[] trees = new tree[20];
void setup() {
  size( 400, 400);
  myGoblin = new goblin();
  myCharger = new Charger();
  for (int i = 0; i<trees.length; i++) {
    trees[i]  = new tree(30*i-40);
  }
  x=200;
  y=200;
}
void draw(){
  background(#32C602);
  fill(0);
  myCharger.movement();
  myCharger.display();
  myGoblin.display();
  myGoblin.move();
  rect(x, y, 20, 20);
   for (int i = 0; i<trees.length; i++) {
    trees[i].display();
  }
  move();
  attack();
  fill(225);
  rect(337,375,45,20);
  fill(0);
  text("Score: "+score,340,390);
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
    lookRight = false;
  }
   if (keyCode == 'M') {
   att = false;
  }
}

void attack(){
 if (att){
   fill(255);
   rect(x-10+(32*int(lookRight)),y,10,5);
   if(gobX >=x-10+(32*int(lookRight)) && gobX<=x+(32*int(lookRight))){
     if(gobY >=y-2 && gobY<=y+5){
     gobY = 0;
     gobX = 0;
     score++;
   }
   }
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
