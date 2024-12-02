
class Arrows {
  int arrowX;
  int arrowY;
  float arrowAcce = 0;
  Arrows() {
  }
  void display() {

    rect(arrowX, arrowY, 5, 5);
  }
  void move() {
    arrowX = int(x);
    arrowY = int(y);
  }
  void movereal() {
    arrowAcce = 5;
    arrowX -= arrowAcce;
    println(arrowAcce);
    if (arrowX >= width ||arrowX <= 0 ) {
      shoot = false;
    }
  }
  void hit() {
    if (gobX >=arrowX && gobX<=arrowX+10) {
      if (gobY >=arrowY && gobY<=arrowY+10) {
        gobY = 0;
        gobX = 0;
        score++;
      }
    }
    if (myCharger.location.x+30 >=arrowX && myCharger.location.x<=arrowX) {
      if (myCharger.location.y+30 >=arrowY &&myCharger.location.y <=arrowY) {
        health--;
        println("come");
      }
    }
  }
}
