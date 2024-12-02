 
class Arrows{
 int arrowX;
 int arrowY;

  Arrows(){
   
 }
void display(){
  
rect(arrowX,arrowY,5,5);
}
void move(){
  arrowX = int(x);
  arrowY = int(y);
  
}
void movereal(){ 
arrowX = arrowX + 5* int(lookRight); 
    println(arrowX);

if(arrowX >= width ||arrowX <= 0 ){
    shoot = false;
  }
}
}
