
import ddf.minim.*;

Minim minim;
AudioSample sound1;
AudioSample sound2;
AudioSample sound3;
AudioSample sound4;
AudioPlayer mainTheme;

void initializeSound()
{
   minim = new Minim(this);

  sound1 = minim.loadSample( "sound/BD.mp3", // filename
                            512      // buffer size
                         );                    
  if ( sound1 == null ) println("Didn't get kick!");
  

  sound2 = minim.loadSample("sound/SD.wav", 512);
  if ( sound2 == null ) println("Didn't get snare!");
  
  sound3 = minim.loadSample("sound/dying.mp3",512);
  if(sound3 == null) println("no sound3");
  
  sound4 = minim.loadSample("sound/tada.wav",512);
  mainTheme = minim.loadFile("sound/onestop.mid"); //base on level
}

void playSound(String type)
{
  
  
 if(type == "playerShoot")
 {
   sound1.trigger();
 }
 
else if (type == "enemyHit")
{
  sound2.trigger();
}
else if(type == "enemyDeath")
{
  sound3.trigger();
}
else if(type == "openChest")
{
  
  sound4.trigger();
}
  
  
}

void stopSound()
{
 sound1.close();
 sound2.close();
 mainTheme.close();
 minim.stop();
  
}
