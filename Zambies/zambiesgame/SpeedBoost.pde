class SpeedBoost extends Powerup {
  
  //Constructor
  SpeedBoost(float speedX, float speedY, float speedTime, String name) {
   super(speedX, speedY, speedTime, name); 
  }
  
  void display() {
  fill(0, 0, 255);
  rectMode(CORNER);
  rect(powerupX, powerupY, 20, 20);
  //Orange text saying "SPD"
  textSize(11);
  fill(255, 165, 0);
  text("SPD", powerupX+20, powerupY+12);
 }
 
 //Define the removing class as done in Enemy.
  
  boolean isHealthBox() {
  return false;
  }
 
 boolean isSpeedBoost() {
  return true; 
 }
 
 boolean isShotgunAmmo() {
  return false; 
 }
 
 boolean isSniperAmmo() {
  return false; 
 } 
}
