Branding branding;

Effect[] effects;
Effect currentEffect = null;
Effect previousEffect = null;
PShape logo;
boolean debug = false;
boolean fullscreen = true;

int transitionAt = 15000;
int lastMillis;
int transitionTimer = 0;

void setup() 
{ 
  //fullScreen();
  size(640, 360);
  
  //noSmooth();
  
  lastMillis = millis();
  loadLogo();
  
  branding = new Branding();
  
  effects = new Effect[8];
  for(int i = 0; i < effects.length; i++) effects[i] = new HorizontalSwipes(); 
  
  ((HorizontalSwipes) effects[1]).minWidth = 100;
  ((HorizontalSwipes) effects[1]).maxWidth = 300;
  ((HorizontalSwipes) effects[1]).vMin = -0.5;
  ((HorizontalSwipes) effects[1]).vMax = -1;
  ((HorizontalSwipes) effects[1]).nPolys = 9;
  
  ((HorizontalSwipes) effects[2]).minWidth = 10;
  ((HorizontalSwipes) effects[2]).maxWidth = 20;
  ((HorizontalSwipes) effects[2]).vMin = -2;
  ((HorizontalSwipes) effects[2]).vMax = -3;
  ((HorizontalSwipes) effects[2]).nPolys = 50;
  ((HorizontalSwipes) effects[2]).coloured = false;
  
  ((HorizontalSwipes) effects[3]).minWidth = 100;
  ((HorizontalSwipes) effects[3]).maxWidth = 300;
  ((HorizontalSwipes) effects[3]).vMin = -0.5;
  ((HorizontalSwipes) effects[3]).vMax = -1;
  ((HorizontalSwipes) effects[3]).nPolys = 6;
  ((HorizontalSwipes) effects[3]).coloured = false;
  
  ((HorizontalSwipes) effects[4]).minWidth = 10;
  ((HorizontalSwipes) effects[4]).maxWidth = 20;
  ((HorizontalSwipes) effects[4]).vMin = -4;
  ((HorizontalSwipes) effects[4]).vMax = -8;
  ((HorizontalSwipes) effects[4]).nPolys = 8;
  ((HorizontalSwipes) effects[4]).coloured = false;
  
  ((HorizontalSwipes) effects[5]).minWidth = 50;
  ((HorizontalSwipes) effects[5]).maxWidth = 200;
  ((HorizontalSwipes) effects[5]).vMin = -0.5;
  ((HorizontalSwipes) effects[5]).vMax = -1;
  ((HorizontalSwipes) effects[5]).nPolys = 4;
  
  ((HorizontalSwipes) effects[6]).minOpacity = 0.5;
  ((HorizontalSwipes) effects[6]).maxOpacity = 0.8;
  
  ((HorizontalSwipes) effects[7]).minOpacity = 0.5;
  ((HorizontalSwipes) effects[7]).maxOpacity = 0.8;
  ((HorizontalSwipes) effects[7]).coloured = false;
  
  
  for(int i = 0; i < effects.length; i++) effects[i].Init(); 
}

void ChangeEffect()
{
  if(currentEffect != null) currentEffect.Pause();
  previousEffect = currentEffect;
  currentEffect = effects[floor(random(0, effects.length))];
  currentEffect.Resume();
}

void draw()
{
  transitionTimer -= millis()-lastMillis;
  lastMillis = millis();  
  if(transitionTimer <= 0) 
  {
    ChangeEffect();
    transitionTimer = transitionAt;
  }
  
  background(0);
  for(Effect e : effects)
  {
    if(e == currentEffect || e == previousEffect) e.Draw();
  }
  
  if(debug)
  {
    background(255);
    loadLogo();
  }
  shape(logo, 0, 0);  
}

void loadLogo()
{
  logo = loadShape("LogoMask.svg");
}

class Branding
{
  public color[] c = {
    color(240, 80, 47), //orange
    color(135, 103, 173), //purple
    color(54, 190, 183), //blue
    color(255, 255, 0), //yellow
  };
  public color GetRandomColor()
  {
    return c[floor(random(0, c.length))];
  }
}