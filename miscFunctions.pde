
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

String checkCollision5(drawableObject d1, drawableObject d2)
{
  int top1,top2,bot1,bot2,left1,left2,right1,right2;
   top1 = d1.yPos; top2 = d2.yPos;
   bot1 = d1.yPos+d1.oHeight; bot2 = d2.yPos+d2.oHeight;
   left1 = d1.xPos; left2 = d2.xPos;
   right1 = d1.xPos + d1.oWidth; right2 = d2.xPos + d2.oWidth;
   float marginX = d1.oWidth/4;
   if(top1>=top2 && bot1<=bot2)
   {
   if(right2>=left1 && right2<=(left1+marginX))
   {
    return "L"; 
   }
   else if(left2<=right1 && left2 >=(right1-marginX))
   {
    return "R"; 
   }
      
     
   }
   else if(left1>=left2 && right1<=right2)
   {
    if(bot1>=top2)
         return "B";
         else if(top1<=bot2)
           return "T";
    
  
   }
   return "";
}

String checkCollision3(drawableObject d1, drawableObject d2)
{
  int top1,top2,bot1,bot2,left1,left2,right1,right2;
   top1 = d1.yPos; top2 = d2.yPos;
   bot1 = d1.yPos+d1.oHeight; bot2 = d2.yPos+d2.oHeight;
   left1 = d1.xPos; left2 = d2.xPos;
   right1 = d1.xPos + d1.oWidth; right2 = d2.xPos + d2.oWidth;
   float marginX = d1.oWidth/8;
   float marginY = d1.oHeight/2;
   String col = "";
  if((right2>=left1&& right2<=right1 )|| (left2>=left1 && left2<=right1))
  {
    if(top2>= (bot1-marginY) && top2<=bot1)
    {
     col+="bottom"; 
    }
    else if(top2<=(bot1-marginY) && top2 >=top1)
    {
     col+="T"; 
    }
    
  }
  if((top2>=top1 && top2<=bot1) || (bot2 <=bot1 && bot2>=top1))
  {
   if(right2>=left1 && right2<=(left1+marginX))
   {
    col+="L"; 
   }
   else if(left2<=right1 && left2 >=(right1-marginX))
   {
    col+="R"; 
   }
    
  }
  return col;
}

String checkCollision4(drawableObject d1, drawableObject d2)
{
  int top1,top2,bot1,bot2,left1,left2,right1,right2;
   top1 = d1.yPos; top2 = d2.yPos;
   bot1 = d1.yPos+d1.oHeight; bot2 = d2.yPos+d2.oHeight;
   left1 = d1.xPos; left2 = d2.xPos;
   right1 = d1.xPos + d1.oWidth; right2 = d2.xPos + d2.oWidth;
   float marginX = d1.oWidth/4;
   float marginY = d1.oHeight/2;
   String col = "";
  if((right2>=left1&& right2<=right1 )|| (left2>=left1 && left2<=right1) || (right2>=right1 && left2<=left1))
  {
    if(top2>= (bot1-marginY) && top2<=bot1)
    {
       if(right2>=left1 && right2<=(left1+marginX))
           {
            return "BL"; 
           }
           else if(left2<=right1 && left2 >=(right1-marginX))
           {
            return "BR"; 
           }
           else
             return "B"; 
    }
    else if(top2<=(bot1-marginY) && top2 >=top1)
    {
       if(right2>=left1 && right2<=(left1+marginX))
           {
            return "TL"; 
           }
           else if(left2<=right1 && left2 >=(right1-marginX))
           {
            return "TR"; 
           }
           else
             return "T";    
      }
    
  }
 
  return "";
}

String checkCollision2(drawableObject d1, drawableObject d2)
{
  int top1,top2,bot1,bot2,left1,left2,right1,right2;
   top1 = d1.yPos; top2 = d2.yPos;
   bot1 = d1.yPos+d1.oHeight; bot2 = d2.yPos+d2.oHeight;
   left1 = d1.xPos; left2 = d2.xPos;
   right1 = d1.xPos + d1.oWidth; right2 = d2.xPos + d2.oWidth;
   float margin = d1.oWidth/8;
   String col = "";
   if(top2<=bot1 && bot2>=bot1 && top2>=top1)
   {
    if(left2<=right1 && left2>=right1-margin)
   {
         return "BL";

   }
    else if(left2<=right1 && right2>=right1 && left2>=left1)
   {
    return "B";
   } 
     else if(left2<=left1 && right2>=left1 && right2<=right1)
     {
      return "B"; 
     }
     else if(left1>=left2 && right1<=right2)
     {
      return "B"; 
     }
     
   }
   else if(top2<=top1 && bot2>=top1 && bot2<=bot1)
   {
       if(left2<=right1 && left2>=right1-margin)
   {
         return "TL";

   }
     else if(left2<=right1 && right2>=right1 && left2>=left1)
   {
    return "T";
   } 
     else if(left2<=left1 && right2>=left1 && right2<=right1)
     {
      return "T"; 
     }
     else if(left1>=left2 && right1<=right2)
     {
      return "T"; 
     }
     

   }
   else if(top2<=top1 && bot2>=bot1)
   {
      if(left2<=right1 && right2>=right1 && left2>=right1)
   {
    return "R";
   } 
     else if(left2<=left1 && right2>=left1 && right2<=right1)
     {
      return "L"; 
     }
   }
   
    
   
    return "";
   
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
