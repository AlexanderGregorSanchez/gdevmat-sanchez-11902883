void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{
  // Create Circles
  renderCircle();
  
  // Flush Screen
  if (frameCount % 300 == 0){setup();} 
}

void renderCircle()
{
  // Random X value
  float gaussian = randomGaussian();
  float standardDiviation = 150;
  float mean = 0;
  float x = standardDiviation * gaussian + mean; 
  
  // Random Y value
  int y = int(random(-411, 411));
  
  // Random Color and Alpha
  int r = int(random(256));
  int g = int(random(256));
  int b = int(random(256));
  int a = int(random(10, 100));
  color tint = color(r, g, b, a); 
  fill(tint); 
  noStroke();
  
  // Random Size
  float gaussianSize = randomGaussian();
  float standardDiviationSize = 20;
  float meanSize = 10;
  float size = standardDiviationSize * gaussianSize + meanSize; 

  circle(x, y, size);
}
