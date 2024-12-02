int gobX = 30;
int gobY = 30;
int timer = 100;
class goblin {

  goblin() {
  }
  void display() {
    rect(gobX, gobY, 5, 5);
  }
  void move() {
    if(timer < 100){
    timer++;
    }else{}
    if (x+5>=gobX) {
      gobX++;
    }
    if (x+5<=gobX) {
      gobX--;
    }
    if (y+5>=gobY) {
      gobY++;
    }
    if (y+5<=gobY) {
      gobY--;
    }
    if (gobX>= x&& gobX <=x+10) {
      if (gobY>= y&& gobY <=y+10) {
        if (timer >= 100) {

          timer = 0;
          gameOver--;
          ;
        }
      }
    }
    if (timer <= 100) {
      hurt = frameCount%40;
    }
    if (timer >= 100) {
      hurt = 255;
    }
    println(timer);
  }
}
