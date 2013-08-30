
class Loot
{
 drawableObject loot = new drawableObject();
 String lootType = ""; 
 PImage thisImage;
 Loot()
{
 
}

Loot(String type)
{
 lootType = type;
 generateLootImage(type); 
}

Loot(String type,int x, int y)
{
 loot.xPos =x;
 loot.yPos = y;
 generateLootImage(type);
  
}

void generateLootImage(String type)
{
  thisImage = findSprite(type);
  if(type == "health")
  {
   loot.type = "health"; 
   loot.xSpeed = 0;
   loot.ySpeed = 0;
  }
  else if(type == "bomb")
  {
   loot.type = "bomb";
   loot.fillColor = color(255,0,0);
   loot.xSpeed = -3;
  }

}

void updateLoot(Player pl)
{
 
 if(loot.type == "bomb")
 {
   if(pl.body.yPos<loot.yPos)
      loot.ySpeed = -3;
      else
      loot.ySpeed = 3;
      
   
 }
 if(loot.type == "health")
 {
  if(frameCount%1 == 0)
 {
  loot.xSpeed = - loot.xSpeed;
  println("test");
 } 
 if(frameCount%15 == 0)
 {
     loot.ySpeed = - loot.ySpeed;

 }
 }
 
 loot.moveObject(); 
 image(thisImage,loot.xPos,loot.yPos);
}
  
  
  
}


