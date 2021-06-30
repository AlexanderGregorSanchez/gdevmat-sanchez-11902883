class walker
{
  public PVector position = new PVector();
  public PVector speed = new PVector();
  public PVector col = new PVector();
  public float scale;
  public float alpha = 255;

  void render()
  {
    float r = col.x;
    float g = col.y;
    float b = col.z;
    noStroke();
    fill(r,g,b,alpha);
    circle(position.x,position.y, scale);
  }

}
