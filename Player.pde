class Player
{
  int xPos;
  int yPos;
  int xVel;
  int yVel;
  int pWidth = 30;
  int pHeight = 30;
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
  int yStart;
  Weapon pWeapon;
  
  Player()
  {
    xPos = 0;
    yStart = height-pHeight-30;
    yPos = yStart;
    xVel = 0;
    yVel = 0;
    body = new drawableObject(xPos,yPos,xVel,yVel,"rect",pWidth,pHeight);
    pWeapon = new Weapon(xPos,yPos,"gun");
  }
  
  void updatePlayer()
  {
    movePlayer(); 
    body.drawObject();
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
}

