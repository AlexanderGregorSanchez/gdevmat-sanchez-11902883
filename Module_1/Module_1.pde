
// called at the first frame on start
void setup()
{
  size(1280,720,P3D); // set window size and P3D make environment 3D
  camera(0, 0, -(height/2.0)/tan(PI*30.0/180.0), 0, 0, 0, 0, -1, 0); // sets the camera to (0,0)
 }
// called for every frame (psuedo void main)
void draw()
{
  background(0); // set background every frame [(black)0 - 255(white)]
  
  //// Making A Circle
  //circle(0, 0, 15); // (x, y, thicc)  
  
  //// Making A Line
  //strokeWeight(2); // line thicc from next onward till next strokeWeight 
  //color white = color(255, 255, 255); // making a color variable (rgb)
  //fill(white); // color insides
  //stroke(white); // color outline
  //line(20, 20, -20, -20);// make line proper (x1, y1, x2, y2)
   
  // Cartisean Plane
  drawPlane();
  
  // Linear Function
  drawLinearFunction();
  
  // Quadratic Function
  drawQuadFunction();
  
  // Circle
  drawCircle();
  
  // Sine Wave
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
  // Small Ticks
    for(int i = -300; i <= 300; i += 10) // min, max, spacing
    {
      line(i, -2, i, 2);
      line(-2, i, 2, i);
    }
}

void drawLinearFunction()
{
  // eg: f(x) = x + 2
  color red = color(255, 0, 0); 
  fill(red); 
  noStroke();
  
  for(int x = -200; x <= 200; x++)
    {
      circle(x,x+2,5);
    }
}

void drawQuadFunction()
{
  // eg: f(x) = x^2 + 2x - 5
  color blue = color(0, 0, 255); 
  fill(blue); 
  noStroke();
  
  for(float x = -300; x <= 300; x += 0.1f) // the 0.1f is to make it a solid line instead of a dotted one and since it is a float "x" is also a float
    {
      circle(x * 10,((x * x) + (x * 2) - 5),5);// or Math.pow(x,2) to write x^2 and * 10 makes the this wider
    }
}

void drawCircle()
{
  //cos = x; sin = y
  color green = color(0, 255, 0); 
  fill(green); 
  stroke(green);
  float radius = 50;
  
  for(int x = 0; x <= 360; x++)
  {
    circle((float)Math.cos(x) * radius,(float)Math.sin(x) * radius, 5);
  }
  
}

void drawSineWave()
{
  // f(x) = sin(x)
  color yellow = color(255, 255, 0); 
  fill(yellow); 
  noStroke();
  
  
  
  for(float x = -200; x <= 200; x += 0.1f)
    {
      circle(x, (float)Math.sin(x * 0.2) * 10, 5);
    }
}
