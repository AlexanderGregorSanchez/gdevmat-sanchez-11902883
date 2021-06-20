void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x,y);
}

void draw()
{
  background(130);
  
  strokeWeight(5);
  stroke(255, 0, 0);
 
  PVector mouse = mousePos();

  mouse.normalize();
  mouse.mult(300);
  line(0, 0, mouse.x, mouse.y);
  println(mouse.mag()); // printing the magnitude of one side of the lightsaber
  line(0, 0, mouse.x * -1, mouse.y * -1); // other side of lightsaber
  
  
  
  // Handle
  PVector mouse2 = mousePos();
  stroke(0);
  mouse2.normalize();
  mouse2.mult(50);
  line(0, 0, mouse2.x, mouse2.y);
  line(0, 0, mouse2.x * -1, mouse2.y * -1);
 
}
