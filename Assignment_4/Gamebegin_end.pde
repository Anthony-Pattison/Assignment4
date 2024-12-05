void game() {
  // the game can be played
  game = true;
}
void gameReset() {
  // resets all of the values the game needs to run
  score = 0;
  gameOver = 3;
  x=200;
  y=200;
  gobX = 20;
  gobY = 20;
  myGoblin = new goblin();
  myCharger = new Charger();
  myArrows = new Arrows();
  textSize(10);
}
