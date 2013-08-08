
boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k];  
  }
  
  return false;
}
 
void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{ 
  keys[keyCode] = false; 
}


boolean checkCollision(drawableObject d1, drawableObject d2)
{
   int top1,top2,bot1,bot2,left1,left2,right1,right2;
   top1 = d1.yPos; top2 = d2.yPos;
   bot1 = d1.yPos+d1.oHeight; bot2 = d2.yPos+d2.oHeight;
   left1 = d1.xPos; left2 = d2.xPos;
   right1 = d1.xPos + d1.oWidth; right2 = d2.xPos + d2.oWidth;
   if(top1 >= bot2)
     return false;
   if(bot1 <= top2)
     return false;
   if(left1 >= right2)
     return false;
   if(right1 <= left2)
     return false;
     
   return true;
   
}

String checkCollisionX(drawableObject d1, drawableObject d2)
{
   int top1,top2,bot1,bot2,left1,left2,right1,right2;
   top1 = d1.yPos; top2 = d2.yPos;
   bot1 = d1.yPos+d1.oHeight; bot2 = d2.yPos+d2.oHeight;
   left1 = d1.xPos; left2 = d2.xPos;
   right1 = d1.xPos + d1.oWidth; right2 = d2.xPos + d2.oWidth;
 if((top1>=top2 && top1<=bot2)|| (top1<=top2 && bot1>=bot2))
   { if(right1>=left2 && right1 <=right2)
         return "right";
     else if(left1<right2 && left1>left2)
          return "left";
   }
  //else if(bot1<=bot2 && bot1>=top2)
  // {
  //   if(right1>left2 && right1 <right2)
  //       return "right";
  //   else if(left1<right2 && left1>left2)
  //        return "left";
 //  }
   return "";
   
}
String checkCollisionY(drawableObject d1, drawableObject d2)
{
   int top1,top2,bot1,bot2,left1,left2,right1,right2;
   top1 = d1.yPos; top2 = d2.yPos;
   bot1 = d1.yPos+d1.oHeight; bot2 = d2.yPos+ d2.oHeight;
   left1 = d1.xPos; left2 = d2.xPos;
   right1 = d1.xPos + d1.oWidth; right2 = d2.xPos + d2.oWidth;
   
   if((left1>left2 &&left1<right2)||(right1>left2&&right1<right2)||(left1<=left2&&right1>=right2))
     if(top1<=bot2 && top1>=top2)
         return "bottom"; 
         else if(bot1>=top2 && bot1<=bot2)
         return "top";
   return "";
   
}

String checkCollisionXY(drawableObject d1, drawableObject d2)
{
   int top1,top2,bot1,bot2,left1,left2,right1,right2;
   top1 = d1.yPos; top2 = d2.yPos;
   bot1 = d1.yPos+d1.oHeight; bot2 = d2.yPos+d2.oHeight;
   left1 = d1.xPos; left2 = d2.xPos;
   right1 = d1.xPos + d1.oWidth; right2 = d2.xPos + d2.oWidth;
   if((left1>=left2 &&left1<=right2)||(right1>=left2&&right1<=right2))//||(left1<=left2&&right1>=right2))
     if(top1<=bot2 && top1>=top2)
         return "bottom"; 
         else if(bot1>=top2 && bot1<=bot2)
         return "top"; 
         if((top1>=top2 && top1<=bot2)||(bot1<=bot2 && bot1>=top2)|| (top1<=top2 && bot1>=bot2))
     if(right1>=left2 && right1 <=right2)
         return "right";
     else if(left1<=right2 && left1>=left2)
          return "left";
   return "";
   
}
