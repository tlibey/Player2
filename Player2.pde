//needs to be commented
//toDO
/*
organize weapons and playerSprites to better load in images/types
    mainly change how each object is drawn (draw outside drawableObject? - 
    have own drawFunctions which only load relevant images)
    


*/

boolean[] keys = new boolean[526];
GameControl GC;

void setup()
{
 size(1000,600); 
 GC = new GameControl();
}

void draw()
{

 GC.gameLoop();
  //p1.body.drawObject();
}



class GameControl
{
 
 boolean inGame = false;
boolean inPlayerMenu = false;
boolean inStartMenu = true;
PFont font;
 Player p1;
 Level l1;
 
 
GameControl()
{
 p1 = new Player();
 l1 = new Level(); 
    font = createFont("Arial",16,true);

}
 
 void gameLoop()
 {
  if(inGame)
 {
    background(200,200,50);
  fill(255);
 // translate(l1.xTrans, l1.yTrans);
        l1.updateBackground();

    p1.updatePlayer();

  l1.updateLevel(p1);
  displayHUD();
        if(checkKey('P'))
     {
      inPlayerMenu = true;
      inGame = false;
      inStartMenu = false;
     }
 } 
 else if(inStartMenu)
 {
  displayStartMenu(); 
   
 }
 
 else if(inPlayerMenu)
 {
  background(255);
  if(checkKey(ENTER))
  {
    inStartMenu = false;
    inPlayerMenu = false;
    inGame = true;
  }
  textFont(font,30);
  //text("Welcome!!",width/2 - 100,50);
  fill(0);
  textAlign(CENTER);
  text("press ENTER to resume", width/2, 150);
   
 }

   
 }
 
 void displayStartMenu()
 {
   background(255);
  if(checkKey(ENTER))
  {
    inStartMenu = false;
    inGame = true;
  }
  l1.updateBackground();
  textFont(font,30);
  //text("Welcome!!",width/2 - 100,50);
  fill(0);
  textAlign(CENTER);
  text("press ENTER to start", width/2, 150);
   
   
 }
 void displayHUD()
 {
  fill(0);
  textFont(font,30);
  textAlign(CENTER);
  text("Health:  "+ p1.currentHealth,width/2,30);
   
   
 }
 
  
}


