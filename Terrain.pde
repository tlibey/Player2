void objectGenerator(Terrain t1) //add Enemies e1
{
  int scaleFactor = 30;
 Table level = loadTable("levelTest.csv");
  for(int ii = 0; ii<level.getRowCount(); ii ++)
    for(int jj = 0; jj <level.getColumnCount();jj++)
    {
      int val = level.getInt(ii,jj);
     if(val!=0)
      {
        String v1 = ""+val;
        if(v1.charAt(0) == '6')
        {
        // String im = v1.charAt(5)+v1.charAt(6);
         int h = int(v1.charAt(3)+""+v1.charAt(4));
         int w = int(v1.charAt(1)+""+v1.charAt(2));
         t1.terrains.add(new TerrainOJ(jj*scaleFactor,ii*scaleFactor,w,h,"lWedge"));
        }
          else if(v1.charAt(0) == '7')
        {
         int h = int(v1.charAt(3)+""+v1.charAt(4));
         int w = int(v1.charAt(1)+""+v1.charAt(2));
         t1.terrains.add(new TerrainOJ(jj*scaleFactor,ii*scaleFactor,w,h,"rWedge"));
        }
        else if(v1.charAt(0) == '8')
        {
         int h = int(v1.charAt(3)+""+v1.charAt(4));
         int w = int(v1.charAt(1)+""+v1.charAt(2));
         t1.terrains.add(new TerrainOJ(jj*scaleFactor,ii*scaleFactor,w,h,"rect"));
        }
        
      }
    }
  
   t1.terrains.add(new TerrainOJ(50,height-30,30,30,"rect")); // 8
   t1.terrains.add(new TerrainOJ(175,height-50,140,-20,"lWedge"));
   t1.terrains.add(new TerrainOJ(316,height-50,80,-20,"rWedge"));
   t1.terrains.add(new TerrainOJ(516,height-50,80,20,"rWedge"));
  
  
  
}

class Terrain
{
  
    ArrayList<TerrainOJ> terrains;

  Terrain()
  {
   terrains = new ArrayList<TerrainOJ>();
  }
  
 void updateTerrain(Player pl)
  {
   boolean isGrounded = false;
   
   for(int ii = 0; ii<terrains.size(); ii++)
   {
    terrains.get(ii).drawTerrain();
    if(terrains.get(ii).checkGrounding(pl))
    {
     isGrounded = true; 
    }
     
   }
    
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
    if(this.xPos<=pl.body.xPos+pl.body.oWidth+20 && this.xPos+this.rWidth+10>=pl.body.xPos-pl.body.oWidth)
    {
   for(int ii = 0;ii<terrain.size();ii++)
   {

     String yCol = checkCollisionY(pl.body,terrain.get(ii));
     String xCol = checkCollisionX(pl.body,terrain.get(ii));
    String col = checkCollision4(pl.body,terrain.get(ii));
      if(col != "")
      {
       println(col);
      }

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
           else if(col == "TR" || col == "BR")
           {
             println("test");
             pl.body.xSpeed = 0;
            pl.body.xPos=terrain.get(ii).xPos-pl.body.oWidth-1; 
           }
           else if(col == "TL" || col == "BL")
           {
            pl.body.xPos = terrain.get(ii).xPos+terrain.get(ii).oWidth; 
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
                  //pl.body.yPos--;
                   pl.body.yPos= terrain.get(ii).yPos-pl.body.oHeight;

                  //pl.body.xPos = terrain.get(ii).xPos;//-pl.body.oWidth-1;
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
   
    }//end for loop


    } // end if statement
      return tempGround; //only change grounding if one was grounded

    } //end function
  
  } //end terrainOJ class
  
  

