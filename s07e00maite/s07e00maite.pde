//Expresión Digital II - UDD - 2016.
//Maite Iturriaga Batlle.
//s07e00maite.

//Variables globales
Objeto[] o = new Objeto[10];
//Funciones de sistema
void setup() {
  size(500, 500);
  //Inicialización de 
  //variables globales

  for (int i = 0; i < o.length; i++) {
    o[i] = new Objeto((int)random(0, width));
  }
}
void draw() {
  background(255);
  //uso de variables 
  for (int i = 0; i < o.length; i++) {
    o[i].lineas();
    o[i].colores();
    o[i].borde();
  }
}