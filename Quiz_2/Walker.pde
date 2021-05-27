class Walker
{
  float x;
  float y;
  
  void render()
  {
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    int a = int(random(50, 100));
    color tint = color(r, g, b, a); 
    fill(tint); 
    stroke(tint);
    circle(x,y, 20);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    int d = 5;
    if (rng == 0) {y+=d;} // Up
    else if (rng == 1) {y-=d;} // Down
    else if (rng == 2) {x+=d;} // Right
    else if (rng == 3) {x-=d;} // Left
    else if (rng == 4) {x+=d; y+=d;} // Up Right
    else if (rng == 5) {x-=d; y+=d;} // Up Left
    else if (rng == 6) {x+=d; y-=d;} // Down Right
    else if (rng == 7) {x-=d; y-=d;} // Down Left
    
  }
  
  void randomWalkBiased()
  {
    int rng = int(random(5));
    int d = 5;
    
    // Biased To The Left (40%)
    if (rng == 0) {y+=d;} // Up
    else if (rng == 1) {y-=d;} // Down
    else if (rng == 2) {x+=d;} // Right
    else if (rng == 3 || rng == 4 ) {x-=d;} // Left
    
  }
}
