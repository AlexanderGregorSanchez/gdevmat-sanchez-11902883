public class Walker
{
   public PVector position = new PVector();
   public PVector velocity = new PVector();   
   public PVector acceleration = new PVector();  
   
   public float velocityLimit = 10;
   public float scale = 15;
   
   public float mass = 1;
   
   public PVector col = new PVector();
   public float alpha = 100;
   
   public Walker()
   {
     
   }
   
   public void applyForce(PVector force)
   {
     PVector f = PVector.div(force, mass);
     this.acceleration.add(f);
   }
   
   
   public void update()
   {
     //this.acceleration = PVector.random2D();
     this.velocity.add(this.acceleration);
     this.velocity.limit(velocityLimit);
     this.position.add(this.velocity);
     this.acceleration.mult(0);
   }
   
   public void render()
   {
     float r = col.x;
     float g = col.y;
     float b = col.z;
     fill(r,g,b,alpha);
     circle(position.x, position.y, scale);
   }
   
   public void checkEdges()
   {
     if (this.position.x > Window.right)
     {
       this.position.x = Window.left;
     }
     else if (this.position.x < Window.left)
     {
       this.position.x = Window.right;
     }
     
     if (this.position.y > Window.top)
     {
       this.position.y = Window.bottom;
     }
     else if (this.position.y < Window.bottom)
     {
       this.position.y = Window.top;
     }
   }
   
}
