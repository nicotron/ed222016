//Expresión Digital II - Diseño Digital - UDD - 2016
//Gabriela Navarro Risopatrón
//s06e01gabi

float x, y, amt;
color c1, c2, c3;

void setup() {
  size(400, 400);
  x = 0;
  y = height / 2;

  c1 = color(97, 209, 206); //Turquesa
  c2 = color(250, 121, 129); //Rosado
}

void draw() {
  //modificar la variable amt para que 
  amt = map(x, 0, width, 0, 1); 
  //map(variable, minV, maxV, miRm, miRmax); //(variable, minimo variable, mi rango minimo, mi rango maximo);
  c3 = lerpColor(c1, c2, amt);
  background(0);
  fill(c3); //(c3)
  noStroke();
  ellipse(x, y, 15, 15);
  x++;
}