//Expresión Digital II - Diseño Digital - UDD - 2016
//Ana María Ortiz
//s06e00anamaria

/*
Un círculo viajará de izquierda a derecha cambiando de color comenzando en amarillo y terminando en calipso.
 */
 
float x, y, amt;
color am, cal, c3;

void setup() {
  size(400, 400);
  x = 0;
  y = height / 2;

  am= color(251, 234, 46);
  cal= color(46, 215, 251);
}
void draw() {
  amt = map(x, 0, width, 0, 1);
  c3 = lerpColor(am, cal, amt);
  background(96);
  fill(c3);
  noStroke();
  ellipse(x, y, 15, 15);
  x++;
}