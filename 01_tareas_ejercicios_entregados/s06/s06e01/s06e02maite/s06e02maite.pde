//Expresión Digital II - UDD - 2016.
//Maite Iturriaga Batlle.
//s06t02maite.

float x, y, amt;
int vel = 5;
int vel1 = 5;
int diam = 50;
color c1, c2, c3;

void setup() {
  size(400, 400);
  x = diam;
  y = height / 2;

  c1 = color (255, 155, 0); //Amarillo
  c2 = color (0, 255, 0); //Verde
}

void draw() {
  amt = map(x, 0, width, 0, 1);
  c3 = lerpColor(c1, c2, amt);
  background(255);                              //Para que se vuelva a dibujar fondo
  fill(c3);
  noStroke();
  ellipse(x, y, diam, diam);                    //Círculo

  x ++;
}