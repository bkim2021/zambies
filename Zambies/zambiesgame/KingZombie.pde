class KingZombie extends Enemy {
 //Constructor
 KingZombie(float kingX, float kingY, float kingXVelocity, float kingYVelocity, float kingSpeed) {
  super(kingX, kingY, kingXVelocity, kingYVelocity, kingSpeed/2);
  hp = 150;
 }

 void display() {
  pushMatrix();
  fill(0, 150-hp*2, 0);
  ellipse(enemyX, enemyY, 50, 50);
  popMatrix();
 }

 boolean isBoss() {
   return false;
 } 
 
 boolean isShield() {
  return false; 
 }
 
 boolean isTarget() {
  return false; 
 }
 
 boolean isKing() {
   return true; 
  }
}
