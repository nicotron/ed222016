// Expresión Digital II
// Max Cordero
// s06e00max

/*
Pelota que atraviesa el canvas y cambia de color a 
medida que avanza.
*/

float x, y, amt;
color c1, c2, c3;

void setup() {
  size(500, 500);
  x = 0;
  y = height / 2;
  c1 = color(255, 160, 0); //naranjo
  c2 = color(20, 200, 20); //verde
}

void draw() {
  amt = map(x, 0, width, 0, 1);
  c3 = lerpColor(c1, c2, amt);
  background(0);
  fill(c3);
  noStroke();
  ellipse(x, y, 30, 30);
  x += 5;
}