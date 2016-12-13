// Expresión Digital - Diseño Digital - UDD - 2016
// Francisco Barría
// s10c01

/*
Carrusel doble cruzado de líneas blancas, con variación en ángulo y forma según períodos distintos (T1 = 2,5, T2 = 7,5).
 Adicionalmente el fondo es una grilla de esferas sin fondo de color arcoíris oscilante, que pulsan cambiando su tamaño.
 Se intentó usar class para trabajar los voids, pero el código se volvió muy complejo y la conversión a class se volvió muy hostil.
 */
// NIVEL 0.6(1): Dos figuras, dos movimientos, cero grilla.
// El mayor error es que se dibujó un solo objeto que aparenta ser más objetos visualmente. 
// Se espera que este error pueda ser solucionado para el exmanen, ya que de no ser logrado, no podrá entregar una visualización de datos.

int i, j;                                 // i & j corresponden a las coordenadas para la grilla de esferas.
float a, b, e, k, x, y, x1, y1, y2;      
boolean d, h;                             // On/Off que producen las variaciones.

Objeto o;

void setup() {
  size(600, 600);
  colorMode(HSB, 100);                     // HSB para facilitar el cambio del color c1.
  o = new Objeto();                        // Indicar que o, corresponde a Objeto.
}

void draw() {

  background(0, 0, 35);
  noFill();

  o.aumen();                          // Aquí estan las variables que crean el movimiento de las figuras y grillas.
  o.grilla();                         // Grilla de esferas de colores arcoiris.
  o.lineas();                         // Grilla de las líneas blancas en constante movimiento.
  o.timer1();                         // Contiene las variables de cambio para (d).
  o.timer2();                         // Contiene las variables de cambio para (h).


  if (frameCount % 150 == 0) {              // Gatillante para cambio cada 2,5 seg (Tamaño).

    d = !d;
  }
  if (frameCount % 450 == 0) {              // Gatillante para cambio cada 7,5 seg (Cono).

    h = !h;
  }
}