void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(255);
}

bounce ball = new bounce();

void draw()
{
  // (8, 5)
  ball.ballBounce();
  ball.render();
}
