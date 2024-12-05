class tree {
  float treeX;
  float treeY;
  
  tree(float X) {

    treeX = X+20;
    treeY = 5;
  }
  void display() {
    // draws the trees based on the for loop in the main methood
    noStroke();
    fill(#7C4141);
    rect(treeX-1, treeY+10, 5, 20);
    fill(#247E06);
    triangle(treeX-5,treeY+15,treeX+10,treeY+15,treeX+2,treeY+5);
    triangle(treeX-10,treeY+20,treeX+15,treeY+20,treeX+2,treeY+10);
    triangle(treeX-15,treeY+25,treeX+20,treeY+25,treeX+2,treeY+15);
    
    
}
}
