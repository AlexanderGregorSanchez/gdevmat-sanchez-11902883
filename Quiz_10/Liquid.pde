public class liquid
{
  public float x, y;
  public float horizon, depth;
  public float cd;
  
  public liquid(float x, float y, float horizon, float depth, float cd)
  {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    this.cd = cd; 
  }
  public void render()
  {
    noStroke();
    fill(28, 120, 186);
    beginShape();
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex(x + horizon, y + depth, 0);
    vertex(x - horizon, y + depth, 0);
    endShape();
  }
  
  public boolean isCollidingWith(Walker walker)
  {
    PVector pos = walker.position;
    return pos.x > this.x - this.horizon &&
           pos.x < this.x + this.horizon &&
           pos.y < this.y;
  }
  
  public PVector calculateDrag(Walker walker)
  {
    float speed = walker.velocity.mag();
    float dragMag = this.cd * speed * speed;
    
    PVector drag = walker.velocity.copy().mult(-1);
    
    drag.normalize();
    drag.mult(dragMag);
    return drag;
    
  }
}
  
