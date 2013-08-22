class Weapon
{
 drawableObject weapon;
 ArrayList<drawableObject> ammo = new ArrayList<drawableObject>();
 int xPos;
 int yPos;
 int ammoSize;
 color ammoColor;
 int ammoLim;
 int ammoSpeed;
 String weaponType;
 color weaponColor;
 int weaponWidth;
  int weaponHeight;
 int weaponDir; //1facing left, 2 facing right
 PImage thisImage;
 Weapon()
 {
  weapon = new drawableObject(0,0,0,0,"");
 }
 Weapon(int x, int y, String wT)
 {
   xPos = x;
   yPos = y;
    ammoSize = 5;
    ammoColor = color(60,50,255);
    ammoLim = 20;
    ammoSpeed = 10;
     weaponDir = -1;
   weaponType = wT;
   weapon = new drawableObject(x,y,0,0,weaponType); 
    if(wT == "gun")
    thisImage = loadImage("player/pWeapon1.png");
 }
 Weapon(int x, int y, String wT, int wW, int wH, color wC, int aSi, int aSp,  color aC, int aL)
 {
  xPos = x;
  yPos = y;
  ammoSize = aSi;
  ammoColor = aC;
  ammoSpeed = aSp;
  ammoLim =aL;
  weaponType = wT;
  weaponColor = wC;
  weaponWidth = wW;
  weaponHeight = wH;
  weapon = new drawableObject(x,y,0,0,wT,wW,wH,wC); 
   
 }
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
 
 void use()
 {
   int x = weapon.xPos+weapon.oWidth*weaponDir;
   int y = weapon.yPos;
   if(ammo.size()<ammoLim)
     ammo.add(new drawableObject(x,y,weaponDir*ammoSpeed,0,"rect",ammoSize,ammoSize,ammoColor));
   
 }
 
 void updateAmmo()
 {
    for(int ii =0; ii < ammo.size(); ii++)
 {
  drawableObject am0 = ammo.get(ii);
  if(am0.checkInBounds()) //checkCollision?
  {   
  am0.drawObject();
  am0.moveObject();
  }
  else
  {
  ammo.remove(ii);
  }
 } 
 }
  
}

