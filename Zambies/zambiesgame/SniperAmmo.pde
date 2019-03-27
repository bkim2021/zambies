class SniperAmmo extends Powerup {
  
  //Constructor
  SniperAmmo(float sniperAmmoX, float sniperAmmoY, float sniperAmmoTime, String name) {
   super(sniperAmmoX, sniperAmmoY, sniperAmmoTime, name);
  }
  
  void display() {
  //Rectangle
  noStroke();
  rectMode(CORNER);
  fill(0, 0, 0);
  rect(powerupX, powerupY, 2*3+1, 7*3+3);
  //Square on top creating "ammo"s
  fill(207, 181, 59);
  ellipse(powerupX+3.5, powerupY+2, 3*2.5, 3*2.5);
 }
 
 //Define the removing class as done in Enemy.
 
  boolean isHealthBox() {
  return false;
  }
 
 boolean isSpeedBoost() {
  return false; 
 }
 
 boolean isShotgunAmmo() {
  return false;
 }
 
 boolean isSniperAmmo() {
  return true; 
 } 
}
