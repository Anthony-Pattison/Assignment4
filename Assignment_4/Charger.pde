// this is an enemie that will use
// pvevctors to move and their movement will slowly become faster
class Charger{
  PVector location;
  PVector velocity; 
  Charger(){
    location = new PVector(100,100);
    velocity = new PVector(0.1,0);

  }
  void movement(){
    location.add(velocity);
   if(location.x>=x){
    velocity.x  = velocity.x* -1;
   } 
   
    
  }
}
