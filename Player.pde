class Player
{
  int xPos;
  int yPos;
  int xVel;
  int yVel;
  int pWidth = 20;
  int pHeight = 44;
  drawableObject body;
  boolean isJumping = false;
  int jumpCounter = 0;
  boolean isGrounded = true;
  boolean onWedge = false;
  int jumpFrames = 70;
  int jumpSpeed = 5; //needs to be set with terrain objects in mind
  int fallSpeed = 5;
  int runSpeed = 5;
 int yMargin = 10;
 int totalHealth = 100;
 int currentHealth = 100;
 int spriteCounter = 0;
  int yStart;
  int facing = 1;
  PImage pImage;
  Weapon pWeapon;
  
  Player()
  {
    pImage = loadImage("player/player1walk.png"); //based on level
    xPos = 0;
    yStart = height-pHeight-30;
    yPos = yStart;
    xVel = 0;
    yVel = 0;
    body = new drawableObject(xPos,yPos,xVel,yVel,"rect",pWidth,pHeight);
    pWeapon = new Weapon(xPos,yPos,"gun","guna");

  }
  
  void updatePlayer()
  {
    movePlayer(); 
    drawPlayer();
    pWeapon.updateWeapon(this); 
   if(mousePressed)
  {
   pWeapon.use();
  } 
   }
  
  
  void movePlayer()
  {
   if(checkKey('D'))
  {
   body.xSpeed = runSpeed;
  } 
  else if(checkKey('A'))
  {
   body.xSpeed = -runSpeed; 
  }
  else //if()!isJumping)
  {
   body.xSpeed = 0; 
  }
  if (checkKey(' ') && !isJumping && isGrounded)//(isGrounded || body.yPos>=yStart))
  {
   isJumping = true; 
   isGrounded = false;
   jumpCounter = 0;
  }
 
  if(!isGrounded)
  {
  if(isJumping)
  {
    if(jumpCounter>=jumpFrames)
    {
     body.ySpeed = 0; 
     isJumping = false;
     isGrounded = true;
    }
    else if(jumpCounter>=jumpFrames/2)
    {
     body.ySpeed =jumpSpeed; 
    }
    else if(jumpCounter>=0)
    {
     body.ySpeed = -jumpSpeed; 
    }
    jumpCounter++;
  }
  else if(!isJumping )
  {
   body.ySpeed = fallSpeed; 
  }
    if(onWedge)
  {
   body.ySpeed = 0; 
  }
  
    }
        body.moveObject();

   //if(body.yPos>yStart)
     //   {
      //   body.yPos = yStart;
     //    isGrounded = true;
     //    jumpCounter = 0;
     //    isJumping = false;
     //   } 
}
 
  void playerGetsLoot(String lootType)
 {
  if(lootType == "health")
 {
  currentHealth = constrain(currentHealth + 25,0,100);
  
 } 
 
 if(lootType == "bomb")
 {
  currentHealth = constrain(currentHealth - 25,0,100);
    
 }
 
 } 
   void drawPlayer()
  {
    if(body.xSpeed <0)
    {
       facing = 1;
       spriteCounter++;

    }
    else if(body.xSpeed>0)
    {
      facing = -1;
      spriteCounter++;
    }
    if(spriteCounter>=15)
      spriteCounter = 0;
      
      int index = spriteCounter/5;
      if(facing<0)
        copy(pImage,index*pWidth+pWidth,0,-pWidth,pHeight,body.xPos,body.yPos,pWidth,pHeight);
        else
          copy(pImage,index*pWidth,0,pWidth,pHeight,body.xPos,body.yPos,pWidth,pHeight);
    
  }
}

