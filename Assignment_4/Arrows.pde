
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
    // the arrow stays with the player
    arrowX = int(x)+20;
    arrowY = int(y)+20;
  }
  void movereal() {
    // once the player shoots the arrow if flies accros the screen
    arrowAcce = 5;
    arrowX -= arrowAcce;
    println(arrowAcce);
    if (arrowX >= width ||arrowX <= 0 ) {
      shoot = false;
    }
  }
  void hit() {
    // see if the arrow hit the goblin
    if (gobX+40 >=arrowX && gobX<=arrowX+10) {
      if (gobY+40 >=arrowY && gobY<=arrowY+10) {
        gobY = 0;
        gobX = 0;
        score++;
      }
    }
    // see if the charger was hit by the arrow
    if (myCharger.location.x+30 >=arrowX && myCharger.location.x<=arrowX) {
      if (myCharger.location.y+30 >=arrowY &&myCharger.location.y <=arrowY) {
        health--;
      }
    }
  }
}
