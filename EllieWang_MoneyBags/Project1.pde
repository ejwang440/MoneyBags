public class MoneyBag
{
  private PImage photo;
  private float xCorner;
  private float yCorner;
  private float size;
  private float dx;
  private float dy;
  float xCenter;
  float yCenter;
  
  public MoneyBag(PImage photo,float x,float y,float size,float dx,float dy)
  {
    this.photo = photo;
    xCorner = x;
    yCorner = y;
    this.size = size;
    this.dx = dx;
    this.dy = dy;
    
    xCenter = xCorner+size/2;
    yCenter = yCorner+size/2;
  
  }
    public MoneyBag()
  {
    photo = loadImage("https://p.kindpng.com/picc/s/80-801893_green-bag-big-image-money-bag-clip-art.png");
    int minDimension = min(width,height);
    size = random(20, minDimension/10);
    xCorner = random(0, width-size);
    yCorner = random(0, height-size);
    dx = random(-2,2);
    dy = random(-2,2);
    xCenter = xCorner+size/2;
    yCenter = yCorner+size/2;
  }
  
   public void display()
 {
   image(photo, xCorner, yCorner, size, size);
 }
 
 /*
  public float returnxCenter()
 {
   return xCenter;
 }
 
 public float returnyCenter()
 {
   return yCenter;
 }
 */
 
 public boolean checkoverlap(MoneyBag other)
 {
   float xCenter = xCorner + size/2;
   float yCenter = yCorner + size/2;
   float otherxCenter = other.xCorner+other.size/2;
   float otheryCenter = other.yCorner+other.size/2;
   float radius = size/2;
   float otherradius = other.size/2;
   float xdistance = abs(otherxCenter-xCenter);
   float ydistance = abs(otheryCenter-yCenter);
   float centerdistance = sqrt(sq(xdistance)+sq(ydistance));
   float distance = radius+otherradius;
   return(centerdistance<=distance);
 }
     
 
 public void collide(MoneyBag other)
 {
   if (checkoverlap(other) ==true)
   {
      dx = -dx;
        other.dx = -(other.dx);
        dy = -dy;
        other.dy = -(other.dy);
     //   file = SoundFile(this, "C:/Users/ejwan/Desktop/soundchaching.wav");
        file.stop();
        file.play();
   }
 }
 
     
 public void move()
 {
    if (dx == 0 || dy == 0)
    {
      dx = random(1,2);
      dy = random(1,2);
    }
   xCorner = xCorner + dx;
   yCorner = yCorner + dy;
 }
 
 public void bounce()
 {
    if (xCorner+size >= width || xCorner <= 0)
    {
      dx=-dx;
    }
    if (yCorner+size >= height || yCorner <= 0)
    {
      dy=-dy;
    }
 }
 
 public void grow()
 {
   float original = size;
   size = size + (original/10000);
   if (size>100)
   {
     size = original;
   }
 }
}
