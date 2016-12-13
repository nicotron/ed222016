//Expresión digital II - Diseño Digital - UDD- 2016.
//Isidora Ordoñez.
//s09t01isi.

/*
En este código creo varias esferas que van girando sobre un eje común, y con el movimiento 
del mouse se puede manejar la cercania de los objetos y el eje de rotación.
*/
/*
seno(radianes(for loop)* tamaño de circulo + seno ( radianes(for i + for q)* eje de rotación.
 en el caso de y el seno se cambia por coseno.
 */

// Creo variables:
float x, y;                                                        // creo variable tipo int.
int tam;                                                           // creo variable tipo float.

// Inicialización:
void setup() {
  size(640, 640);                                                  // tamaño canvas.

  tam = 10;                                                        // asigno valor a "tam".
}

// Corre programa:
void draw() {
  background(0);                                                   // color de canvas negro.
  translate(height/2, width/2);                                    // centro al medio del canvas.

  for (int i = 0; i < 360; i+=36) {                                // for loop
    for (int q = 0; q < 140; q+=10) {                              // for loop
      x = sin(radians(i))*120+sin(radians(i+q-frameCount))*mouseX; // valor para x (formula se explica al comienzo). 
      y = cos(radians(i))*120+cos(radians(i+q-frameCount))*mouseY; // valor para y (formula se explica al comienzo).
      noStroke();                                                  // figuras sin linea de contorno.
      fill(map(q, 0, 140, 255, 0), 255, 255);                      // funcion map para relleno.
      ellipse(x, y, tam, tam);                                     // dibujo elipse.
    }
  }
}