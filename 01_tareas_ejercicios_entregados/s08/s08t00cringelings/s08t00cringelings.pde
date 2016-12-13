/*
s08t00

Tarea de la semana 08.

Con la primera parte del certamen presentada, la tarea consiste en aplicar los contenidos de la clase.

Los contenidos para usar un doble for loop para inicializar los Objetos y que esos tengan un lugar específico en una grilla cuadrada. Además de usar las funciones translate(); pushMatrix(); popMatrix(); rotate();

El objetivo de la tarea es que se entreguen por lo menos 3 grillas de objetos, y cada una con diferentes movimientos, para que en clase se decida por la estructura final para el certamen.

En resumen: 3 grillas con objetos

1 comportamiento de objetos por grilla

Los comportamientos deben ser distintos entre ellos
*/

// Expresión Digital 2 - Diseño Digital - UDD - 2016
// Catalina Ringeling Selman
// s08t00cringelings

Objeto[] c = new Objeto[25];

void setup() {
  size(800, 800);
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      int total = j + i * 5;
      float ix = i * 25;
      float jy = j * 25;
      c[total] = new Objeto(ix, jy, ix + 25, jy + 25, (int)random(-2, 2), (int)random(-2, 2), random(-1, 1));
      println(total);
    }
  }
}

void draw() {
  background(253);
  translate(width * .15, height * .15);
  for (int i = 0; i < c.length; i++) {
    c[i].displayLine();
    c[i].display();
    c[i].move();
    c[i].edges();
  }}