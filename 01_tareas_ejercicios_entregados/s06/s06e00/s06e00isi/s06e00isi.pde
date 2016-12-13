//Expresión digital - Diseño Digital - UDD- 2016.
//Isidora Ordoñez.
//s06e00isi.

/*
En este código vemos como una ellipse rebota y cambia de color al tocar el fin del canvas.
 */

float v;
float v1;
int x, y, d, u, r;
color c1;
color ve, a, b, n;


void setup() {
  size(400, 400); 
  v = 2;
  v1 = 3;
  x = (int)random(width);
  d = 40;
  u = 10;
  y = height/2;
  colorMode (HSB, 360, 100, 100);
  c1= color(41, 93.7, 98.8);
  ve = color(86, 26.5, 74.1);
  a = color(41, 93.7, 98.8); 
  b = color(0, 0, 100);   
  n = color(0);
}

void draw() {


  background(255);
  fill(c1);
  ellipse(x, y, d, d);
  x += v;
  y += v1;

  if (x > width - d / 2|| x < d / 2) {
    v *= -1;
    r = (int)random(4);

    if (r==0) {
      c1 =ve;
    }
    if (r==1) {
      c1=b;
    }
    if (r==2) {
      c1=a;
    }
    if (r==3) {
      c1=n;
    }
  }
  if (y > height - d / 2|| y < d / 2) {
    v1 *= -1;
    r = (int)random(4);

    if (r==0) {
      c1 =ve;
    }
    if (r==1) {
      c1=b;
    }
    if (r==2) {
      c1=a;
    }
    if (r==3) {
      c1=n;
    }
  }
}