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
     
      }
  }
  void moveEnemies(int x, int y)
{
        
  for(int ii = 0; ii< enemies.size(); ii++)
    {
      drawableObject en = enemies.get(ii).ebody;
      en.xPos+=x;
      en.yPos+=y; 
    } 
    for(int ii = 0; ii <eLoot.size(); ii ++)
    {
      eLoot.get(ii).loot.xPos+=x;
      eLoot.get(ii).loot.yPos+=y;
    }
     
}
  void addBoss()
  {
   enemies.add(new Enemy(width-60,40,0,0,40,40,0,50));
   Enemy boss = enemies.get(enemies.size()-1);
   boss.ebody.type = "boss";
    
  }
}



class Enemy
{
 drawableObject ebody;
 int eWidth = 30;
 int eHeight =30;
 int exSpeed = 0;
 int eySpeed = 0;
 int type = 0;
 
  Weapon eWeapon; 
 int totalHealth = 100;
 int currentHealth = 100;

 boolean isGrounded = false;
  
 Enemy()
 {
  ebody = new drawableObject(width-20,50,-1,0,"Player",20,50,color(40,240,0));
  eWeapon = new Weapon(0,0,"Shooter");
 }
 Enemy(int x, int y, int t)
 {
   type = t;
  generateType();
  ebody = new drawableObject(x,y,exSpeed,eySpeed,"rect",eWidth,eHeight);
    eWeapon = new Weapon(0,0,"Shooter");

 }
  Enemy(int x, int y, int xS, int yS, int w, int h, color c, int hp)
 {
  totalHealth = hp;
  ebody = new drawableObject(x,y,xS,yS,"rect",w,h,c);
    eWeapon = new Weapon(0,0,"Shooter");

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
      }
   
   if(type == 1)
   {
    if(!isGrounded)
       ebody.ySpeed = 3;
      else if(isGrounded)
     {
      ebody.ySpeed = 0;
     } 
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
   }
   
   
 }
 
  
}
