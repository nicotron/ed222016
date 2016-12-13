//Expresión digital II - Diseño Digital - UDD - 2016
//Catalina Juez
//s06t01
float x, y, amt;
color c1, c2, c3;

void setup() {
  size(400, 400);
  x = 0 ;
  y = height / 2;

  c1 = color (132, 87, 232, 50);
  c2 = color (78, 9, 229);
}

void draw() {

  amt = map(x, 0, width, 0, 1);
  c3 = lerpColor(c1, c2, amt);
  background(0);
  fill (c3);
  noStroke();
  ellipse(x, y, 40, 40);
  x++;
}