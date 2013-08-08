class Terrain
{
  TerrainOJ rect1;
  TerrainOJ tri1;
  TerrainOJ tri2;
  
  Terrain()
  {
   rect1 = new TerrainOJ(50,height-30,30,30,"rect"); 
   tri1 = new TerrainOJ(175,height-50,140,-20,"lWedge");
   tri2 = new TerrainOJ(316,height-50,80,-20,"rWedge");
  }
  
 void updateTerrain(Player pl)
  {
   boolean isGrounded = false;
   rect1.drawTerrain();
   if(rect1.checkGrounding(pl) || tri1.checkGrounding(pl) || tri2.checkGrounding(pl))
     isGrounded = true;
   tri1.drawTerrain();
   tri2.drawTerrain();
   //tri1.checkGrounding(pl);
   
    
      pl.isGrounded = isGrounded;

  }
 
  
}

class TerrainOJ
{
  ArrayList<drawableObject> terrain = new ArrayList<drawableObject>();
  int xPos;
  int yPos;
  int rHeight;
  int rWidth;
  String type;
  
 /*TerrainOJ()
  {
   terrain.add(new drawableObject(50,height-40,0,0,"rect",50,2)); 
   terrain.add(new drawableObject(50,height-20,0,0,"rect",50,2)); 
   terrain.add(new drawableObject(130,height-20,0,0,"rect",50,2)); 
  }
  TerrainOJ(int x, int y, String t)
  {
   xPos = x;
   yPos = y;
   type = t;
   generateTerainObject(); 
  }*/
   TerrainOJ(int x, int y, int w, int h, String t)
  {
   xPos = x;
   yPos = y;
   rHeight = h;
   rWidth = w;
   type = t;
   generateTerainObject(); 
  }
  
  void generateTerainObject()
  {
   if(type == "rect")
   {
     rHeight = 20;
     rWidth = 40;
     int lineWidth = 2;
     terrain.add(new drawableObject(xPos,yPos,0,0,"rect",rWidth,lineWidth)); //topBound
     terrain.add(new drawableObject(xPos,yPos+rHeight,0,0,"rect",rWidth,lineWidth)); //bottomBound
   }
   else if(type == "lWedge")
   {
     if(rHeight>0)
     {
     float slope = rWidth/rHeight;
     int  jj =0;
     for(int ii = 0; ii<rHeight; ii++, jj+=slope)
     {
       terrain.add(new drawableObject(xPos+ jj,yPos-ii,0,0,"rect",rWidth - jj,1));
     }
     }
     else if(rHeight<0)
     {
         float slope = rWidth/abs(rHeight);
     int  jj =0;
     for(int ii = abs(rHeight); ii>0; ii--, jj+=slope)
     {
       terrain.add(new drawableObject(xPos+ jj,yPos-ii,0,0,"rect",rWidth - jj,1));
     }
     }
   }
    else if(type == "rWedge")
   {
     if(rHeight>0)
     {
     float slope = rWidth/rHeight;
     int  jj =rWidth;
     for(int ii = 0; ii<rHeight; ii++, jj-=slope)
       {
         terrain.add(new drawableObject(xPos,yPos+ii-rHeight,0,0,"rect",rWidth-jj,1));
       }
     }
     else if(rHeight<0)
     {
       float slope = rWidth/abs(rHeight);
     int  jj =rWidth;
     for(int ii = 0; ii<abs(rHeight); ii++, jj-=slope)
       {
         terrain.add(new drawableObject(xPos,yPos-ii,0,0,"rect",rWidth-jj,1));
       }
     }
    }
   
    
  }
  
  void drawTerrain()
  {
    //draw lines
    
   for(int ii = 0; ii <terrain.size(); ii++)
   {
     fill(255);
     //terrain.get(ii).moveObject(); TO implement
    terrain.get(ii).drawObject(); 
   }
   if(type == "rect")
   {
     fill(25,50,250);
     rect(xPos,yPos,rWidth,rHeight);
   }
   else if(type == "lWedge" && rHeight>0)
   {
    fill(70,200,0);
   beginShape();
   vertex(xPos,yPos);
   vertex(xPos+rWidth,yPos);
   vertex(xPos+rWidth,yPos-rHeight);
   endShape();
   }
     else if(type == "rWedge" && rHeight>0)
   {
    fill(70,200,0);
    beginShape();
    vertex(xPos,yPos);
    vertex(xPos,yPos-(rHeight));
    vertex(xPos+rWidth,yPos);
    endShape();
   }
   else if(type == "lWedge" && rHeight<0)
   {
    fill(70,200,0);
   beginShape();
   vertex(xPos,yPos+rHeight);
   vertex(xPos+rWidth,yPos+rHeight);
   vertex(xPos+rWidth,yPos);
   endShape();
   }
     else if(type == "rWedge" && rHeight<0)
   {
    fill(70,200,0);
    beginShape();
    vertex(xPos,yPos);
    vertex(xPos,yPos+(rHeight));
    vertex(xPos+rWidth,yPos+rHeight);
    endShape();
   } 
    
  }
  
