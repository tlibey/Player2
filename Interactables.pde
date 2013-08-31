class Interacts
{
 ArrayList<Loot> loot = new ArrayList<Loot>();
 ArrayList<Interactable> ias = new ArrayList<Interactable>();
  
  
  Interacts()
  {
    
  }
   
 void updateInteracts(Player pl)
 {
   for(int ii = 0; ii<ias.size(); ii++)
   {
    ias.get(ii).drawInteract();
    if(ias.get(ii).checkInteraction(pl))
    {
     loot.add(new Loot(ias.get(ii).lType,ias.get(ii).obj.xPos,ias.get(ii).obj.yPos));
     ias.remove(ii);
      
    }

   }
   for(int ii = 0; ii<loot.size(); ii++)
   {
    loot.get(ii).updateLoot(pl); 

   }
 }
 
 void moveInteracts(int x, int y)
 {
   for(int ii = 0; ii<ias.size(); ii++)
   {
      ias.get(ii).moveInteract(x,y);
      
   }
   for(int ii = 0; ii<loot.size(); ii++)
   {
    loot.get(ii).loot.xPos+=x;
    loot.get(ii).loot.yPos+=y; 
   }
   
 }
  
  
  
}

class Interactable
{
 String lType;
 String iType;
 drawableObject obj;
 PImage thisImage;
 
 Interactable(int x, int y, int iT, int lT)
 {
   generateInteractable(iT,lT);
   thisImage = findSprite(iType);
   obj = new drawableObject(x,y,0,0,iType,thisImage.width,thisImage.height);
   
 }
 
 void moveInteract(int x, int y)
 {
   obj.xPos+=x;
   obj.yPos+=y;
 }
 
 void drawInteract()
 {
   image(thisImage,obj.xPos,obj.yPos);
 }
 boolean checkInteraction(Player pl)
 {
  int xRange = 50;
  int yRange = 50;
 
  if(pl.body.xPos>obj.xPos-xRange && pl.body.xPos<obj.xPos+obj.oWidth+xRange && pl.body.yPos>obj.yPos-yRange && pl.body.yPos<obj.yPos+obj.oHeight+yRange)
  {
  
   fill(34,50,100);
   //ellipse(obj.xPos,obj.yPos,50,30);
   textSize(10);
   text("Press E to open",obj.xPos+obj.oWidth/2,obj.yPos-5);
   if(checkKey('E'))
     {
       playSound("openChest");
      return true; 
     }

  
  }
   return false;
 }
 
 void generateInteractable(int iT, int lT)
 {
  if(iT == 1)
  {
    iType = "chest";
  }
  else
  {
    iType = "";
  }
  if(lT ==1)
  {
    lType = "health";
  }
  else 
  {
   lType = ""; 
  }
  
   
 }
 
 
  
  
}
