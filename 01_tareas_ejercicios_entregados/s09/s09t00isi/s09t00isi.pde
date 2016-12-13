//Expresión digital II - Diseño Digital - UDD- 2016.
//Isidora Ordoñez.
//s09t00isi.

/*
En este código creo dos tipos for loops para dos objetos distintos, cuadrados y triangulos
estos giran sobre un eje común y en el caso de los triángulos se acercan y alejan del centro.
*/

// Creo variables:
int x, x1, x2, x3, y, y1, y2, y3, tam;                                        //Creo variables tipo int.

//Inicializo variables:
void setup() {
  
  size(640, 640);                                                             // Tamaño canvas.
  noStroke();                                                                 // Figuras no tienen linea de contorno.
  rectMode(CENTER);                                                           // Dibuja cuadrados desde el centro.

  x= 10;                                                                       // Valor para 'x'.
  y= 10;                                                                       // Valor para 'y'.
  tam= 40;                                                                     // Valor para "tam".
  x1= 40;                                                                      // Valor para "x1".
  y1=40;                                                                       // Valor para "y1".
  x2=60;                                                                       // Valor para "x2". 
  y2=40;                                                                       // Valor para "y2".
  x3=120;                                                                      // Valor para "x3".
  y3=0;                                                                        // Valor para "y3".                                      
}

// Corre programa:
void draw() {
  background(0);                                                               // Color de fondo negro.
  translate(width/2, height/2);                                                // Centro al medio del canvas.


  for (int i = 0; i < 360; i+=30) {                                            // For loop cuadrados                                                                  
    pushMatrix();                                                              // Abro pushMatrix.
    
    translate(sin(radians(i+frameCount))*90, cos(radians(i+frameCount))*90);   //translate va rotando
    rotate(radians(-i));                                                       // Asigno rotación a figuras.

    fill(map(i, 0, 140, 255, 0), 0, 255);                                      // Reeleno con función map.
    rect(x, y, tam, tam);                                                      // Creo cuadrado.

    popMatrix();                                                               // Cierro pushMatrix.

    pushMatrix();                                                              // Abro pushMatrix.

    translate(sin(radians(i+frameCount))*100, cos(radians(i+frameCount))*100); // Translate va rotando.
    rotate(radians(-i));                                                       //Asigno rotación a figuras.

    fill(map(i, 0, 140, 255, 0), 255, 0);                                      // Relleno según función map.
    triangle(x1, y1, x2, y2, x3, y3);                                          // Creo triángulo.

    popMatrix();                                                               // Cierro pushMatrix.
  }
}