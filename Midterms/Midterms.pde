/*
Instructions

Recreate the sample program simulating black holes. You can watch the simulation here.
Specs

Other matter

  Must spawn using gaussian within the screen

  Minimum of 100

  Random scale

  Random colors

  Must move towards the direction of the Black Hole

Everything must reset after n number of frames
*/

walker blackHole = new walker();
walker[] walkers = new walker[100];
int randSpwan = int(random(100, 200));
void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(0);
  
  // Blackhole
  blackHole.position.x = int(random(-350,350));
  blackHole.position.y = int(random(-500,500));
  blackHole.col.x = 255;
  blackHole.col.y = 255;
  blackHole.col.z = 255;
  blackHole.scale = 50;
  
  // Other objects
  for (int i = 0; i < 100; i++) 
  {
    walkers[i] = new walker();
    
    float gaussian = randomGaussian();
    float standardDiviation = 150;
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

      
  }
  
  
}

void draw()
{
  for (int i = 0; i < 100; i++) 
  {
    walkers[i].render();
    PVector direction = PVector.sub(blackHole.position, walkers[i].position);
    walkers[i].add(direction);
  }
  blackHole.render();
  
  
  
  // Flush Screen
  if (frameCount % 300 == 0){setup();} 
}
