class Enemy {
 float enemyX;
 float enemyY;
 float enemyXVelocity;
 float enemyYVelocity;
 float enemySpeed;
 int hp;

 //Constructor
 Enemy(float enemyX, float enemyY, float enemyXVelocity, float enemyYVelocity, float enemySpeed) {
  this.enemyX = enemyX;
  this.enemyY = enemyY;
  this.enemyXVelocity = enemyXVelocity;
  this.enemyYVelocity = enemyYVelocity;
  this.enemySpeed = enemySpeed;
  hp = 3;
 } 

  void move(float px, float py) {
    float angle = atan2(py-enemyY, px-enemyX);
    enemyXVelocity = enemySpeed*cos(angle);
    enemyYVelocity = enemySpeed*sin(angle);
    enemyX += enemyXVelocity;
    enemyY += enemyYVelocity;
  }
  
  void display() {
   pushMatrix();
   fill(50 + hp*70, 0, 0);
   ellipse(enemyX, enemyY, 10, 10);
   popMatrix(); 
  }
  
  void doDamage() {
   if(pistol == true || shotgun == true) {
     hp -= 1; 
   } else if(sniper == true) {
     hp -= 5; 
   }
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
   return false; 
  }
}
