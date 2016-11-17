// Expresión Digital - Diseño Digital - UDD - 2016
// Javiera Ramírez
// s03e01

/* Una vez que corra el programa lo que se verá será un fondo
negro salpicado por una serie de elipses de fondo blanco y borde
calipso de 3px de grosor. Cada elipse varía su tamaño entre los 0 
y los 18 px de diámetro. Cada elipse tiene una separación con la
elipse colindante de 20 px.
Sobre esto se dibujan una serie de elipses de fondo blanco y borde
naranjo de 3 px. El tamaño de las elipses varía entre lo y 15 px 
de diámetro. Cada elipse tiene una separación con la elipse
colindante de 40 px de distancia. */

color n = color(255, 106, 0); // variable de color NARANJO
color c = color(4, 175, 146); // variable de color CALIPSO
color ne = color(0); // variable de color NEGRO

void setup() {
  size(750, 750); // canvas de 750x750 px
  background(ne); // fondo del canvas color negro

}

void draw() {
  frameRate(0); // El programa corre 0 veces por segundo,
                // por lo que se dibuja el código la primera
                // vez y luego el loop deja de correr
for (int x = 0; x <= width; x += 20){
  for(int y = 0; y <= height; y += 20){ // se generan figuras cada
                                        // 20 px vertical y horizontalmente
                                        // distribuídos en el canvas
    strokeWeight(3); // borde de 3 px de grosor
    stroke(c); // borde calipso
    float r = random(18); // se crea una variable random de máximo 18 px
                          // para el tamaño de las elipses
    ellipse(x, y, r, r); // se crean las elipses con tamaños random
  }
 }
 for (int x = 0; x <= width; x += 40){ 
  for(int y = 0; y <= height; y += 40){ // se generam figuras cada 40 px
                                        // vertical y horizontalmente
                                        // distribuídos en el canvas
    strokeWeight(2); // borde de 2 px de grosor
    stroke(n); // borde  de 2 px de grodor
    float r = random(15); // se crea una variable random de máximo 15 px
                          // para el tamaño de las elipses
    ellipse(x, y, r, r); // se crean las elipses con tamaños random
  }
 }
}