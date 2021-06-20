class bounce
{
  PVector position = new PVector();
  PVector speed = new PVector(8,5);
  void render()
  {
    background(255);
    fill(182,52,100);
    circle(position.x,position.y, 50);
    
  }
  
  void ballBounce()
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
