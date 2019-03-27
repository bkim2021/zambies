/**
* Final project for Programming
*
* @author Brett Kim
* (C) Copyright 2017
*/

import java.util.Random;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Powerup> powerups = new ArrayList<Powerup>();

PImage bg;

int playerX = 300;
int playerY = 300;
int playerHP = 100;

float playerSpeed = 2;
float zSpeed = 0.5;

boolean left = false;
boolean right = false;
boolean up = false;
boolean down = false;

boolean pistol = true;
boolean shotgun = false;
boolean sniper = false;
boolean ammoText = false;
boolean sniperText = false;

int ammoTextColor = 250;
int sniperTextColor = 250;

int zombieKills = 0;

int pistolCooldown = 20;
int shotgunCooldown = 30;
int pistolCount = 0;
int shotgunCount = 0;
int shotgunAmmo = 20;
int sniperAmmo = 10;
int sniperCount = 0;
int sniperCooldown = 50;

String weapon = "G17";

String url = "http://opengameart.org/sites/default/files/oga-textures/desert.png";

void setup() {
 size(600, 600); 
 frameRate(60);
 noStroke();
 bg = loadImage(url, "png");
}

void draw() {
 if(playerHP > 0) {
   if(frameCount%20==0 && enemies.size() < 10) {
    float xx = random(0, width);
    float yy = random(0, width);
    while(dist(xx, yy, playerX, playerY) < 10) {
     xx = random(0, width);
     yy = random(0, width); 
    }
    
    enemies.add(new Enemy(xx, yy, 0, 0, zSpeed));
   } 
   noStroke();
   
   if(mousePressed) {
    fire();
    if(up) {
     playerY -= playerSpeed;
    }
    if(left) {
     playerX -= playerSpeed; 
    }
    if(right) {
     playerX += playerSpeed; 
    }
    if(down) {
     playerY += playerSpeed; 
    }
   }
    
   background(255, 255, 255);
   if(up) {
     playerY -= playerSpeed; 
   }
   if(left) {
     playerX -= playerSpeed;
   }
   if(right) {
     playerX += playerSpeed;
   }
   if(down) {
     playerY += playerSpeed;
   }
   
   image(bg, 0, 0);
   pushMatrix();
   translate(playerX, playerY);
   float dx = mouseX - playerX;
   float dy = mouseY - playerY;
   float angle = atan2(dy, dx);
   rotate(angle);
   rectMode(CENTER);
   strokeWeight(1);
   stroke(0);
   //This draws the head!
   fill(95, 158, 160);
   ellipse(0, 0, 10, 10);
   //Draw the pistol + hand
   if(pistol == true) {
    ellipse(7, 3.5, 4, 4);
    fill(100);
    rect(10, 2, 8, 2); 
   } else if(shotgun == true) {
    ellipse(7, 3.5, 4, 4);
    ellipse(13, 0.5, 4, 4);
    fill(139, 69, 19);
    rect(13, 2, 17, 3); 
   } else if(sniper == true) {
    ellipse(10, 4, 4, 4);
    fill(140);
    rect(14, 3, 17, 4);
   }
   noStroke();
   popMatrix();
   
   for(int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.move();
    b.display(); 
    
    if(b.bulletX > width || b.bulletX < 0 || b.bulletY > height || b.bulletY < 0) {
     bullets.remove(i);
    }
   }
   
   for(int i=0; i<enemies.size(); i++) {
    Enemy e = enemies.get(i);
    e.move(playerX, playerY);
    e.display(); 
   
     if(e.enemyX > width) {
      e.enemyX = width;
     }
     if(e.enemyX < 0) {
      e.enemyX = 0; 
     }
     if(e.enemyY > height) {
      e.enemyY = height; 
     }
     if(e.enemyY < 0) {
      e.enemyY = 0; 
     }
     
     for(int j=0; j<bullets.size(); j++) {
      Bullet b = bullets.get(j);
      if(abs(b.bulletX - e.enemyX) < 10 && abs(b.bulletY - e.enemyY) < 10) {
       e.doDamage();
       bullets.remove(j);
       break;
      } 
     }
     
     for(int k=0; k<powerups.size(); k++) {
      Powerup p = powerups.get(k);
     if(abs(p.powerupX - playerX) < 10 && abs(p.powerupY - playerY) < 30) {
         p.benefit();
         powerups.remove(k);
       } 
     p.display();
     }
 
     
      //Zombie hits playerS
     if(abs(e.enemyX - playerX) < 10 & abs(e.enemyY - playerY) < 10) {
     // playerHP -= 10;
      if(!e.isBoss() && !e.isShield() && !e.isTarget()) {
        playerHP -= 10;
      }
      
      if(e.isShield()) {
       playerHP -= 20; 
      }
      
      if(e.isTarget()) {
        playerHP -= 20;
      }
      
      if(e.isBoss()) {
       playerHP -= 20; 
      }
      
      if(!e.isBoss()) {
       enemies.remove(i);
      } 
     }
     
     if(e.hp <= 0) {
      if(e.isBoss()) {
       addAmmo();
      }
      if(e.isShield()) {
       addSniperAmmo(); 
      }
      enemies.remove(i); 
      zombieKills++;
      if(zombieKills % 10 == 0) {
       zSpeed += 0.15; 
      }
      if(zombieKills % 30 == 0) {
        float xx = random(0, width);
        float yy = random(0, width);
        while(dist(xx, yy, playerX, playerY) < 10) {
         xx = random(0, width);
         yy = random(0, width); 
        }
      enemies.add(new Boss(xx, yy, 0, 0, zSpeed));
      }
      if(zombieKills % 10 == 0 && zombieKills >= 30) {
       float xx = random(0, width);
       float yy = random(0, width);
       while(dist(xx, yy, playerX, playerY) < 10) {
         xx = random(0, width);
         yy = random(0, width);
       }
       enemies.add(new Shield(xx, yy, 0, 0, zSpeed)); 
      }
      if(zombieKills % 10 == 0 && zombieKills >= 60) {
       float xx = random(0, width);
       float yy = random(0, width);
       while(dist(xx, yy, playerX, playerY) < 10) {
        xx = random(0, width);
        yy = random(0, width);
       }
       enemies.add(new Target(xx, yy, 0, 0, zSpeed));
      }
      if(zombieKills == 200) {
          float xx = random(0, width);
          float yy = random(0, width);
          while(dist(xx, yy, playerX, playerY) < 10) {
            xx = random(0, width);
            yy = random(0, width);
          }
          enemies.add(new KingZombie(xx, yy, 0, 0, zSpeed));
       }
     } //end of e.hp
   } //end of zombies for loop
  
  
   if(zombieKills >= 50 && frameCount % 1000 == 0) {
     Random randomGenerator = new Random();
     int randomInt = randomGenerator.nextInt(4);
     switch(randomInt) {
      case 0:
       float xx = random(0, width);
       float yy = random(0, width);
       while(dist(xx, yy, playerX, playerY) < 20) {
          xx = random(0, width);
          yy = random(0, width);
       }
       powerups.add(new HealthBox(xx, yy, 3, "healthBox"));
       break;
      case 1:
       float xx2 = random(0, width);
       float yy2 = random(0, width);
       while(dist(xx2, yy2, playerX, playerY) < 20) {
          xx2 = random(0, width);
          yy2 = random(0, width);
       }
       powerups.add(new SpeedBoost(xx2, yy2, 3, "speedBoost"));
       break;
      case 2:
       float xx3 = random(0, width);
       float yy3 = random(0, width);
       while(dist(xx3, yy3, playerX, playerY) < 20) {
          xx3 = random(0, width);
          yy3 = random(0, width);
       }
       powerups.add(new ShotgunAmmo(xx3, yy3, 3, "shotgunAmmo"));
       break;
      case 3:
      float xx4 = random(0, width);
       float yy4 = random(0, width);
       while(dist(xx4, yy4, playerX, playerY) < 20) {
          xx4 = random(0, width);
          yy4 = random(0, width);
       }
       powerups.add(new SniperAmmo(xx4, yy4, 3, "sniperAmmo"));
       break;
      default:
       println("error: powerup isn't generating at number " + randomInt);
       break;
     }
   }  
   
   if(playerX > width) {
    playerX = width; 
   }
   if(playerX < 0) {
    playerX = 0; 
   }
   if(playerY > height) {
    playerY = height; 
   }
   if(playerY < 0) {
     playerY = 0;  
   }
  } else if(playerHP <= 0) {
    
    textSize(50);
    background(255, 0, 0);
    fill(0);
    textAlign(CENTER);
    text("GAME OVER!", width/2, height/2);
    text("You slayed " + zombieKills + " zombies.", width/2, height/2 - 75);
  }
  
  if(pistolCount > 0) {
   pistolCount--;
   fill(255, 0, 0);
   textSize(12);
   text("pistol cooldown: " + pistolCount, 100, 10); 
  } else {
   fill(0, 102, 0);
   textSize(12);
   text("pistol ready!", 100, 10); 
  }

  if(shotgunCount > 0) {
   textAlign(LEFT);
   shotgunCount--;
   fill(255, 0, 0);
   text("shotgun cooldown: " + shotgunCount, 30, 20); 
  } else if(shotgunAmmo > 0) {
    textAlign(LEFT);
   fill(0, 102, 0);
   text("shotgun ready!", 30, 20); 
  } else {
    textAlign(LEFT);
   fill(255, 0, 0);
   text("shotgun empty!", 30, 20); 
  }
  
  if(sniperCount > 0) {
   textAlign(LEFT);
   sniperCount--;
   fill(255, 0, 0);
   text("sniper cooldown: " + sniperCount, 30, 30); 
  } else if(sniperAmmo > 0) {
    textAlign(LEFT);
   fill(0, 102, 0);
   text("sniper ready!", 30, 30); 
  } else {
    textAlign(LEFT);
   fill(255, 0, 0);
   text("sniper empty!", 30, 30); 
  }
  
  fill(0, 102, 0);
  
  textAlign(RIGHT);
  text("weapon: " + weapon, width-10, 10);
  if(weapon.equalsIgnoreCase("G17")) {
   text("Ammo: infinite", width-10, 20); 
  } else if(weapon.equalsIgnoreCase("M870")) {
   text("Ammo: " + shotgunAmmo, width-10, 20); 
  } else if(weapon.equalsIgnoreCase("M24")) {
   text("Ammo: " + sniperAmmo, width-10, 30); 
  }
  
  fill(0, 102, 0);
  textAlign(LEFT);
  text("Zombies slain: " + zombieKills, 10, height-10);
  textAlign(RIGHT);
  text("Player HP: " + playerHP, width-10, height-10);
  if(ammoText == true) {
   ammoTextDisplay(); 
  }
  if(sniperText == true) {
   sniperTextDisplay(); 
  }
  
  fill(0, 0, 255, 50);
  ellipse(mouseX, mouseY, 15, 15);
} // End of for loop

