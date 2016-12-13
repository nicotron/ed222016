//Expresión Digital II - Diseño Digital - Facultad de Diseño - Universidad del Desarrollo - 2016
//Gabriela Navarro Risopatrón
//s10c01gabi

/* En este código se llamarán las diferentes clases, esto se logrará mediante un boolean. Las clases serán 
 movimientos y figuras. Esto permite lograr diferentes composiciones con los movimientos descritos en el código.
 Lo que se muestra primero son los cuadrados, que estan posicionados en la grilla de tal manera que genera
 un módulo de 25 * 25 cuadrados de color tuqueza con un stroke de 1.5 y de color 120 (gris). Luego este cambia y se compone de
 de líneas, este también consta de un módulo de 25 * 25, la diferencia está en que este crea solamente la mitad
 del cuadrado, generando así que se forme y desforme el cuadrado descrito. 
 */
// NIVEL 1: Una grilla, dos movimientos, dos figuras
Gabi[] g = new Gabi[625];                                                                                //Creo "Gabi"            
float x, y, angulo; // variables que no se usan

//Inicialización
void setup() {
  size(600, 600);                                                                                        //Tamaño canvas
  for (int h = 0; h < 25; h++) {                                                                          
    for (int d = 0; d < 25; d++) {
      int total = h + d * 25;
      float hx = h * 15;
      float dy = d * 15;
      g[total] = new Gabi(hx, dy, hx + 5, dy + 5, (int) random(-2, 2), (int) random(-2, 2), total);
      println(total); //vestigio de ejercicios en clase
    }
  }
}

//Corre el programa
void draw() {
  background(255);
  translate(width * .15, height * .15);
  for (int j = 0; j < g.length; j++) {
    // g[j].dibujo(); //toda esta función no existe en el canvas
    g[j].linea(angulo); // parámetro que no se usa
    g[j].contra();
    g[j].mover();
    g[j].bordes();
  }
}