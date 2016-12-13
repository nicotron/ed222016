// Expresión Digital II - Diseño Digital - UDD - 2016
// Catalina Ringeling Selman
// s07e00cringelings

int x;
float y;

// Variables globales
Objeto[] o = new Objeto [10];
// Funciones de Sistema
void setup() {
  //Inicialización de
  // Variables Globales
  size(800, 600);
  for (int i = 0; i < o.length; i++) {
    o[i] = new Objeto((int) random(0, width));
  }
}

void draw() {
  background(150);
  //uso de variables
  for (int i = 0; i < o.length; i++) {
    o[i].display();
    o[i].mover();
    //o[i].borde();
  }
}