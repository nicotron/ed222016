//Expresión digital - Diseño Digital - UDD- 2016.
//Isidora Ordoñez.
//s06t01isi.

/*
En este código se ve como una ellipse cambia de color a medida que se mueve en el eje x
gracias a un lerpColor.
 */

float x, y, amt;
int d;
color c1, c2, c3;

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(400, 400);
  d = 20;
  x = 0;
  y = height / 2;

  c1= color(86, 26.5, 74.1);
  c2= color(41, 93.7, 98.8);
  float amt= 0.99;

}
void draw() {
  amt = map(x,0,width,0,1);
   c3=lerpColor(c1,c2,amt);
  background(0);
  fill(c3);
  noStroke();
  ellipse(x, y, d, d);
  x++;
}