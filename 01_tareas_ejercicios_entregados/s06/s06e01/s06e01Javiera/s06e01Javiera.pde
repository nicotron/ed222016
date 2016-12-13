// Expresión Digital II - Diseño Digital - UDD - 2016
// Javiera Ramírez
// s06e01

float x, y, amt;
color c1, c2, c3;
int diam = 30;

void setup () {
  size (400, 400);
  x = 0 ;
  y = height / 2;

  c1 = color(255, 106, 0); // naranjo
  c2 = color (4, 175, 146); // celeste
  c3 = lerpColor(c1, c2, amt);
}

void draw () {
  c3 = lerpColor(c1, c2, amt);
  amt = map(x, 0, width, 0, 1);
  background(0);
  fill(c3);
  noStroke();
  ellipse(x, y, diam, diam);
  x++;
}