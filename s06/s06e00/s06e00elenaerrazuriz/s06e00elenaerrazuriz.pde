//Expresión Digital II - Diseño Digital - UDD - 2016
// M. Elena Errázuriz
//s06e00elenaerrazuriz

int x, y;
int velx = 2;
int vely = 2;
int d = 40;
color c1;

color bl, ng, tu, sg;



void setup() {

  size(400, 400);
  x = d;
  y = height / 2;

  c1 = color(255);
  bl = color(255);
  ng = color(0);
  tu = color(54, 215, 183);
  sg = color(27, 163, 156);
}

void draw() {
  ;

  background(123);
  ellipse(x, y, d, d);
  noStroke();
  fill(c1);
  x += velx;
  y += vely;

  if (x > width - d /2 || x < d/2) {
    velx *= -1;

    int r = (int)random(4);
    if ( r == 0) {
      c1 = bl;
    }
    if ( r == 1) {
      c1 = ng;
    }
    if ( r == 2) {
      c1 = tu;
    }
    if ( r == 3) {
      c1 = sg;
    }
  } 

  if ( y > height - d / 2 || y < d/2) {
    vely *= -1;

    int ra = (int)random(4);
    if ( ra == 0) {
      c1 = bl;
    }
    if ( ra == 1) {
      c1 = ng;
    }
    if ( ra == 2) {
      c1 = tu;
    }
    if ( ra == 3) {
      c1 = sg;
    }
  }
}