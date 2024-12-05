int gobX = 30;
int gobY = 30;
int timer = 100;
class goblin {

  goblin() {
  }
  void display() {
    //display the goblin using the sprite
    tint(255, 255, 255, 255);
    image(goblin, gobX, gobY, 40, 40);
  }
  void move() {
    // when the player gets hit
    // the timer get set to zero then needs to be incressed
    if(timer < 100){
    timer++;
    }
    // move right
    if (x+10>=gobX) {
      gobX++;
    }
    //move left
    if (x+10<=gobX) {
      gobX--;
    }
    // moves up
    if (y+10>=gobY) {
      gobY++;
    }
    // moves down
    if (y+10<=gobY) {
      gobY--;
    }
    // if the goblin hits the player 
    // the player losses a life
    if (gobX+20>= x&& gobX <=x+20) {
      if (gobY+20>= y&& gobY <=y+20) {
        if (timer >= 100) {
// the player cant be hit
          timer = 0;
          gameOver--;
          ;
        }
      }
    }
    // the player flickers when the timer is less then 100
    if (timer <= 100) {
      hurt = frameCount%40;
    }
    if (timer >= 100) {
      hurt = 255;
    }

  }
}
