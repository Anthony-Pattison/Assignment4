// this is an enemy that will use
// pvevctors to move and their movement will slowly become faster
class Charger {
  PVector location;
  PVector velocity;
  PVector acceleration;
  Charger() {
    // call all of my PVectors
    location = new PVector(100, 100);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0.01, 0);
  }
  void movement() {
    // add the velocity to the location of the charger
    location.add(velocity);
    if (location.x<=x) {
      // if the player is on the left side of the charger
      // add to the x value
      velocity.x  = velocity.x+ acceleration.x;
    }
    if (location.x>=x) {
      // if the player is on the right side of the charger
      // subtract to the x value
      velocity.x  = velocity.x- acceleration.x;
    }
    if (location.y<=y) {
      // if the player is on the bottom side of the charger
      // add to the y value
      velocity.y  = velocity.y+ acceleration.x;
    }
    if (location.y>=y) {
      // if the player is on the top side of the charger
      // subtract to the y value
      velocity.y  = velocity.y - acceleration.x;
    }
    // if the player gets hit by the charger then take
    // away a hit point
    if (location.x <= x+10 && location.x+20 >= x) {
      if (location.y <= y+10 && location.y+20 >= y) {
        if (timer >= 100) {
     // makes the player invonerable 
          timer = 0;
          gameOver--;
        }
      }
    }
    //if the charger hits the right side of the screen
    // stop its movement
    if (location.y> height-30) {
      velocity.y  = velocity.y - velocity.y;
      velocity.y  = velocity.y - 0.1;
      velocity.x  = 0;
    }
     //if the charger hits the left side of the screen
    // stop its movement
    if (location.y<= 0) {
      velocity.y  = velocity.y - (velocity.y *1);
      velocity.y  = velocity.y + 0.1;
      velocity.x  = 0;
    }
     //if the charger hits the top side of the screen
    // stop its movement
    if (location.x> width-30) {
      velocity.x  = velocity.x - velocity.x;
      velocity.x  = velocity.x - 0.1;
      velocity.y  = 0;
    }
     //if the charger hits the bottom side of the screen
    // stop its movement
    if (location.x<= 0) {
      velocity.x  = velocity.x - (velocity.x *1);
      velocity.x  = velocity.x + 0.1;
      velocity.y  = 0;
    }
  }
  // display the charger
  void display() {
     tint(255, 255, 255, 255);
    image(ghoast,location.x, location.y, 40, 40);
  }
}
