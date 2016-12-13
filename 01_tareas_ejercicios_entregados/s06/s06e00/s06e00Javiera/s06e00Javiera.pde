// Expresión Digital II - Diseño Digital - UDD - 2016
// Javiera Ramírez
// s06e00

int x, y;
int vel= 2;
int vel2= 4;
int diam = 40;
int na = color(255, 106, 0);
int ce = color(4, 175, 146);
int bl = color(255, 255, 255);
int ne = color(0, 0, 0);
color c1;

void setup() {
  size(400, 400);
  x= 20;
  y= height/2;
  c1 = color(na);
}

void draw() {
  
  background(123);
  noStroke();
  fill(c1);
  ellipse(x, y, diam, diam);
  x += vel;
  y += vel2;

  if (y > height-diam/2 || y < diam/2) {
    vel2*= -1;
    int r = (int)random(4);     println(r);

    if (r == 0) {
      c1 = bl;
    }
    if (r == 1) {
      c1 = ne;
    }
    if (r == 2) {
      c1 = na;
    }
    if (r == 3) {
      c1 = ce;
    }
  }

  if (x > width-10 || x < 10) {
    vel*= -1;
     int r = (int)random(4);
     println(r);
    if (r == 0) {
      c1 = bl;
    }
    if (r == 1) {
      c1 = ne;
    }
    if (r == 2) {
      c1 = na;
    }
    if (r == 3) {
      c1 = ce;
    }
  }
}