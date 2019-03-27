class ShotgunAmmo extends Powerup {
  
  //Constructor
  ShotgunAmmo(float shotgunAmmoX, float shotgunAmmoY, float shotgunAmmoTime, String name) {
   super(shotgunAmmoX, shotgunAmmoY, shotgunAmmoTime, name); 
  }
  
  void display() {
  //Rectangle
  noStroke();
  rectMode(CORNER);
  fill(255, 0, 0);
  rect(powerupX, powerupY, 3*3, 8*3);
  //Square on top creating "ammo"
  fill(255, 255, 0);
  rect(powerupX, powerupY+20, 3*3, 2*3);
 }
 
 //Define the removing class as done in Enemy.
  
  boolean isHealthBox() {
  return false;
  }
 
 boolean isSpeedBoost() {
  return false; 
 }
 
 boolean isShotgunAmmo() {
  return true;
 }
 
 boolean isSniperAmmo() {
  return false; 
 } 
}
