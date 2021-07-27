/*

Declare two(2) forces:
  acceleration 
    going to the right with values (0.2, 0)
    apply it to all walkers, it doesn't need to be removed even when the walker is stopping. Let friction handle the stoppage.
  friction
    initial coefficient(mew) is 0.01f
    when the walker goes beyond the middle of the screen, make the coefficient value 0.4f
    Apply the friction in the beginning, not when it just hits the midpoint
Reset everything when the mouse is clicked

Bonus:
For the acceleration, apply the objects' masses for computation (similar to earth's gravity). Adjust the acceleration value.
*/
Walker[] walker = new Walker[8];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
  resetEverything();
 
}

void resetEverything()
{
  for (int i = 0; i < 8; i++)
  {
    walker[i] = new Walker();
    
    walker[i].position.x = -500;
    walker[i].position.y = 2 * (Window.windowHeight / 8) * (i - 4) ;
    //Window.windowHeight
    walker[i].mass = 10 - i;
    walker[i].scale = walker[i].mass * 13;
    
    walker[i].col.x = int(random(245));
    walker[i].col.y = int(random(245));
    walker[i].col.z = int(random(245));
    
  }
}

void mousePressed()
{
  resetEverything();
}

void draw()
{
  background(255);
  
  line(0, -360, 0, 360);
  
  for (Walker ball: walker)
  {
    PVector acceleration = new PVector( 0.02 * ball.mass, 0);
    ball.render();
    ball.update();
    ball.applyForce(acceleration);
    
    if (ball.position.x >= 0)
    {
      ball.friction(0.4f);
    }
    else
    {
      ball.friction(0.01f);
    }
    ball.thirdLaw();
  }
}
