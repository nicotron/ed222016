// Expresión Digital II - Diseño Digital - UDD - 2016
// Max Cordero
// s04c00
/*
Patrón basado en triángulos rectángulos que se unen
para formar triángulos más grandes, cuadrados y rectángulos.
Usando transparencia y 2 medidas de triángulos (una el doble de la otra),
se quiere usar la superposición de color y figuras para generar nuevas formas visuales.
En este poster se busca generar composiciónes que asemejen a vitrales de ventanas de catedrales e iglesias
*/

//Importar programam que guarda en .pdf y declarar 2 variables para tamaños de triángulo y una para color aleatorio.
import processing.pdf.*;
int vertex = 15;
int bigvertex = 30;
color random;

//Definir modo de color, tamaño composición, grosor stoke para efecto vitral y fondo blanco para simular luz.
void setup() {
  colorMode(HSB);//, 360, 100, 100, 100);
  size(900, 1125);
  smooth();
  strokeWeight(2);
  noLoop();
  background(0, 0, 100);
}
/*
Crear patrón de triángulo chicos, usando un doble for para dibujarlos en todo el canvas
y distintos if para seleccionar atributos de alineación (izquierda, derecha arriba, abajo).
También se usó un random de color que elige de manera aleatoria tonos de verde, azul y rojo.
*/
void draw() {
  for (int x = 0; x < width; x = x + vertex) {
    for (int y = 0; y < height; y = y + vertex) {
      int c = int(random(3));
      if (c == 0) {
        c = color(0, 100, random(50, 100));
      }

      if (c == 1) {
        c = color(100, 100, random(50, 100));
      }

      if (c == 2) {
        c = color(random(200, 250), 100, 100);
      }

      //esto nunca será verdadero
      if (c == 3) {
        c = color(0, 0, 100, random(0,100));
      }
      int i = int(random(4));
      if ( i == 0) {
        fill(c);
        rect(x, y, vertex, vertex);
      }
      if (i == 1) {
        fill(c);
        triangle(x, y, x + vertex, y, x, y + vertex);
      }
      if (i == 2) {
        fill(c);
        triangle(x, y, x + vertex, y + vertex, x, y + vertex);
      }
      if (i == 3) {
        fill(c);
        triangle(x + vertex, y, x + vertex, y + vertex, x, y + vertex);
      }
      //esto nunca será verdadero
      if (i == 4) {
        fill(c);
        triangle(x, y, x + vertex, y, x + vertex, y + vertex);
      }
    }
  }
  /*
  Repetir el proceso descrito anteriormente con dos diferencias.
  Dobla el tamaño de los triángluos (de vertex a bigvertex) y a su vez 
  añande transparencia a estos, la cual se elige aleatoriamente.
  */
  for (int x = 0; x < width; x = x + bigvertex) {
    for (int y = 0; y < height; y = y + bigvertex) {
      int c = int(random(3));
      if (c == 0) {
        c = color(0, 100, random(50, 100), random(50, 75));
      }

      if (c == 1) {
        c = color(100, 100, random(50, 100), random(0, 50));
      }

      if (c == 2) {
        c = color(random(200, 250), 100, 100, random(0, 25));
      }
      //esto nunca será verdadero
      if (c == 3) {
        c = color(0, 0, 100, random(0, 50));
      }
      int i = int(random(4));
      if ( i == 0) {
        fill(c);
        rect(x, y, bigvertex, bigvertex);
      }
      if (i == 1) {
        fill(c);
        triangle(x, y, x + bigvertex, y, x, y + bigvertex);
      }
      if (i == 2) {
        fill(c);
        triangle(x, y, x + 2 * bigvertex, y + 2 * bigvertex, x, y + 2 * bigvertex);
      }
      if (i == 3) {
        fill(c);
        triangle(x + bigvertex, y, x + bigvertex, y + bigvertex, x, y + bigvertex);
      }
      //esto nunca será verdadero
      if (i == 4) {
        fill(c);
        triangle(x, y, x + 2 * bigvertex, y, x + 2 * bigvertex, y + 2 * bigvertex);
      }
    }
  }
}
//Generar nueva composición
//apretando N, de new, y con S, de save, guardar la composición.
void keyPressed() {
  if (key == 'n') {
    redraw();
  } else if (key == 's') {
    saveFrame("frames/s04c00Max###.pdf");
  }
}