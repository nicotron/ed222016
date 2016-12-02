//Expresión Digital II - Diseño Digital - UDD - 2016
// M. Elena Errázuriz
//s07e00elenaerrazuriz

/*
El código muestra cuatro elementos, que rebotan de los
 bordes de la composición cíclicamente. Sus colores van variando luego de cada bote según las tonallidades en degradé
 de dos colores previamente elegidos.
 */

Elena[] o = new Elena[2];
Elena[] p = new Elena[2];

void setup() {

  size(800, 600);                                               //Tamaño del canvas
  for (int i = 0; i < o.length; i++) {
    o[i] = new Elena( (int)random(0, width));
  }
  for (int j = 0; j < p.length; j++) {
    p[j] = new Elena( (int)random(0, width));
  }
}

void draw() {

  background(220);                                               //Determinar color de fondo del canvas
  for (int i = 0; i < o.length; i ++) {
    o[i].mover();
    o[i].borde();
    o[i].cuadradito();
    o[i].cuadrado();
  }
  for (int j = 0; j < p.length; j ++) {
    p[j].mover();
    p[j].borde();
    p[j].cGrande();
    p[j].espiral();
  }
}