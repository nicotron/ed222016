// Expresión Digital - Diseño Digital - UDD - 2016
// Catalina Ringeling Selman
// s05t00cringelings

/* Canvas de size(800, 600);
Grilla de 12 de ancho y 9 de alto
Dividir en a lo menos 3 funciones void funcion() los elementos del certamen
Usar la función map() en a lo menos 3 funciones void funcion()
Mostrar cada función de manera independiente a través del uso de boolean tanto en el void draw() como en el void keyPressed
*/

/* Se dibujarán cuadrados, círculos y rectángulos en un canvas de 800x 600 con una grilla de 12 de ancho y 9 de alto
Se utilizará la función map() para modificar grosor de líneas con el movimiento del mouse y a la vez, se utilizará
y se le dará un valor a boolean, true/false, para que posteriormente, mediante la función keyPresses,
se pueda visualizar si es verdadero o falso.
Los Colores a utilizar serán, verde, burdeo, blanco y gris oscuro en el fondo.
*/

/* Se declaran las variables a utilizar, tanto como las variables de los colores como la de los números a utilizar, 
ya sean enteros o decimales. */

boolean h;
boolean h1;
boolean h2;

int col, fil;
color a;
color b;
color c;
float tam;
int ta;
float io;

void setup() {                          // Se efectua al iniciarlo una vez.
  size(800, 600);                       // Tamaño del Canvas.
  a = color(80, 149, 100);              // Variable de color verde.
  b = color(124, 49, 72);               // Variable de color burdeo.
  c = color(255);                       // Variable de color blanco.
  tam = 15;                             // Variable de tamaño para una de las figuras a dibujar. 
  ta = 8;                               // Variable de tamaño para una de las figuras a dibujar.
  io = 10;                              // Variable de tamaño para una de las figuras a dibujar.
  h = true;                             // Se señala que boolean es verdadero al ejecutar una vez el programa.
  h1 = true;
  h2 = true;
  col = 12;                             // Se dibujarán 12 columnas - 12 en ancho del canvas.
  fil = 9;                              // Se dibujarán 0 filas - 9 a lo largo del canvas.
}

void draw() {                                            // Se puede efectuar varias veces de principio a fin.
  background(35);                                         // Color de fondo - Gris Oscuro.
  for (int x = 0; x <= 11*width/col; x += width/col) {      // Variables a utilizar para x. Se define el valor de x
    for (int y = 0; y <= 8*height/fil; y += height/fil) {     // Variables a utilizar para y. Se define el valor de y.
     if (h == true) {                                     // Si la variable h es verdadera, pasará lo siguiente:
        cuad(x+(width/24), y+(height/18), 15); 
      }
    }
  }
   for (int q = 0; q <= 11*width/col; q += width/col) {
     for (int w = 0; w <= 8*height/fil; w += height/fil) { 
       if (h1 == true) {
         ell(q+(width/24), w+(height/18), 8);
       }
     }
   }
    for (int r = 0; r <= 11*width/col; r += width/col) {
     for (int u = 0; u <= 8*height/fil; u += height/fil) {
       if(h2 == true) {
         j(r+(width/24), u+(height/fil), col);
       }
     }
   }
     }

void keyPressed () {                            // Se efectua al apretar la letra 'e'
  if (key == 'i' && h == true) {                  // Si se apreta la letra 'e' y h es verdadero (true), se hará falso.
    h = false;
  } else if (key =='i' && h == false) {         // Si se apreta la leta 'e' y h es falso (false), este se hará verdadero.
    h = true;
  }
  if (key == 'o' && h1 == true) {                  // Si se apreta la letra 'e' y h es verdadero (true), se hará falso.
    h1 = false;
  } else if (key =='o' && h1 == false) {         // Si se apreta la leta 'e' y h es falso (false), este se hará verdadero.
    h1 = true;
  }
    if (key == 'p' && h2 == true) {                  // Si se apreta la letra 'e' y h es verdadero (true), se hará falso.
    h2 = false;
  } else if (key =='p' && h2 == false) {         // Si se apreta la leta 'e' y h es falso (false), este se hará verdadero.
    h2 = true;
  }
}

void cuad(int posX, int posY, float tam) {      // Se efectuará lo siguiente al iniciar el programa.
  float rec = map(mouseY, 0, height, 8, 0);     // Se utilizará según el movimiento del mouse por el eje Y y sólo por el eje Y.
  strokeWeight(rec);                            // El grosor del rectángulo varía según el float rec mencionado.
  stroke(b);                                    // Color de línea.
  fill(b);                                      // Color de relleno / el mismo que el de la línea.
  rect(posX, posY, tam, tam);                   // Tamaño y posición del cuadrado.
}

void ell(float posX, float posY, int ta) {
  float ell = map(mouseX, 0, width, 8, 0);      // Se utilizará según el movimiento del mouse en el eje X y sólo por el eje X.
  strokeWeight(ell);                            // El grosor de la ellipse varía según el float j mencionado.
  stroke(a);                                    // Color de línea.
  fill(a);                                      // Color de relleno / mismo que el de la línea.
  ellipse(posX + 31, posY + 17, ta, ta);        // Posición y tamaño de la ellipse.
  
}
void j(float posX, float posY, float io) {  
  float j = map(mouseX, 0, width, 6, 0);        // Se utilizará según el movimiento del mouse en el eje X y sólo por el eje X.
  strokeWeight(j);                              // El grosor de la ellipse varía según el float ell mencionado.
  stroke(c);                                    // Color de línea.
  fill(c);                                      // Color de relleno / mismo que el de la línea.
  rect(posX + 26, posY - 35, io, 4);            // Posición y tamaño del rectángulo.
}

//Función v(x, y, tamaño, grosor, color);
// map(mouseX, valor minimo que mide (0) en el mouseX, ancho del canvas, minimo del mouseX es 10, maximo del valor mouse x sera 0.
  /*    }else if (h == false) {
        k(x+(width/24), y+(height/18, 8));  */
/* void k(int posX, int posY, float tam) {*/