class Shield extends Enemy {
 //Constructor
 Shield(float shieldX, float shieldY, float shieldXVelocity, float shieldYVelocity, float shieldSpeed) {
  super(shieldX, shieldY, shieldXVelocity, shieldYVelocity, shieldSpeed/1.5);
  hp = 10;
 }

 void display() {
  fill(233, hp*15, 240);
  ellipse(enemyX, enemyY, 15, 15);
 }

 //Should be slightly larger than average, slower than average and drop:
 //Sniper Ammo x2
 //Spawns every 300 frames after 30 kills.
 //Killed in 2 hits with sniper rifle (giving the sniper rifle more purpose)
 
 boolean isShield() {
  return true; 
 }
 
 boolean isBoss() {
   return false;
 }
 
  boolean isTarget() {
  return false; 
 }
 
 boolean isKing() {
   return false; 
  }
}
