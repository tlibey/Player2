class Weapon
{
 drawableObject weapon;
 ArrayList<drawableObject> ammo = new ArrayList<drawableObject>();
 int xPos;
 int yPos;
 int ammoSize;
 color ammoColor;
 int ammoLim;
 int ammoSpeedX;
 int ammoSpeedY;
 String ammoType;
 String weaponType;
 color weaponColor;
 int weaponWidth;
  int weaponHeight;
 int weaponDir; //1facing left, 2 facing right
 PImage thisImage;
 PImage ammoImage;
 String thisSound;
 Weapon()
 {
  weapon = new drawableObject(0,0,0,0,"");
 }
 Weapon(int x, int y, String wT, String aT)
 {
     ammoImage = findSprite(aT);
   thisImage = findSprite(wT);
   ammoType = aT;
   weaponType = wT;
   generateWeapon();
   xPos = x;
   yPos = y;
   weapon = new drawableObject(x,y,0,0,weaponType); 
 
     }
 
 //// WEAPON GENERATION SECION!!!
 void generateWeapon()
 {
  if(ammoType == "guna")
  {
    ammoSize = ammoImage.height;
    ammoColor = color(60,50,255); //not used

    
    
  }
  if(weaponType == "gun")
  {
    ammoLim = 20;
    ammoSpeedX = 10;
    ammoSpeedY = 0;
    weaponDir = -1;
   thisSound = "playerShoot";
  }
  
   
 }
 ///END WEAPON GENERATION!!!
 
 void updateWeapon(int x, int y)
 {
   
  weapon.xPos = x;
  weapon.yPos = y;
  weapon.drawObject(); 
 }
 
 void updateWeapon(Player pl)
 {     weapon.yPos = pl.body.yPos+pl.body.oHeight/3;

     if(pl.body.xSpeed>0)
     {
      weaponDir = 1; 
     }
     else if(pl.body.xSpeed<0)
     {
      weaponDir = -1; 
     }
     if(weaponDir == 1)
     {
         weapon.xPos = pl.body.xPos+pl.body.oWidth;
                  copy(thisImage,thisImage.width,0,-thisImage.width,thisImage.height,weapon.xPos,weapon.yPos,thisImage.width,thisImage.height); 

   
     }
     else
     {
         weapon.xPos = pl.body.xPos-weapon.oWidth;
              image(thisImage,weapon.xPos,weapon.yPos,thisImage.width,thisImage.height); 
     }
     this.updateAmmo();

    
      
      
 }
 
 void updateWeapon(Enemy en)
 {
   weapon.yPos = en.ebody.yPos+en.weaponHoldY;
   if(en.ebody.xSpeed>0)
     {
      weaponDir = 1; 
     }
     else if(en.ebody.xSpeed<0)
     {
      weaponDir = -1; 
     }
     if(weaponDir == 1)
     {
         weapon.xPos = en.ebody.xPos+en.weaponHoldX;
                  copy(thisImage,thisImage.width,0,-thisImage.width,thisImage.height,weapon.xPos,weapon.yPos,thisImage.width,thisImage.height); 

   
     }
     else
     {
         weapon.xPos = en.ebody.xPos-en.weaponHoldX;
              image(thisImage,weapon.xPos,weapon.yPos,thisImage.width,thisImage.height); 
     }
   
        this.updateAmmo();

 }
 
 void use()
 {
   int x = weapon.xPos+weapon.oWidth*weaponDir;
   int y = weapon.yPos;
   if(ammo.size()<ammoLim)
     {ammo.add(new drawableObject(x,y,weaponDir*ammoSpeedX,ammoSpeedY,"rect",ammoSize,ammoSize,ammoColor));
     playSound(thisSound);
     }
 }
 
 void updateAmmo()
 {
    for(int ii =0; ii < ammo.size(); ii++)
 {
  drawableObject am0 = ammo.get(ii);
  if(am0.checkInBounds()) //checkCollision?
  {   if(ammoImage!=null)
  { if(weaponDir>0)
      copy(ammoImage,ammoImage.width,0,-ammoImage.width,ammoImage.height,am0.xPos,am0.yPos,ammoImage.width,ammoImage.height);
   else 
   {
           image(ammoImage,am0.xPos,am0.yPos,ammoImage.width,ammoImage.height);

   }
  }
  am0.moveObject();
  }
  else
  {
  ammo.remove(ii);
  }
 } 
 }
  
}

