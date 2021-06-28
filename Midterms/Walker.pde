class walker
{
  PVector position = new PVector();
  PVector speed = new PVector();
  PVector col = new PVector();
  float scale;
  
  void render()
  {
    float r = col.x;
    float g = col.y;
    float b = col.z;
    noStroke();
    fill(r,g,b);
    circle(position.x,position.y, scale);
  }
  
  void walk()
  {
    position.add(speed);
  
    if (position.x > Window.right || position.x < Window.left)
    {
      speed.x *= -1;
    }
    if (position.y > Window.top || position.y < Window.bottom)
    {
      speed.y *= -1;
    }
  }
}
