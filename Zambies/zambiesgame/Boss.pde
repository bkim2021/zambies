class Boss extends Enemy {
 //Constructor
 Boss(float bossX, float bossY, float bossXVelocity, float bossYVelocity, float bossSpeed) {
  super(bossX, bossY, bossXVelocity, bossYVelocity, bossSpeed/2.25);
  hp = 20;
 }

 void display() {
  pushMatrix();
  fill(50 + hp*10, 100, 0);
  ellipse(enemyX, enemyY, 50, 50);
  popMatrix();
 }

 boolean isBoss() {
   return true;
 } 
 
 boolean isShield() {
  return false; 
 }
 
 boolean isKing() {
   return false; 
  }
  
 boolean isTarget() {
  return false; 
 }
}
