/*
Declare and initialize 10 Walker objects in an array (do not do it manually else 0). 
Do the initialization in void setup()
  Each walker must have mass values from 1 to 10
  Each walker must have a scale depending on its mass (mass * 15)
  Each walker must have random color
  All walkers must start at (-500, 200) position
Declare and initialize two (2) forces:
  Gravity = (0, -0.4)
  Wind = (0.15, 0)
Apply both forces to all the walkers
Apply Newton's Third Law by making it bounce from the edges of the screen
*/
Walker[] walker = new Walker[10];

PVector wind = new PVector(0.15,0);
PVector gravity = new PVector(0,-0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
  for (int i = 0; i < 10; i++)
  {
    walker[i] = new Walker();
    
    walker[i].position.x = -500;
    walker[i].position.y = 200;
    
    walker[i].mass = i + 1;
    walker[i].scale = walker[i].mass * 15;
    
    walker[i].col.x = int(random(245));
    walker[i].col.y = int(random(245));
    walker[i].col.z = int(random(245));
    
  }
 
}

void draw()
{
  background(130);
  
  for (Walker ball: walker)
  {
    ball.render();
    ball.update();
    ball.applyForce(wind);
    ball.applyForce(gravity);
  
  
    if (ball.position.y <= Window.bottom)
    {
      ball.velocity.y *= -1;
    }
    if (ball.position.y >= Window.top)
    {
      ball.velocity.y *= -1;
    }
    if (ball.position.x >= Window.right)
    {
      ball.velocity.x *= -1;
    }
    if (ball.position.x <= Window.left)
    {
      ball.velocity.x *= -1;
    }
  }
}
