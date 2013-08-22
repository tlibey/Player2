
import ddf.minim.*;

Minim minim;
AudioSample sound1;
AudioSample sound2;
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
  
  
  mainTheme = minim.loadFile("sound/mainTheme.mp3"); //base on level
}

void playSound(String type)
{
 if(type == "sound1")
 {
   sound1.trigger();
 }
 
else if (type == "sound2")
{
  sound2.trigger();
}
  
  
}

void stopSound()
{
 sound1.close();
 sound2.close();
 mainTheme.close();
 minim.stop();
  
}
