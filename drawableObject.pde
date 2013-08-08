class drawableObject
{
 int xPos;
 int yPos;
 int xSpeed;
 int ySpeed;
 String type; 
 int oWidth;
 int oHeight;
 int fillColor; 
 
 drawableObject()
 {
  xPos = 0;
  yPos = 0;
  xSpeed = 0;
  ySpeed = 0;
  type = "rect";
  oWidth = 20;
  oHeight = 20; 
   
 }
 
 drawableObject(int x, int y, int xS, int yS, String stype)
 {
  xPos = x;
  yPos = y;
  xSpeed = xS;
  ySpeed = yS;
  type = stype; 
  oWidth = 20;
  oHeight = 20; 
 }
 
 drawableObject(int x, int y, int xS, int yS, String stype, int w, int h)
 {
  xPos = x;
  yPos = y;
  xSpeed = xS;
  ySpeed = yS;
  type = stype; 
  oWidth = w;
  oHeight = h;
 }
 
  drawableObject(int x, int y, int xS, int yS, String stype, int w, int h, int newColor)
 {
  xPos = x;
  yPos = y;
  xSpeed = xS;
  ySpeed = yS;
  type = stype; 
  oWidth = w;
  oHeight = h; 
  fillColor = newColor;
  
 }
 
/*   drawableObject(int x, int y, int xS, int yS, String stype, int w, int h, color newColor)
 {
  xPos = x;
  yPos = y;
  xSpeed = xS;
  ySpeed = yS;
  type = stype; 
  oWidth = w;
  oHeight = h; 
  fillColor = newColor;
  
 }
 */
 
 void drawObject()
 {
  if(type == "rect")
  {
    fill(0);
   rect(xPos,yPos,oWidth,oHeight); 
  }
  else{
  }
  
 }
 
 void moveObject()
 {
  xPos += xSpeed;
  yPos += ySpeed; 
 }
 
 void moveObject(int xS, int yS)
 {
  xPos +=xS;
  yPos +=yS; 
 }
 
 boolean checkInBounds()
 {
   int xtra = 10;
  if(xPos<-xtra || xPos>width+xtra || yPos<-xtra || yPos>height+xtra)
     return false;
    else 
     return true; 
 }
 
}
