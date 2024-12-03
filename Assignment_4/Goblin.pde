int gobX = 30;
int gobY = 30;
int timer = 100;
class goblin {

  goblin() {
  }
  void display() {
    tint(255, 255, 255, 255);
    image(goblin, gobX, gobY, 40, 40);
  }
  void move() {
    if(timer < 100){
    timer++;
    }else{}
    if (x+10>=gobX) {
      gobX++;
    }
    if (x+10<=gobX) {
      gobX--;
    }
    if (y+10>=gobY) {
      gobY++;
    }
    if (y+10<=gobY) {
      gobY--;
    }
    if (gobX+20>= x&& gobX <=x+20) {
      if (gobY+20>= y&& gobY <=y+20) {
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

  }
}
