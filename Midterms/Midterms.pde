walker blackHole = new walker();
walker[] walkers = new walker[100];
int randSpwan = int(random(100, 200));
void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(0);
  
  resetEverything();
 
}

void resetEverything()
{
  // Blackhole
  blackHole.position.x = int(random(-500,500));
  blackHole.position.y = int(random(-350,350));
  blackHole.col.x = 255;
  blackHole.col.y = 255;
  blackHole.col.z = 255;
  blackHole.scale = 50;
  
  // Other objects
  for (int i = 0; i < 100; i++) 
  {
    walkers[i] = new walker();
    
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
  blackHole.position.x = mouse.x;
  blackHole.position.y = mouse.y;
  
  for (walker matter: walkers) 
  {
    matter.render();
    PVector direction = PVector.sub(blackHole.position, matter.position).normalize();
    matter.position.add(direction);
    matter.position.add(direction);
  }
  blackHole.render();
  
  // Flush Screen
  if (frameCount % 400 == 0)
  { 
    resetEverything();
  } 
}
