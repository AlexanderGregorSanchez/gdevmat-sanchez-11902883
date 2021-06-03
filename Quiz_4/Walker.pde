class walker
{
  public float x;
  public float y;
  public float tx = 0, ty = 1000, ts = 5, tr = 0, tg = 127, tb = 255;
  public float size;
  public float r;
  public float g;
  public float b;
  
  void render()
  {
    // Perlin Noise Size and Color
    size = map(noise(ts), 0, 1, 5, 150);
    r = map(noise(tr), 0, 1, 0, 255);
    g = map(noise(tg), 0, 1, 0, 255);
    b = map(noise(tb), 0, 1, 0, 255);
    
    color tint = color(r,g,b, 255);
    fill(tint);
    noStroke();
    circle(x,y, size);
    
    ts += 0.05f;
    tr += 0.1f;
    tg += 0.1f;
    tb += 0.1f;
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    tx += 0.01f;
    ty += 0.01f;
  }
}
