//need to set up such that only loads sprites required for each level
// ie. if(currentLevel == "x") then load these, or even a separate script stating the images to load

String generateTerrainID(int ID)
{
 if(ID == 01)
{
 return "ground1";
} 
else if(ID == 02)
{
  
 return "ground2"; 
}

return null;
  
  
}
  
  
PImage findSprite(String im)
{
 //Weapons
 PImage img = null;
  if(im == "gun")
 {
    img =  loadImage("player/pWeapon1.png");
    
    return img;
  
 } 
 else if(im == "gun"+"a")
 {
  img = loadImage("player/pWeapon1.png");
  return img; 
 }
 
 //LOOT
 else if(im=="health")
 {
   img = loadImage("player/pWeapon1.png");
 return img;
 }
 
 else if(im =="bomb")
 {
  img = loadImage("player/pWeapon1.png");
 return img; 
 }
 
 
 //Terrain
 else if(im == "ground1")
 {    img = loadImage("terrain/grass1.png");

       return img;

 }
 else if(im == "ground2")
 {
        img = loadImage("terrain/grass2.png");
    return img;

 }
 
 
 //Interactables
 else if(im == "chest")
 {
   
  img = loadImage("Interactables/chest.png");
 return img; 
 }
 
 
 
 //Enemies
 
else if(im == "en1")
{
 img = loadImage("enemies/enemy 1.png");
  
  
}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  return img;
}
