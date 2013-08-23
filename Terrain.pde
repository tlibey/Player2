


class Terrain 
{
  
    ArrayList<TerrainOJ> terrains;

  Terrain()
  {
   terrains = new ArrayList<TerrainOJ>();
  }
  
 void updateTerrain(Player pl, Enemies e1)
  {
   boolean isGroundedP = false;
   boolean[] isGroundedE = new boolean[e1.enemies.size()];
   for(int ii = 0; ii<terrains.size(); ii++)
   {
    terrains.get(ii).drawTerrain();
    if(terrains.get(ii).checkGrounding(pl))
    {
     isGroundedP = true; 
    }
    for(int jj = 0; jj<e1.enemies.size();jj++)
    {
     if(terrains.get(ii).checkGrounding(e1.enemies.get(jj))) 
     {
      isGroundedE[jj] = true; 
     }
     
    }
     
   }
    
    pl.isGrounded = isGroundedP;

    for(int jj = 0; jj<e1.enemies.size();jj++)
      {
         e1.enemies.get(jj).isGrounded  = isGroundedE[jj];         
      } 
  }
  void moveTerrain(int x, int y)
  {
    for(int ii = 0; ii<terrains.size(); ii++)
   {
    terrains.get(ii).xPos+=x;
    terrains.get(ii).yPos+=y;
    terrains.get(ii).moveTerrainObject(x,y);
   }
  }
  void addBorders(int w, int h)
  {
    terrains.add(new TerrainOJ(0,-h+height,w,h,"border"));
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
  int imgIndex = 0;
  TerrainOJImgs tims = new TerrainOJImgs();
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
    TerrainOJ(int x, int y, int w, int h, String t,int im)
  {
   xPos = x;
   yPos = y;
   rHeight = h;
   rWidth = w;
   type = t;
   imgIndex = im;
   generateTerainObject(); 
  }
  void moveTerrainObject(int x, int y)
  {
    for(int ii = 0; ii <terrain.size(); ii++)
   {
     
     terrain.get(ii).xPos +=x;
     terrain.get(ii).yPos +=y; 
     
   }
    
  }
  void generateTerainObject()
  {
   if(type == "rect")
   {
     
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
    else if(type == "border")
    {
     
      terrain.add(new drawableObject(xPos,yPos,0,0,"rect",rWidth,1));
      terrain.add(new drawableObject(xPos,yPos,0,0,"rect",1,rHeight));
      terrain.add(new drawableObject(xPos,yPos+rHeight,0,0,"rect",rWidth,1));
      terrain.add(new drawableObject(xPos+rWidth,yPos,0,0,"rect",1,rHeight));
      
    }
   
   
    
  }
  
  void drawTerrain()
  {
    //draw lines
    
   for(int ii = 0; ii <terrain.size(); ii++)
   {
     fill(255);
    // terrain.get(ii).moveObject();// TO implement
    terrain.get(ii).drawObject(); 
  }
    if(type == "rect" && imgIndex == 1)
    {
      copy(tims.im1,0,0,tims.im1.width,tims.im1.height,xPos,yPos,rWidth,rHeight);
      
    }
   else if(type == "rect")
   {
     fill(25,50,250);
     rect(xPos,yPos,rWidth,rHeight);
   }
   else if(type == "lWedge" && rHeight>0 && imgIndex == 1)
   {
     
    copy(tims.im2,0,0,tims.im2.width,tims.im2.height,xPos,yPos-rHeight,rWidth,rHeight);

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
  
  boolean checkGrounding(Enemy en)
  {
    boolean tempGround = false;
    
    //int collisionBuffer = 20; //buffer to only examine collisions with objects within range of player ///UNUSED??
  
  for(int ii = 0; ii<terrain.size(); ii++)
  {
    String col = checkCollision4(en.ebody,terrain.get(ii));
    if(type == "rect" || ((type == "lWedge" || type == "rWedge") && rHeight <0))
    {
        if(col == "B")
        {
         tempGround = true;
         en.ebody.yPos = terrain.get(ii).yPos-en.ebody.oHeight; 
        }
        else if(col == "TL" || col == "BL" || col == "TR" || col == "BR")
        {
          en.ebody.xSpeed *= -1;
        }       
    }
    else //rwedge ** lwedge
    {
           if(col == "BL" || col == "BR" || col == "B")
        {
         tempGround = true;
         en.ebody.yPos = terrain.get(ii).yPos-en.ebody.oHeight; 
        }
    }
  }
    return tempGround;
    
  }
  
  boolean checkGrounding(Player pl)
  {
    int c = 0;
    boolean tempGround = false;
    int collisionBuffer = 20; //buffer to only examine collisions with objects within range of player
    if(this.xPos<=pl.body.xPos+pl.body.oWidth+collisionBuffer && this.xPos+this.rWidth+collisionBuffer>=pl.body.xPos-pl.body.oWidth)
    {
   for(int ii = 0;ii<terrain.size();ii++)
   {

     
    String col = checkCollision4(pl.body,terrain.get(ii));
    if((type == "rWedge" && col == "BL") ||( type == "lWedge" && col =="BR"))
    {
                       pl.onWedge = true;
 
    }
    else //if(col!="")
     {
      pl.onWedge = false; 
     }
    //if(col != "")
    //  println(col);
          if(type == "rect")
          {
           if(col == "B" )//|| col == "BL")
           {
             pl.body.ySpeed = 0;
             tempGround = true;
             pl.isJumping = false;
             pl.jumpCounter = 0;
             pl.body.yPos = terrain.get(ii).yPos-pl.body.oHeight;
           }
           else if(col == "T")
           {
            pl.body.ySpeed = 0;
            pl.jumpCounter = pl.jumpFrames/2;
           }
           else if(col == "TR")
           {
             pl.body.xSpeed = 0;
            pl.body.xPos=terrain.get(ii).xPos-pl.body.oWidth-1; 
           }
           else if(col == "BR")
           {
            if(ii !=0)
           {
              pl.body.xSpeed = 0;
            pl.body.xPos=terrain.get(ii).xPos-pl.body.oWidth-1;
           } 
           }
           else if(col == "TL")
           {
            pl.body.xPos = terrain.get(ii).xPos+terrain.get(ii).oWidth; 
           }
           else if( col == "BL")
           {
            if( ii != 0)
           {
               pl.body.xPos = terrain.get(ii).xPos+terrain.get(ii).oWidth; 

           } 
           }
            
          }
          else if(((type == "lWedge" || type == "rWedge") && rHeight <0))
          {
             if(col == "B" || col == "BR" || col == "BL")//|| col == "BL")
           {
             pl.body.ySpeed = 0;
             tempGround = true;
             pl.isJumping = false;
             pl.jumpCounter = 0;
             pl.body.yPos = terrain.get(ii).yPos-pl.body.oHeight;
           }
           else if(col == "T" || col == "TR" || col == "TL")
           {
            pl.body.ySpeed = 0;
            pl.jumpCounter = pl.jumpFrames/2;
           }
         
          }
        else if (type == "lWedge")
        {
                if(col == "B")
                {
                  pl.body.yPos--;
                  tempGround = true;
                  pl.isJumping = false;
                  pl.jumpCounter = 0;
                }
                else if(col == "BR")
                {
                  if(pl.body.yPos<=yMargin+10 || pl.body.yPos>=height-yMargin)
                  {
                   pl.body.ySpeed--; 
                  }
                  else
                   pl.body.yPos--;
                  //pl.body.xPos = terrain.get(ii).xPos;//-pl.body.oWidth-1;
                  tempGround = true;
                  pl.isJumping = false;
                  pl.jumpCounter = 0;
                }
                else if(col == "BL")
                {
                 //not sure 
                }
                else if(col == "T" || col == "TR")
                {
                  pl.body.ySpeed = 0;
                pl.jumpCounter = pl.jumpFrames/2;
                 pl.body.yPos = terrain.get(ii).yPos+terrain.get(ii).oHeight+1; 
                }
                else if(col == "TL")
                {
                 pl.body.ySpeed = 0;
                 pl.jumpCounter = pl.jumpFrames/2;
                 //pl.body.yPos = terrain.get(ii).yPos+terrain.get(ii).oHeight+1;
                 pl.body.xPos = terrain.get(ii).xPos+terrain.get(ii).oWidth+1;
                 }
             
                
                 
               
          
           
         } //end lWedge
       else if (type == "rWedge")
       {
         if(col == "B")
                {
 pl.body.yPos= terrain.get(ii).yPos-pl.body.oHeight;
                  //pl.body.xPos = terrain.get(ii).xPos;//-pl.body.oWidth-1;
                  tempGround = true;
                  pl.isJumping = false;
                  pl.jumpCounter = 0;                }
                else if(col == "BL")
                {
                  //pl.body.yPos-= 2;
                  // pl.body.yPos= terrain.get(ii).yPos-pl.body.oHeight;
                  if(pl.body.yPos<=yMargin+5 || pl.body.yPos>=height-yMargin)
                      pl.body.ySpeed--;
                      else
                      pl.body.yPos = pl.body.yPos= terrain.get(ii).yPos-pl.body.oHeight;
                  //pl.body.xPos = terrain.get(ii).xPos+terrain.get(ii).oWidth-1;//-pl.body.oWidth-1;
                  tempGround = true;
                  pl.isJumping = false;
                  pl.jumpCounter = 0;
                }
                else if(col == "BR")
                {
                 //not sure 
                }
               
                else if(col == "T" || col == "TL")
                {
                  pl.body.ySpeed = 0;
                pl.jumpCounter = pl.jumpFrames/2;
                 pl.body.yPos = terrain.get(ii).yPos+terrain.get(ii).oHeight+1; 
                }
                else if(col == "TR")
                {
                 pl.body.ySpeed = 0;
                 pl.jumpCounter = pl.jumpFrames/2;
                 //pl.body.yPos = terrain.get(ii).yPos+terrain.get(ii).oHeight+1;
                 pl.body.xPos = terrain.get(ii).xPos-pl.body.oWidth;
                 }
       }// end rWedge
    else if(type == "border")
    {
      
     col = checkCollision5(pl.body,terrain.get(ii));
    
     if(col == "B" && ii == 2)//|| col == "BL")
           {
            pl.body.ySpeed = 0;
           tempGround = true;
           pl.isJumping = false;
           pl.jumpCounter = 0;
           pl.body.yPos = terrain.get(ii).yPos-pl.body.oHeight;
           }
           else if(col == "T" && ii == 0)
           {
            pl.body.ySpeed = 0;
            pl.jumpCounter = pl.jumpFrames/2;
            pl.body.yPos = terrain.get(ii).yPos+ terrain.get(ii).oHeight+15;
           }
           else if(col == "L" && ii == 1)
           {
            pl.body.xSpeed = 0;
            
            pl.body.xPos = terrain.get(ii).xPos+terrain.get(ii).oWidth+10;
           }
            else if(col == "R" && ii == 3)
           {
            pl.body.xSpeed = 0;
            pl.body.xPos = terrain.get(ii).xPos - pl.body.oWidth-10;
           }
          
            
          
         
      
    }
    }//end for loop


    } // end if statement
      return tempGround; //only change grounding if one was grounded

    } //end function
  
 
  } //end terrainOJ class
  
  
 

