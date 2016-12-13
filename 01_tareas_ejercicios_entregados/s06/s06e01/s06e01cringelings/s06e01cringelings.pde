// Expresión Digital - Diseño Digital - UDD - 2016
// Catalina Ringeling Selman
// s06e01cringelings


float x, y, amt;
color c1, c2, c3;

void setup() {
  size (400, 400);
  x = 0;
  y = 0;
  
  c1 = color (255, 0, 0);    //Rojo
  c2 = color (0, 255, 0);    //Verde
  //c3 = lerpColor(c1, c2, amt);
}

void draw() {
  //Modificar la variable amt para que
  //amt = map(variable, minV, maxV, miRm, miRmax);
  amt = map(x, 0, width, 0, 1);
  c3 = lerpColor(c1, c2, amt);
 
  background(0);
  fill(c3);
  noStroke();
  ellipse(x, y, 15, 15);
  x++;
  y++;
}