class Powerup {
 float powerupX;
 float powerupY;
 float powerupTime = 3;
 String name = "";
 //Constructor
 Powerup(float powerupX, float powerupY, float powerupTime, String name) {
  this.powerupX = powerupX;
  this.powerupY = powerupY;
  this.powerupTime = powerupTime;
  this.name = name;
 } 
 
 void display() {
  fill(255, 255, 255);
  stroke(0, 0, 0);
  strokeWeight(1);
  rect(powerupX, powerupY, 10, 10);
 }
 
 void benefit() {
  if(name.equalsIgnoreCase("healthBox")) {
   playerHP += 10;
  } else if(name.equalsIgnoreCase("shotgunAmmo")) {
   shotgunAmmo += 5; 
  } else if(name.equalsIgnoreCase("sniperAmmo")) {
   sniperAmmo += 2; 
  } else if(name.equalsIgnoreCase("speedBoost")) {
   playerSpeed += 0.2;
  }
 }
 
 //Determine collision
 boolean checkForCollision() {
  if(abs(powerupX - playerX) < 10 && abs(powerupY - playerX) < 10) {
   return true;
  } else {
   return false;
  }
 }
 
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
  return false; 
 }
}
