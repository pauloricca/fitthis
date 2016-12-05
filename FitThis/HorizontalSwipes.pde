public class HorizontalSwipes extends Effect
{
  public float minWidth = 10;
  public float maxWidth = 200;
  public float vMax = -1.5;
  public float vMin = -3;
  public float slant = 150;
  public int nPolys = 10;
  public boolean coloured = true;
  public float minOpacity = 1;
  public float maxOpacity = 1;
  
  public boolean running = false;
  
  Poly[] polys;
  
  public HorizontalSwipes()
  {}
  
  public void Init()
  {
    polys = new Poly[nPolys];
    for(int i = 0; i < nPolys; i++)
    {
      polys[i] = new Poly();
    }
  }
  
  public void Pause()
  {
    running = false;
  }
  
  public void Resume()
  {
    running = true;
  }
  
  
  public void Draw()
  {
    for(Poly p : polys)
    {
      p.Draw();
    }
  }
  
  public class Poly {
    public float px, vx, w, op;
    public color c;
    
    public Poly()
    {
      Init();
    }
    
    private void Init()
    {
      w = random(minWidth, maxWidth);
      px = random(width, 2*width);
      vx = random(vMin, vMax);
      op = random(minOpacity, maxOpacity);
      c = branding.GetRandomColor();
    }
    
    public void Draw()
    {
      px += vx;
      
      if(px + w + slant < 0)
      {
        if(running) Init();
        else return;
      }
      
      
      noStroke();
      if(coloured) fill(c, op * 255);
      else fill(255, op * 255);
      beginShape();
      vertex(px, -5);
      vertex(px + w, -5);
      vertex(px + w + slant, height + 5);
      vertex(px + slant, height + 5);
      endShape(CLOSE);
    }
  }
}