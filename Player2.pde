 Player p1;
Terrain t1;
boolean[] keys = new boolean[526];

void setup()
{
 size(1000,300); 
 p1 = new Player();
 t1 = new Terrain();
 objectGenerator(t1);
}

void draw()
{
  background(200,200,50);
  fill(255);
  
  p1.updatePlayer();
  t1.updateTerrain(p1);
}



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
  int jumpFrames = 70;
  int jumpSpeed = 5; //needs to be set with terrain objects in mind
  int fallSpeed = 5;
  int runSpeed = 5;

  
  Player()
  {
    xPos = 0;
    yPos = height-pHeight;
    xVel = 0;
    yVel = 0;
    body = new drawableObject(xPos,yPos,xVel,yVel,"rect",pWidth,pHeight);
  }
  
  void updatePlayer()
  {
    movePlayer(); 
    body.drawObject();  
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
  if (checkKey(' ') && !isJumping && (isGrounded || body.yPos>=height-body.oHeight))
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
  else if(!isJumping)
  {
   body.ySpeed = fallSpeed; 
  }
   
  
    }
        body.moveObject();

   if(body.yPos>height-body.oHeight)
        {
         body.yPos = height-body.oHeight;
         isGrounded = true;
         jumpCounter = 0;
         isJumping = false;
        } 
}
  
}



