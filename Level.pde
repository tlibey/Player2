String currentLevel = "stressTest.csv";
int scaleFactor = 30;
int yMargin = 60;
int xMargin = 200;
class Level
{
  //String currentLevel = "levelTest.csv";
  int scaleFactor = 30;
  int totalHeight;
  int totalWidth;
  int xTrans = 0;
  int yTrans = 0;
  int yStart;
  int lastShiftX =0;
  int lastShiftY = 0;
  PImage background = loadImage("mario.jpg");
  boolean[][] generatedEns;
  Terrain t1;
  Enemies e1;
  Interacts i1;

  Level()
  {
   e1 = new Enemies();
   t1 = new Terrain();
   i1 = new Interacts();
   setViewFrames(); 
   objectGenerator();
  }
  
  void setViewFrames()
{
  Table lvlOJs = loadTable(currentLevel);
  totalHeight = lvlOJs.getRowCount() * scaleFactor;
  totalWidth = lvlOJs.getColumnCount() * scaleFactor;
  t1.addBorders(totalWidth,totalHeight);
  yStart = totalHeight-height;
  //yTrans = yStart;
  generatedEns = new boolean[lvlOJs.getColumnCount()][lvlOJs.getRowCount()];
 // yTrans = totalHeight - height; 
}

void changeViewFrames(Player pl)
{
  
  if(pl.body.xPos> width-xMargin)
  {
   pl.body.xPos = width-xMargin;
   xTrans-=pl.body.xSpeed; 
   t1.moveTerrain(-pl.body.xSpeed,0);
   e1.moveEnemies(-pl.body.xSpeed,0);
   i1.moveInteracts(-pl.body.xSpeed,0);

  }
  else if(pl.body.xPos<=xMargin)
  {
   pl.body.xPos = xMargin;
   xTrans-=pl.body.xSpeed; 
   t1.moveTerrain(-pl.body.xSpeed,0);
   e1.moveEnemies(-pl.body.xSpeed,0);
   i1.moveInteracts(-pl.body.xSpeed,0);

  }
  if(pl.body.yPos<=yMargin)
  {
   pl.body.yPos = yMargin;
   if(pl.body.ySpeed<0)
   {
   yTrans-=pl.body.ySpeed;
   t1.moveTerrain(0,-pl.body.ySpeed);
    e1.moveEnemies(0,-pl.body.ySpeed);
    i1.moveInteracts(0,-pl.body.ySpeed);

   }

  }
  else if(!pl.isGrounded && pl.body.yPos>=height-yMargin)
  {
   pl.body.yPos = height-yMargin-1;
  t1.moveTerrain(0,-pl.body.ySpeed);
   e1.moveEnemies(0,-pl.body.ySpeed);
    i1.moveInteracts(0,-pl.body.ySpeed);

   yTrans -= pl.body.ySpeed; 
  }
  else if(pl.isGrounded && pl.body.yPos >=height-yMargin)
  {
   pl.body.yPos = height-yMargin;
   pl.body.ySpeed = 0;
   t1.moveTerrain(0,-pl.body.ySpeed); 
   e1.moveEnemies(0,-pl.body.ySpeed);
    i1.moveInteracts(0,-pl.body.ySpeed);

   yTrans -= pl.body.ySpeed; 

  }
}
  void updateLevel(Player pl)
{
  t1.updateTerrain(pl,e1);
  e1.updateEnemies(pl,t1);
  i1.updateInteracts(pl);
  changeViewFrames(pl);
  checkHitsAndPickups(e1,pl,i1);
  
  if(xTrans >= width + lastShiftX || xTrans<= -width+lastShiftX)
  {
    terrainCleanup();
    objectGenerator();
    lastShiftX = xTrans;

  }
 if(yTrans>=height+lastShiftY || yTrans <= -height+lastShiftY)
  {
   terrainCleanup();
   objectGenerator();
   lastShiftY = yTrans; 
  }
}
void updateBackground()
{
  //int leftBound = constrain(0-xTrans,-100,background.width-100);
  // int upBound = constrain(totalHeight-height-yTrans,30,totalHeight-height+30);
  int  leftBound = 0-xTrans;
  int upBound = totalHeight-height-yTrans;
    copy(background,leftBound,upBound,width,height,0,0,width,height);

}

void objectGenerator() //add Enemies e1
{
 Table level = loadTable(currentLevel);
int  xStart = constrain((-width-xTrans)/scaleFactor,0,level.getColumnCount());
int  xEnd = constrain((2*width-xTrans)/scaleFactor,0,level.getColumnCount());
int yStarted = constrain(level.getRowCount()-yTrans/scaleFactor-2*height/scaleFactor,0,level.getRowCount()); //may need to fix
int yEnd = constrain(yStarted+4*(height/scaleFactor),0,level.getRowCount());
  for(int ii = xStart; ii<xEnd; ii ++)
    for(int jj = yStarted; jj <yEnd;jj++)
    {
      //if(!generatedOJ[ii][jj])
    //  {
      int val = level.getInt(jj,ii);
     if(val!=0)
      {
        String v1 = ""+val;
        if(v1.charAt(0) == '6')
        {
        // String im = v1.charAt(5)+v1.charAt(6);
         int h = int(v1.charAt(3)+""+v1.charAt(4));
         int w = int(v1.charAt(1)+""+v1.charAt(2));
         int imgIndex = int(v1.charAt(5)+""+v1.charAt(6));
         String imID = generateTerrainID(imgIndex);
         t1.terrains.add(new TerrainOJ(ii*scaleFactor+xTrans,jj*scaleFactor-yStart+yTrans,w,h,"lWedge",imID));

        }
          else if(v1.charAt(0) == '7')
        {
         int h = int(v1.charAt(3)+""+v1.charAt(4));
         int w = int(v1.charAt(1)+""+v1.charAt(2));
         int imgIndex = int(v1.charAt(5)+""+v1.charAt(6));
         String imID = generateTerrainID(imgIndex);
         t1.terrains.add(new TerrainOJ(ii*scaleFactor+xTrans,jj*scaleFactor-yStart+yTrans,w,h,"rWedge",imID));

        }
        else if(v1.charAt(0) == '8')
        {
         int h = int(v1.charAt(3)+""+v1.charAt(4));
         int w = int(v1.charAt(1)+""+v1.charAt(2));
         int imgIndex = int(v1.charAt(5)+""+v1.charAt(6));
         String imID = generateTerrainID(imgIndex);
         t1.terrains.add(new TerrainOJ(ii*scaleFactor+xTrans,jj*scaleFactor+yTrans-yStart,w,h,"rect",imID));
        }
        else if(v1.charAt(0) == '5' && !generatedEns[ii][jj])
        {
         //enemy protocol
         int type = int(v1.charAt(1)+""+v1.charAt(2));
         e1.enemies.add(new Enemy(ii*scaleFactor+xTrans,jj*scaleFactor+yTrans-yStart,type));
         generatedEns[ii][jj] = true;
         
        }
        else if(v1.charAt(0) == '4' && !generatedEns[ii][jj])
        {
          int itype = int(v1.charAt(1)+""+v1.charAt(2));
          int ltype = int(v1.charAt(3)+""+v1.charAt(4));
          i1.ias.add(new Interactable(ii*scaleFactor+xTrans,jj*scaleFactor+yTrans-yStart,itype,ltype));
          generatedEns[ii][jj] = true;
          println("tesT");
        }
        
      }
      
     // }
    }
  
  
  
  
}

void terrainCleanup()
{
  for(int ii = t1.terrains.size()-1;ii>=4;ii--) //remove all but borders
 {
  
  TerrainOJ t = t1.terrains.get(ii);
  //if((t.xPos<-2*width || t.xPos>=3*width || t.yPos<-height || t.yPos>2*height) && t.type!="border")
   t1.terrains.remove(ii); 
     
   
   
 }
}
}


