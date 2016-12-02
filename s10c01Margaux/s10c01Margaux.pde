//Expresión Digital - Diseño Digital - UDD - 2016
//Margaux Leroy
//s10c01margaux
// prueba
/*
El certamen debe contener 5 grillas con 3 formas y movimientos diferentes.
*/
// NIVEL 2.6: una grilla (nivel 2), tres movimientos (nivel 2), cuatro figuras (nivel 4)

// Creación de dos objetos para creer 2 grillas diferentes. Una de 625 elementos y una de 25 elementos.
Margaux[] e = new Margaux [625];  
Gomar[] f = new Gomar [25];  

// Inicialización.
void setup(){
  size(600, 600);                       // tamaño del canvas
// Inicialización de la loop del primer objeto, de las distancias y posiciones.
  for (int i = 0; i < 25; i++) {
    for (int j = 0; j < 25; j++) {
      int total = j + i * 25;
      float x = i * 30;                 // distancia entre cada elemento
      float y = j * 30;                 // distancia entre cada elemento
      e[total] = new Margaux(x, y, x + 5, y + 5, (int)random(-10, 10), (int)random(-10, 10), total * 0.05);
    }
  }
  
// Inicialización de la loop del segundo objeto, de las distancias y posiciones.
  for (int l = 0; l < 5; l++) {
    for (int k = 0; k < 5; k++) {
      int total = l + k * 5;
      float x = l * 20;                 // distancia entre cada elemento
      float y = k * 20;                 // distancia entre cada elemento
      f[total] = new Gomar(x, y, total * 0.05);
    }
  }
}

// Lanzamiento del programo
void draw(){
  background(#242541);                   // color de fondo
// Posición de la grilla del primer objeto.
  translate(width * .02, height * .02);  
  for (int i = 0; i < e.length; i++) {   
// Creación de 4 formas y 3 movimientos.
    e[i].formaUno();
    e[i].formaDos();
    e[i].formaTres();
    e[i].formaCuatro();
    e[i].movimientoUno();
    e[i].movimientoDos();
    e[i].movimientoTres();
  }
// Posición de la grilla del segundo objeto.
  translate(width * 0.3, height * 0.3);  
   for (int l = 0; l < f.length; l++) {
// Creación de 1 forma y 1 movimiento
    f[l].formaCinco();
    f[l].movimientoCuatro();
  }
}