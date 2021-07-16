public class Walker
{
   public PVector position = new PVector();
   public PVector velocity = new PVector();   
   public PVector acceleration = new PVector(); 
   public PVector col = new PVector();
  
   public float alpha = 255;
   public float velocityLimit = 2;
   public float scale = 15;
   
   public Walker()
   {
     
   }
   
   public void update()
   {   
     this.velocity.add(this.acceleration);
     this.velocity.limit(velocityLimit);
     this.position.add(this.velocity);
   }
   
   public void render()
   {
     float r = col.x;
     float g = col.y;
     float b = col.z;
     noStroke();
     fill(r,g,b,alpha);
     circle(position.x, position.y, scale);
   }
   
   
   
}
