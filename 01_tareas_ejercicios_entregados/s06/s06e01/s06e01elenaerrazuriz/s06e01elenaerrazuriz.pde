//Expresión Digital II - Diseño Digital - UDD - 2016
// M. Elena Errázuriz
//s06e01elenaerrazuriz

float x, y, amt;
color c1, c2, c3;

void setup() {
  size(400, 400);
  x = 0;
  y = 0;

  c1 = color(54, 215, 183); //turquesa
  c2 = color(27, 163, 156); //sea green
}

void draw() {
  amt = map(x, 0, width, 0, 1); 
  c3 = lerpColor(c1, c2, amt);
  background(0);
  fill(c3);
  noStroke();
  ellipse(x, y, 30, 30);
  x++;
  y++;
}