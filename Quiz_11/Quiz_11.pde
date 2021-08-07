/*
Create 10 walkers
random colors, mass, scale(accdg to mass)
random initial position
They must all be gravitationally attracted to each other
*/

Walker[] walker = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  resetEverything();
}

void resetEverything()
{
  for (int i = 0; i < 10; i++)
  {
    walker[i] = new Walker();
    
    walker[i].position.x = int(random(Window.left, Window.right));
    walker[i].position.y = int(random(Window.bottom, Window.top));
    
    walker[i].mass = 10 - i;
    walker[i].scale = walker[i].mass * 13;
    
    walker[i].col.x = int(random(245));
    walker[i].col.y = int(random(245));
    walker[i].col.z = int(random(245));
    
  }
}

void draw()
{
  background(255);
  for (Walker ball: walker)
  {
    ball.render();
    ball.update();
    for (Walker object: walker)
    {
      if (ball != object)
      {
        ball.applyForce(object.calcGrav(ball));
      }
    }
  }
   
  
  
  
}
