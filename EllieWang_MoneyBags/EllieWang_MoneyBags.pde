  import processing.sound.*;
  SoundFile file;
  PImage photo;
  int NUM_PARTICLES = int(random(8,15));
  MoneyBag[] money = new MoneyBag[NUM_PARTICLES];
 
 void settings()
 {
   size(2000,1200);
 }
 
 void setup()
 {
   for(int i=0; i<money.length; i++)
   {
     money[i] = new MoneyBag();
   }
   // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "soundchaching.wav");
  
      
 }

 void draw()
 {
   background(245,245,245);
   
     for(int i=0; i<money.length; i++)
     {
       for(int n=i+1; n<money.length; n++)
       {
           money[i].collide(money[n]);
       }
         money[i].bounce();
         money[i].move();
         money[i].display();
         money[i].grow();
     }
 }
 
