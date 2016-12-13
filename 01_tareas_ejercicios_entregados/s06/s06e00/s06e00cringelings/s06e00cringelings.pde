// Expresión Digital 2 - Diseño Digital - UDD - 2016
// Catalina Ringeling Selman
// s06e00cringelings

int x, y, velx, vely, t;
color c1;

color bl, ng, c, m;

void setup() {
  size(400, 400);
  x = (int)random(width);
  y = height / 2;
  velx = 4;
  vely = 6;
  t = 50;
  c1 = color (80, 149, 100);
  
  bl = color(255);
  ng = color(#509564);
  c = color(#7C3148);
  m = color(#FF0000);
  
}

void draw() {
  t = mouseY;
  background(123);
  fill(c1);
  ellipse(x, y, t, t);
  
  x += velx;
  y += vely;
  
  if (x > width-10 || x < t / 2) {  // || es o - esto o esto - esto || esto.
    velx *= -1;
    int r = (int)random(4);
    if (r == 0) {
      c1 = bl;
    }
        if (r > 0) {
      c1 = m;
    }
        if (r < 0) {
      c1 = ng;
    }
        if (r >= 0) {
      c1 = c;
    }
  }
    
  if (y > height-10 || y < t / 2) {
    vely *= -1;
    fill(124, 49, 72);
  
}
}