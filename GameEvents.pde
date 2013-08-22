void checkHitsAndPickups(Enemies ens, Player pl)
{
 if(ens.enemies.size()>0)
    {
       for(int jj = ens.enemies.size()-1;jj>=0;jj--)
       {
             Enemy en = ens.enemies.get(jj);
             if(checkEnemyHit(en,pl))
               {
                 String[] loots = {"health","bomb"};
                 String thisLoot =  loots[(int)random(0,2)] ;
                 ens.eLoot.add(new Loot(thisLoot,en.ebody.xPos,en.ebody.yPos));
                //add scoring?
                 ens.enemies.remove(jj); 
               }
              if(checkPlayerHit(en,pl))
              {
                 pl.currentHealth = 0;
                 
              }
       }
      checkPlayerLoot(ens,pl);      
    }
}

 boolean checkEnemyHit(Enemy en, Player pl)
  {
     boolean hit = false;
    if(pl.pWeapon.ammo.size()>0 )
    { 
   for(int ii = pl.pWeapon.ammo.size()-1; ii >= 0 ; ii--)
   {
    drawableObject temp = pl.pWeapon.ammo.get(ii);
    if(checkCollision(temp,en.ebody))
     {
       pl.pWeapon.ammo.remove(ii);
         en.currentHealth -= 10;  
    playSound("sound2");     
     }
     if(en.currentHealth<=0)
       hit=true;
   }
     
    }
    return hit;
  }
  
  boolean checkPlayerHit(Enemy en, Player pl)
  {
   //check if player is hit by any enemies 
     
   boolean hit = false;
   for(int ii = en.eWeapon.ammo.size()-1; ii >= 0 ; ii--)
   {
    drawableObject temp = en.eWeapon.ammo.get(ii);
    if(checkCollision(temp,pl.body))
     {
       en.eWeapon.ammo.remove(ii);
       pl.currentHealth-=1; 
     }
     if(pl.currentHealth<=0)
       hit=true;
   }
     
   return hit;    
  }
  
  
  void checkPlayerLoot(Enemies ens, Player pl)
  {
   if(ens.eLoot.size()>0)
  {
   for(int ii = ens.eLoot.size()-1; ii>=0; ii--)
   {
     
     drawableObject temp = ens.eLoot.get(ii).loot;
     ens.eLoot.get(ii).updateLoot(pl);
    if(checkCollision(temp,pl.body))
     {
       pl.playerGetsLoot(ens.eLoot.get(ii).loot.type);
       ens.eLoot.remove(ii);
     }
     
   }
   
  }   
  }
  
