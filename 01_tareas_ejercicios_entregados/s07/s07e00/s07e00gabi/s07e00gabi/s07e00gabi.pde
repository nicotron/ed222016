//Expresión Digital II - Diseño Digital - UDD - 2016
//Gabriela Navarro Risopatrón
//s07e00gabi
int x;
float y;

//Variables globales
Objeto[] o = new Objeto[100];

void setup() {
  size(800, 600);
  //inicialización de variables globales
  for (int i = 0; i < o.length; i++) {
    o[i] = new Objeto((int) random(0, width));
  }
}

void draw() {
  background(255);
  //uso de variables
  for (int i = 0; i < o.length; i++) {
    o[i].display(); 
    o[i].mover(); 
    //o[i].borde();
  }
}