  boolean checkGrounding(Player pl)
  {
    int c = 0;
    boolean tempGround = false;
    int collisionBuffer = 20; //buffer to only examine collisions with objects within range of player
    if(this.xPos<pl.body.xPos+pl.body.oWidth+20 && this.xPos+this.rWidth+10>pl.body.xPos-pl.body.oWidth)
    {
   for(int ii = 0;ii<terrain.size();ii++)
   {

     String yCol = checkCollisionY(pl.body,terrain.get(ii));
     String xCol = checkCollisionX(pl.body,terrain.get(ii));
     if(xCol!="" ||yCol!="")
// println(xCol+" "+yCol);
 if(rHeight>0)
 {
    if(yCol=="bottom")
   {
    pl.body.ySpeed = 0;
   // pl.body.yPos = terrain.get(ii).yPos+terrain.get(ii).oHeight;
    //pl.body.yPos = terrain.get(ii).yPos+4;//-pl.body.oHeight;
    //pl.isGrounded = false;
   // pl.isJumping = false;
    pl.jumpCounter = pl.jumpFrames/2;
    //pl.isJumping = false;
    //pl.jumpCounter = 0;
   } 
   else if(yCol=="top")
   {
     pl.body.ySpeed = 0;
    //pl.body.yPos ++;// terrain.get(ii).yPos-pl.body.oHeight;
    tempGround = true;
    pl.isJumping = false;
    pl.jumpCounter = 0;
   }
 }
 else if(rHeight<0)
 {
       if(yCol=="bottom")
   {
    pl.body.ySpeed = 0;
   // pl.body.yPos = terrain.get(ii).yPos+terrain.get(ii).oHeight;
    pl.body.yPos ++;//= terrain.get(ii).yPos+4;//-pl.body.oHeight;
    //pl.isGrounded = false;
   // pl.isJumping = false;
    pl.jumpCounter = pl.jumpFrames/2;
    //pl.isJumping = false;
    //pl.jumpCounter = 0;
   } 
   else if(yCol=="top")
   {
     pl.body.ySpeed = 0;
    pl.body.yPos = terrain.get(ii).yPos-pl.body.oHeight;
    tempGround = true;
    pl.isJumping = false;
    pl.jumpCounter = 0;
   }
 }
 
 
   //else if(yCol =="")
   // {
      //do nothing
   // }
   ////LEFT WEDGE/////
   if(type == "lWedge")
   {
      if(xCol == "left")
   {
    pl.body.xSpeed = 0;
   if(yCol!="bottom" && yCol!="top")
        pl.body.xPos = terrain.get(ii).xPos+terrain.get(ii).oWidth; 

   }
    else if(xCol == "right")
   {
    pl.body.xSpeed = 0;
        if(yCol!="bottom" && rHeight>0)
        {//yCol!="top" && yCol!="bottom"){
    pl.body.yPos -=1;//+terrain.get(ii+1).oHeight; 
      // terrain.get(ii).xPos;
      }
    if(yCol!="top"&& yCol!="bottom"&& rHeight>0)//-pl.body.oWidth-2;
     pl.body.xPos -=pl.runSpeed;
   }
   }
   ////RIGHT WEDGE/////
   else if(type == "rWedge")
   {
      if(xCol == "left")
           {
            pl.body.xSpeed = 0;
           if(yCol!="bottom" && rHeight>0)
               pl.body.yPos -=1; 
            if(yCol!="top" && rHeight>0)
              pl.body.xPos=terrain.get(ii).xPos+terrain.get(ii).oWidth;
           }
    else if(xCol == "right")
         {
          pl.body.xSpeed = 0;
              if((yCol!="top" && rHeight<0 )|| (yCol!="bottom" && rHeight>0))
              {
         // pl.body.yPos -=1;//+terrain.get(ii+1).oHeight; //put slope here!!
                pl.body.xPos = terrain.get(ii).xPos-pl.body.oWidth-2; 
            }
         }
   }
   else
   {
   if(xCol == "left")
   {
    pl.body.xSpeed = 0;
    if(yCol!="bottom")
    pl.body.xPos = terrain.get(ii).xPos+terrain.get(ii).oWidth+2; 
   }
    else if(xCol == "right")
   {
    pl.body.xSpeed = 0;
        if(yCol!="bottom")

    pl.body.xPos = terrain.get(ii).xPos-pl.body.oWidth-2; 
   }
   
   
   }
    }
    }
  return tempGround; //only change grounding if one was grounded
  
  }
  
}