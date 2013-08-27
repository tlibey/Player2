class Enemies 
{
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  ArrayList<Loot> eLoot = new ArrayList<Loot>();
  int maxEnemies;
  Enemies()
  {
    maxEnemies = 1;
  }
  Enemies(int num)
  {
   maxEnemies = num; 
  }
  
  
  void updateEnemies(Player pl, Terrain tl)
  {
      
  for(int ii = 0; ii< enemies.size(); ii++)
    {
     Enemy en = enemies.get(ii);
      en.updateEnemy();
      en.handleType(pl);
      en.eWeapon.updateWeapon(en);
      }
  }
  void moveEnemies(int x, int y)
{
        
  for(int ii = 0; ii< enemies.size(); ii++)
    {
      Enemy en = enemies.get(ii);
      en.eWeapon.xPos+=x;
      en.eWeapon.yPos+=y;
      en.ebody.xPos+=x;
      en.ebody.yPos+=y; 
      if(en.eWeapon.ammo.size()>0)
      {
      for(int jj = 0; jj<en.eWeapon.ammo.size(); jj++)
      {
       en.eWeapon.ammo.get(jj).xPos+=x;
       en.eWeapon.ammo.get(jj).yPos+=y; 
      }
      }
    } 
    for(int ii = 0; ii <eLoot.size(); ii ++)
    {
      eLoot.get(ii).loot.xPos+=x;
      eLoot.get(ii).loot.yPos+=y;
    }
     
}
  void addBoss()
  {


  }
}



class Enemy
{
 drawableObject ebody;
 int eWidth = 30;
 int eHeight =30;
 int exSpeed = 0;
 int eySpeed = 0;
 int weaponHoldX = 20;
 int weaponHoldY = 20;
 int type = 0;
 
  Weapon eWeapon; 
 int totalHealth = 100;
 int currentHealth = 100;

 boolean isGrounded = false;
  
 Enemy()
 {
  ebody = new drawableObject(width-20,50,-1,0,"Player",20,50,color(40,240,0));
  eWeapon = new Weapon(0,0,"gun","guna");
 }
 Enemy(int x, int y, int t)
 {
   type = t;
  generateType();
  ebody = new drawableObject(x,y,exSpeed,eySpeed,"rect",eWidth,eHeight);
    eWeapon = new Weapon(x,y,"gun","guna");

 }
  
 void generateType()
 { 
   
   //in the type need to generate all factors of the enemy and its weapon, the more specificity - the more unique that enemy is
  //here mainly change the size shape and appearance of the enemy, change the ai in the handleType function
   if(type == 0)
   {
    exSpeed = -1; 
   }
   if(type == 1)
   {
     exSpeed = 1;
     eySpeed = 1;
     eHeight = 50;
     eWidth = 10;
     totalHealth = 400;
   }
   if(type == 3)
   {
    eHeight = 10;
    eWidth = 50;
    totalHealth =400; 
   }
  //assign type characteristics 
 }
 
 void updateEnemy()
 {
     
  ebody.drawObject();
  ebody.moveObject(); 
 }
 
 void handleType(Player pl)
 {
   //move to xaml formatted file?? 
   //handleALL AI here!
    if(type == 0 && pl.body.xPos != ebody.xPos) //homing
      {
       ebody.xSpeed = (-ebody.xPos+pl.body.xPos)/abs(ebody.xPos-pl.body.xPos)*1;
      if(frameCount%20==0)
     {
      eWeapon.use();
     }
    if(ebody.yPos!=pl.body.yPos)
     eWeapon.ammoSpeedY =  (-ebody.yPos+pl.body.yPos)/abs(ebody.yPos-pl.body.yPos)*1;
     eWeapon.ammoSpeedX = 1;
      }
   
   if(type == 1)
   {
    if(!isGrounded)
       ebody.ySpeed = 3;
      else if(isGrounded)
     {
      ebody.ySpeed = 0;
     } 
     if(frameCount%20==0)
     {
      eWeapon.use();
     }
     if(ebody.yPos!=pl.body.yPos)
     eWeapon.ammoSpeedY =  (-ebody.yPos+pl.body.yPos)/abs(ebody.yPos-pl.body.yPos)*1;

   }
   if(type == 2)
   {
     if(pl.body.xPos != ebody.xPos)
     {
            ebody.xSpeed = (-ebody.xPos+pl.body.xPos)/abs(ebody.xPos-pl.body.xPos)*1; 
     }
     if(!isGrounded)
           ebody.ySpeed = 3;
          else if(isGrounded)
         {
          ebody.ySpeed = 0;
         } 
     if(frameCount % 20 == 0)
         eWeapon.use();
   }
   else if(type == 3)
   {
      if(pl.body.xPos != ebody.xPos)
     {
            ebody.xSpeed = (-ebody.xPos+pl.body.xPos)/abs(ebody.xPos-pl.body.xPos)*1; 
     }
     if(!isGrounded)
           ebody.ySpeed = 1;
          else if(isGrounded)
         {
          ebody.ySpeed = 0;
         } 
     if(frameCount % 10==0)
     {
      ebody.yPos += -5; 
     }
     if(checkCollision(pl.body,ebody))
     {
      currentHealth = 0;
      pl.currentHealth-=80;
      showExplosion(pl.body.xPos,pl.body.yPos); 
     }
   }
   
   
 }
 
  
}
