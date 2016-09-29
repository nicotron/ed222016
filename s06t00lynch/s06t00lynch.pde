// Expresión Digital II - Diseño Digital - UDD - 2016
// Ricardo Vidal Lynch
// s06c00lynch

/* 
 El sketch se controla con la presión de una tecla
 para cambiar entre 2 funciones. Las funciones dibujan
 unas "naves" que van desde un planeta a otro, dejando
 un rastro y cambiando de color a medida que se acercan
 a un planeta u otro.
 */

color red, blue, newC, newC2; // Variables de color.
float amt, amt2; // Variables para lerpColor.
Boolean nave = false; // Boolean para diferenciar una función de la otra.
int count = 10; // Contador para refrescar el fondo intermitentemente.
int miColor = 64; // Variable para crear mis colores.
int fondo = 20; // Color de fondo.
int velX, velY; // Velocidades para generar los rebotes.
int posX, posY; // Posición de las naves.

void setup() {
  size(800, 600);
  red = color ( miColor * 2, 0, miColor, miColor * 2); // Mi color 1.
  blue = color ( 0, miColor, miColor * 2, miColor * 2); // Mi color 2.
  velX = 6;
  velY = 3;
  posX = 250;
  posY = 130; // Declaración de las variables.
  background(20); // Fondo inicial.
  noStroke();
}


void draw() {
  if ( count == 10) { // El contador solo actúa cada 10 frames, para que el refresco de fondo genere el efecto de "rastro" que dejan las naves
    background(fondo, fondo, fondo, miColor*2); // Refresca el fondo.
    count = 0; // Resetea el contador.
    fill ( red);
    ellipse ( 100, 400, 300, 285);
    fill ( blue);
    ellipse ( 700, 400, 100, 96);
    ellipse ( 100, 100, 60, 59); // Se dibujan los planetas nuevamente;
  }


  amt = map ( posX, 250, 650, 0, 1);
  newC = lerpColor ( red, blue, amt); 

  amt2 = map ( posY, 260, 130, 0, 1);
  newC2 = lerpColor ( red, blue, amt2); // Generación de lerpColors para las naves


  if ( nave == true) {
    if ( posX > 650  || posX < 250) {
      velX = -velX; // Rebote de la nave horizontal.
    }
    posX += velX;
    nave1 ( posX, random(10)); // Crear la nave, el random permite que genere el efecto de rastro.
    posY = 130; // Reinicia la posición del planeta vertical.
  } else {
    if ( posY > 260  || posY < 130) {
      velY = -velY; // Rebote de la nave vertical.
    }
    posY += velY;
    nave2 ( random(10), posY); // Crea la segunda nave, con el mismo random.
    posX = 250; // Reinicia la posición del planeta horizontal.
  }
  count++; // Crecimiento del contador para refrescar el fondo.
}

void nave1 ( int x, float y) { // Función nave.
  fill ( newC); // Fill con el lerpColor.
  ellipse ( x, 400 + y, 10, 10);
}

void nave2 ( float x, int y) { // Función nave 2.
  fill ( newC2); // Fill con el lerpColor.
  ellipse ( x + 100, y, 10, 10);
}

void keyPressed() { // Este keyPressed cambia el estado del Boolean para mostrar una nave o la otra.
  nave = !nave;
}