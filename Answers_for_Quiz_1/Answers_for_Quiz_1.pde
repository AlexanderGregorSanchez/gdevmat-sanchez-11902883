float move = 0;
float frequency = 0.08;
float amplitude = 20;
float frequencyIncrease = 0.01f;
float amplitudeIncrease = 1.0f;
void setup()
{
  size(1280,720,P3D);
  camera(0, 0, -(height/2.0)/tan(PI*30.0/180.0), 0, 0, 0, 0, -1, 0);

 }

void draw()
{
  background(130);
  
  // Cartisean Plane
  drawPlane();
  
  // Linear Function
  drawLinearFunction();
  
  // Quadratic Function
  drawQuadraticFunction();

  // Sine Wave
  move += 0.1f;
  drawSineWave();
}

void drawPlane()
{
  strokeWeight(1); 
  color white = color(255, 255, 255); 
  fill(white); 
  stroke(white);
  
  line(300, 0, -300, 0); // x-axis
  line(0, 300, 0, -300);// y-axis
    for(int i = -300; i <= 300; i += 10) // min, max, spacing
    {
      line(i, -2, i, 2);
      line(-2, i, 2, i);
    }
}

void drawLinearFunction()
{
  // f(x) = −5x + 30 
  color purple = color(128, 0, 128); 
  fill(purple); 
  noStroke();
  
  for(float x = -50; x <= 50; x += 0.1f)
    {
      circle(x,(x * (-5)) + 30,5);
    }
}

void drawQuadraticFunction()
{
  // f(x) = x^2 − 15x − 3
  color yellow = color(255, 255, 0); 
  fill(yellow); 
  noStroke();
  
  for(float x = -50; x <= 50; x += 0.1f) 
    {
      circle(x ,((x * x) - (x * 15) + 3),5);
    }
}

void drawSineWave()
{
  // f(x) = sin(x * frequency) * amplitude
  color blue = color(0, 0, 255); 
  fill(blue); 
  noStroke();

  for(float x = -300; x <= 300; x += 0.1f)
    {
      circle(x, (float)Math.sin(x * frequency + move) * amplitude, 5);
    }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP) {amplitude += amplitudeIncrease;}
    if (keyCode == DOWN) {amplitude -= amplitudeIncrease;} 
    if (keyCode == RIGHT) {frequency += frequencyIncrease;} 
    if (keyCode == LEFT) {frequency -= frequencyIncrease;} 
  } 
}
