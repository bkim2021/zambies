class Target extends Enemy {
 //Constructor
 Target(float targetX, float targetY, float targetXVelocity, float targetYVelocity, float targetSpeed) {
  super(targetX, targetY, targetXVelocity, targetYVelocity, targetSpeed*2);
  hp = 1;
 }

 void display() {
  pushMatrix();
  fill(hp, 0, 255);
  ellipse(enemyX, enemyY, 10, 10);
  popMatrix();
 }

 //Shotgun ammo +1
 //Spawns every 600 frames after 60 kills.
 //Uberfast.
 
 boolean isShield() {
  return false; 
 }
 
 boolean isBoss() {
  return false;
 }
 
 boolean isTarget() {
  return true; 
 }
 
 boolean isKing() {
   return false; 
  }
}
