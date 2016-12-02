// Variables globales
Objeto[] o = new Objeto [100];
// Funciones de Sistema
void setup() {
  //Inicialización de
  // Variables Globales
  for (int i = 0; i < o.length; i++) {
    o[i] = new Objeto((int)random(0,width));
  }
  
}

void draw() {
  background(150);
  //uso de variables
  for (int i = o; i < o.length; i++) {
    o[i].display();
    o[i].mover();
    o[i].borde();
  }
}