void fire() {
 float dx = mouseX - playerX;
 float dy = mouseY - playerY;
 float angle = atan2(dy, dx);
 float speed = 8;
 
 float vx = speed*cos(angle);
 float vy = speed*sin(angle);

 if(pistolCount == 0 && pistol == true) {
  bullets.add(new Bullet(playerX, playerY, vx, vy));
  pistolCount = pistolCooldown;
 }
 
 if(shotgunCount == 0 && shotgun == true & shotgunAmmo > 0) {
  for(int i = 0; i < 5; i++) {
     float spread = random(PI/4) - PI/8;
     vx = speed*cos(angle+spread);
     vy = speed*sin(angle+spread);
     bullets.add(new Bullet(playerX, playerY, vx, vy));
  }
  shotgunCount = shotgunCooldown;
  shotgunAmmo--; 
 }
 
 if(sniperCount == 0 && sniper == true & sniperAmmo > 0) {
  bullets.add(new Bullet(playerX, playerY, vx, vy));
  vx = speed*cos(angle);
  vy = speed*sin(angle);
  sniperCount = sniperCooldown;
  sniperAmmo--;
 }
 
}

void addAmmo() {
 ammoText = true;
 ammoTextColor = 250;
 shotgunAmmo += 20; 
}

void addSniperAmmo() {
  sniperText = true;
  sniperTextColor = 250;
  sniperAmmo += 2;
}

void ammoTextDisplay() {
 fill(0, 255, 0, ammoTextColor);
 ammoTextColor -= 1;
 if(ammoTextColor <= 0) {
  ammoText = false;
 } 
}

void sniperTextDisplay() {
 fill(0, 255, 0, ammoTextColor);
 sniperTextColor -= 1;
 if(sniperTextColor <= 0) {
  sniperText = false;
 } 
}

void keyPressed() {
  switch(key) {
    case 'w':
      up = true;
      break;
    case 'a':
      left = true;
      break;
    case 's':
      down = true;
      break;
    case 'd':
      right = true;
      break;
    case '1':
      pistol = true;
      shotgun = false;
      sniper = false;
      weapon = "G17";
      break;
    case '2':
      pistol = false;
      shotgun = true;
      sniper = false;
      weapon = "M870";
      break;
    case '3':
      pistol = false;
      shotgun = false;
      sniper = true;
      weapon = "M24";
      break;
    case '*':
      playerHP = 9999;
  }
}

void keyReleased() {
  switch(key) {
    case 'w':
      up = false;
      break;
    case 'a':
      left = false;
      break;
    case 's':
      down = false;
      break;
    case 'd':
      right = false;
      break;
  }
}
