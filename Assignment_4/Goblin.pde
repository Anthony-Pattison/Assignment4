int gobX = 30;
int gobY = 30;
class goblin {

  goblin() {
  }
  void display() {
    rect(gobX, gobY, 5, 5);
  }
  void move() {
    if (x>=gobX) {
      gobX++;
    }
    if (x<=gobX) {
      gobX--;
    }
    if (y>=gobY) {
      gobY++;
    }
    if (y<=gobY) {
      gobY--;
    }
    if (gobX>= x&& gobX <=x+10) {
      if (gobY>= y&& gobY <=y+10) {
        println("g");
      }
    }
  }
}
