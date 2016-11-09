//Expresión Digital II - Diseño Digital - Facultad de Diseño - UDD - 2016.
//Maite Iturriaga Batlle.
//s10c01

/* Este código se verán distintos movimientos y formas gracias a dos boolean, 
la primera función, "flor" está compuesta de 4 elipses que en su conjunto tienen un movimiento de random 
el que cambia los valores de x, y dentro de una pequeña grilla.
La segunda función "margarita" está compuesta de cuadrados y puntos (formando una flor),
que se mueven a través del eje y (de arriba hacia abajo) también de forma random, dentro de un espacio limitado, 
por otra parte, la función "linea" compuesta por una serie de líneas que rotan en base a uno de sus propios puntos sumando cada vez + 0.02,
todo esto en una grilla cuadrada delimitada.
*/

// NIVEL 2.3 al tener una grilla, tres movimientos y tres figuras(NIVEL 3)

Hola[] h = new Hola[100];
Hola[] k = new Hola[100];

boolean b, c;
int i;

void setup() {
  size(600, 600);
  rectMode(CENTER);
  b = true;
    /*Doble for loop para generar una grilla "flor" */
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      int total = j + i * 10;
      float x = i * 20;
      float y = j * 20;
      h[total] = new Hola(x, y, x + 5, y + 5, (int)random(-2, 2), (int)random(-2, 2), total);
    }
  }
/*Doble for loop para generar una grilla distinta usada en "margarita" y "linea" */
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      int total = j + i * 10;
      float x = i * 50;
      float y = j * 50;
      k[total] = new Hola(x, y, x + 5, y + 5, (int)random(-2, 2), (int)random(-2, 2), total);
    }
  }
}

void draw() {

  /*Se genera un boolean dentro de un estado de otro, 
   boolean, incluyendo un conteo (fameCount) */

  if (frameCount % 100 == 0) {
    b = !b;
  }
  if (b == true) {
    if (frameCount % 50 == 0) {
      c = !c;
    }
  }
  // títulos explicativos de lo que pasa en el párrafo de código
  if (c == true) {
    pushMatrix();
    background(255, 255, 0);
    translate(width * .19, height * .19);
    for (int i = 0; i < h.length; i++) {
      h[i].flor();
      h[i].mover();
      h[i].borde();
    }
    popMatrix();
  }

  // títulos explicativos de lo que pasa en el párrafo de código
  if (c == false) {
    translate(width / 5, height / 5);
    background(51);
    for (int i = 0; i < k.length; i++) {
      k[i].margarita();
      k[i].borde();
    }
  }


  // títulos explicativos de lo que pasa en el párrafo de código
  if ( b == false) {
    pushMatrix();
    translate(width / 8, height / 8);
    background(220, 20, 60);
    for (int i = 0; i < k.length; i++) {
      k[i].moverlo();
      k[i].linea();
      k[i].dibujar();
      k[i].borde();
    }
    popMatrix();
  }
}