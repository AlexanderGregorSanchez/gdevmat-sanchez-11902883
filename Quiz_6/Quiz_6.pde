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
 
  // Core
  PVector mouse = mousePos();
  strokeWeight(3);
  stroke(255);
  mouse.normalize();
  mouse.mult(300);
  line(0, 0, mouse.x, mouse.y);
  println(mouse.mag());
  line(0, 0, -mouse.x, -mouse.y); 
  
  // Glow
  PVector mouse1 = mousePos();
  strokeWeight(10);
  stroke(255, 0, 0, 90);
  mouse1.normalize();
  mouse1.mult(300);
  line(0, 0, mouse1.x, mouse1.y);
  line(0, 0, -mouse1.x, -mouse1.y); 
 
  // Handle
  PVector mouse2 = mousePos();
  strokeWeight(10);
  stroke(0);
  mouse2.normalize();
  mouse2.mult(50);
  line(0, 0, mouse2.x, mouse2.y);
  line(0, 0, -mouse2.x, -mouse2.y);
 
  

}
