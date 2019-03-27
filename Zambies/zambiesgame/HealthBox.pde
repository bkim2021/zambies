class HealthBox extends Powerup {
  
  //Constructor
  HealthBox(float healthX, float healthY,  float healthTime, String name) {
   super(healthX, healthY, healthTime, name); 
  }
  
  void display() {
  pushMatrix();
  rectMode(CORNER);
  fill(255, 0, 0);
  //Draws the cross on the health box
  rect(powerupX+5, powerupY, 10, 20);
  //   x    y    xsize ysize
  rect(powerupX, powerupY+6, 20, 10);
  fill(255, 255, 255);
  noStroke();
  rect(powerupX, powerupY, 20, 20);
  popMatrix(); 
 }
 
 //Define the removing class as done in Enemy.
  
  boolean isHealthBox() {
  return true; 
  }
 
 boolean isSpeedBoost() {
  return false; 
 }
 
 boolean isShotgunAmmo() {
  return false; 
 }
 
 boolean isSniperAmmo() {
  return false; 
 } 
}
