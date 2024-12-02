// this is an enemie that will use
// pvevctors to move and their movement will slowly become faster
class Charger {
  PVector location;
  PVector velocity;
  Charger() {
    location = new PVector(100, 100);
    velocity = new PVector(0.1, 0);
  }
  void movement() {
    location.add(velocity);
    if (location.x<=x) {
      velocity.x  = velocity.x+ .01;
    }
    if (location.x>=x) {
      velocity.x  = velocity.x- .01;
    }
    if (location.y<=y) {
      velocity.y  = velocity.y+ .01;
    }
    if (location.y>=y) {
      velocity.y  = velocity.y - .01;
    }
    if (location.x <= x+10 && location.x+20 >= x) {
      if (location.y <= y+10 && location.y+20 >= y) {
        if (timer >= 100) {

          timer = 0;
          gameOver--;
        }
      }
    }
    // y axis
    if (location.y> height-30) {
      velocity.y  = velocity.y - velocity.y;
      velocity.y  = velocity.y - 0.1;
      velocity.x  = 0;
    }
    if (location.y<= 0) {
      velocity.y  = velocity.y - (velocity.y *1);
      velocity.y  = velocity.y + 0.1;
      velocity.x  = 0;
    }
    //x axis
    if (location.x> width-30) {
      velocity.x  = velocity.x - velocity.x;
      velocity.x  = velocity.x - 0.1;
      velocity.y  = 0;
    }
    if (location.x<= 0) {
      velocity.x  = velocity.x - (velocity.x *1);
      velocity.x  = velocity.x + 0.1;
      velocity.y  = 0;
    }
  }
  void display() {
    rect(location.x, location.y, 30, 30);
  }
}
