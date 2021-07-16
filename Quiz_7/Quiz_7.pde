Walker[] walkers = new Walker[100];
void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(0);
  frameRate(60);
  resetEverything();
}

void resetEverything()
{
  // Make Random Objects
  for (int i = 0; i < 100; i++) 
  {
    walkers[i] = new Walker();
    
    float gaussian = randomGaussian();
    float standardDiviation = 200;
    float mean = 0;
    float gaussian2 = randomGaussian();
    float standardDiviation2 = 150;
    float mean2 = 0;
    
    walkers[i].position.x = standardDiviation * gaussian + mean; 
    walkers[i].position.y = standardDiviation2 * gaussian2 + mean2; 
    
    walkers[i].scale = int(random(5, 49));
    walkers[i].col.x = int(random(245));
    walkers[i].col.y = int(random(245));
    walkers[i].col.z = int(random(245));
    walkers[i].alpha = 100;

  }
}
PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x,y);
}

void draw()
{
  background(0);
  PVector mouse = mousePos();
  
  // Move Objects
  for (Walker matter: walkers) 
  {
    matter.update(); //<>//
    matter.render();
    PVector direction = PVector.sub(mouse, matter.position).normalize();
    direction.add(matter.velocity);
    matter.acceleration = direction;
    matter.acceleration.mult(0.2); 
  }
  
  // Flush Screen
  int sec = 15;
  sec *= 60;
  
  if (frameCount % sec == 0)
  { 
    resetEverything();
  } 
}
