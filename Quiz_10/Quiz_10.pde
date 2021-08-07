/*

  
  
  
  

Apply three forces to all walkers
  wind (0.1, 0)
  gravity (scaled out according to mass) (0, -0.15f * mass)
  drag force when the walkers hit the liquid
*/


liquid ocean = new liquid(0, -100, Window.right, Window.bottom, 0.1f);
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
    
    walker[i].position.x = 2 * (Window.windowHeight / 12) * (i - 4.5);
    walker[i].position.y = 300;
    
    walker[i].mass = 10 - i;
    walker[i].scale = walker[i].mass * 13;
    
    walker[i].col.x = int(random(245));
    walker[i].col.y = int(random(245));
    walker[i].col.z = int(random(186, 0));
    walker[i].alpha = 200;
    
  }
}

void mousePressed()
{
  resetEverything();
}

void draw()
{
  background(255);
  
  ocean.render();
  
  for (Walker ball: walker)
  {
    ball.render();
    ball.update();
    
    PVector wind = new PVector(0.1, 0);
    ball.applyForce(wind);
  
    PVector gravity = new PVector(0, -0.15f * ball.mass);
    ball.applyForce(gravity);
  
    float c = 0.1f;
    float normal = 1;
    float frictionMag = c * normal;
    PVector friction = ball.velocity.copy();
    ball.applyForce(friction.mult(-1).normalize().mult(frictionMag));
  
  
    ball.thirdLaw();
    
    if (ocean.isCollidingWith(ball))
    {
      println("Touching MEEEE!");
    
      PVector drag = ocean.calculateDrag(ball);
      ball.applyForce(drag);
    }
  }
  
}
