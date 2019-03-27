class Bullet {
 float bulletX, bulletY, bulletXVelocity, bulletYVelocity;
 Bullet(float bulletX, float bulletY, float bulletXVelocity, float bulletYVelocity) {
  this.bulletX = bulletX;
  this.bulletY = bulletY;
  this.bulletXVelocity = bulletXVelocity;
  this.bulletYVelocity = bulletYVelocity;
 } 
 
 void move() {
  bulletX += bulletXVelocity;
  bulletY += bulletYVelocity; 
 }
 
 void display() {
  pushMatrix();
  stroke(0);
  strokeWeight(1);
  translate(bulletX, bulletY);
  fill(0);
  ellipse(0, 0, 4, 4);
  noStroke(); 
  popMatrix();
 }
}