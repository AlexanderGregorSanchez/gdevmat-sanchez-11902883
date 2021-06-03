void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

/*
Retain the perlin walk implementation
The scale/thiccness of the Walker should change through Perlin as well. 
Make sure to implement its own "t", and map it to values 5 to 150.
The RGB values of fill must also change through Perlin. Make sure to implement their own "t". 
Map the values of RGB to 0 to 255. A value should be 255 (default).
*/

walker perlinWalker = new walker();

void draw()
{
  perlinWalker.render();
  perlinWalker.perlinWalk();
  
}
