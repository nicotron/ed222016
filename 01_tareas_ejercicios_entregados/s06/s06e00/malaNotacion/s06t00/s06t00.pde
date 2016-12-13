//Expresión Digital - Diseño Digital - UDD - 2016
//Catalina Juez
//s02t00
float vx;
float vy;
int x, y, d, u, r;
color color1;
color color2;
color  b, n, g;

void setup() {
  size (400, 400);
  vx = 2;
  vy = 3;
  x = (int)random(width);
  d = 40;
  u = 10;
  y = height / 2;
  color1 = color(132, 87, 232);
  color2 = color(78, 9, 229);
  b = 255;
  g = 60;
  n = 0;
  
}

void draw() {
  background(255);
  fill(color1);
  ellipse(x, y, d, d);
  x += vx;
  y += vy;

  if (x > width - d / 2 || x < d /2) {
    vx *=1;
    r = (int)random(4);

    if (r==0) {
      color1 = color2;
    }

    if (r==1) {
      color1 = b;
    }

    if (r==2) {
      color1 = n;
    }
    
    if (r==3) {
      color1 = g;
    }
  }
  
  
  if (y > width - d / 2 || y < d /2) {
    vy *=1;
    r = (int)random(4);

    if (r==0) {
      color1 = color2;
    }

    if (r==1) {
      color1 = b;
    }

    if (r==2) {
      color1 = n;
    }
    
    if (r==3) {
      color1 = g;
    }
  }
}