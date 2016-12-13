// Expresión Digital II - Diseño Digital - UDD - 2016
// Javiera Ramírez
// s04c00

/* Una vez que corra el programa lo que se verá será una serie de figuras 
 (elipses, cuadrados y líneas) que forman un patrón que consta de un fondo 
 blanco, sobre eso hay círculos grises repartios equitativamente a lo largo 
 y ancho del canvas. Sobre los círculos grises se encuentran líneas blancas
 que en conjunto crean cruces con un vacío al medio. En estos vacíos ha círculos
 rosados y celestes, que comparten su centro con círculos más pequeños y de 
 colores más oscuros. Además, sobre cada línea y en el centro de cada 
 círculo hay cuadrados negros a los cuales se les aplicó canal alpha para
 darles transparencia, y un random en tamaño que hace variar sus radios entre 
 1 y 15 pixeles*/
 
import processing.pdf.*; 

void setup() {
  colorMode(HSB, 360, 100, 100); // Cambia el modo de color del documento de
                                 // de rgb a hsb
  int blanco = color(337, 0, 99); // Variable de color HSB color blanco
  //size(1200, 600); [libreta]
  size(900, 1500); // [póster] // Se determina el tamaño del canvas de 900 px de 
  // el canvas no es de relación 4 x 5
                               // ancho y 1500 px a alto
  background(blanco); // Se determina que el color del fondo es blanco
}

void draw () {
beginRecord(PDF, "s04c00Javiera_###.pdf");
  noLoop();
  //CÍRCULOS GRISES
  for (int i = 25; i < height; i += 100) {
    for (int h = 25; h < width; h += 100) { // Se declara la posición de las
                                            // figuras con una separación de 100
                                            // px cada a lo largo y ancho
      int gris = color(337, 0, 85); // Variable de color gris
      //error de sintaxis
      noStroke(); // Se declara que la figura no tiene borde
      fill(gris); // Se declara que el color de fondo de la figura es gris
      ellipse(i, h, 100, 100); // Se crean los círculos de 100 px de diámetro
      // se usan for loop para width y height, pero las variables están cambiadas 
    }
  }
  //LÍNEAS
  for (int i = 0; i < height; i += 100) {
    for (int h = 0; h < width; h += 100) {
      int blanco = color(337, 0, 99); // Variable de color blanco
      //error de sintaxis
      strokeWeight(3); // Ancho de borde de la línea de 3 px
      stroke(blanco); // Color del borde de la línea blanco
      strokeCap(ROUND); // Terminaciones de las líneas son redondas
      line(i-7, h-7, i+7, h+7);
      // se usan for loop para width y height, pero las variables están cambiadas 
    }
  }

  for (int i = 50; i < height; i += 100) {
    for (int h = 0; h < width; h += 100) {
      int blanco = color(337, 0, 99); // Variable de color blanco
      //error de sintaxis
      strokeWeight(3); // Ancho de borde de la línea de 3 px
      stroke(blanco); // Color del borde de la línea blanco
      strokeCap(ROUND); // Terminaciones de las líneas son redondas
      line(i+7, h-7, i-7, h+7);
      // se usan for loop para width y height, pero las variables están cambiadas 
    }
  }

  for (int i = 0; i < height; i += 100) {
    for (int h = 50; h < width; h += 100) {
      int blanco = color(337, 0, 99); // Variable de color blanco
      //error de sintaxis
      strokeWeight(3); // Ancho de borde de la línea de 3 px
      stroke(blanco); // Color del borde de la línea blanco
      strokeCap(ROUND); // Terminaciones de las líneas son redondas
      line(i+7, h-7, i-7, h+7);
      // se usan for loop para width y height, pero las variables están cambiadas 
    }
  }

  for (int i = 50; i < height; i += 100) {
    for (int h = 50; h < width; h += 100) {
      int blanco = color(337, 0, 99); // Variable de color blanco
      //error de sintaxis
      strokeWeight(3); // Ancho de borde de la línea de 3 px
      stroke(blanco); // Color del borde de la línea blanco
      strokeCap(ROUND); // Terminaciones de las líneas son redondas
      line(i-7, h-7, i+7, h+7);
      // se usan for loop para width y height, pero las variables están cambiadas 
    }
  }
  //CÍRCULOS
  for (int i = 75; i < height; i += 100) {
    for (int h = 75; h < width; h += 100) {
      int celeste = color(199, 85, 57); // Variable de color celeste
      //error de sintaxis
      noStroke(); // Se declara que la figura no tiene borde
      fill(celeste, 200); // Se declara que el color de las elipses es celeste
                          // con un canal alpha de 200
      ellipse(i, h, 50, 50); // Se crean los círculos equidistantes entre sí
      // se usan for loop para width y height, pero las variables están cambiadas 
                             // de 50 px de diámetro
      int azul = color(248, 81, 34); // Variable de color azul
      //error de sintaxis
      noStroke(); // se declara que la figura no tiene borde
      fill(azul); // se declara que el color de las elipses es azul
      ellipse(i, h, 30, 30); // Se crean los círculos equidistantes entre sí
      // se usan for loop para width y height, pero las variables están cambiadas 
                             // de 30 px de diámetro sobre los círculos celestes
    }
  }

  for (int i = 25; i < height; i += 100) {
    for (int h = 25; h < width; h += 100) {
      int rclaro = color(337, 91, 81); // Variable de color rosado claro
      //error de sintaxis
      noStroke(); // Se declara que la figura no tiene borde
      fill(rclaro, 200); // Se declara que la figura es de color rosado claro
      ellipse(i, h, 35, 35); // Se crean los círculos equidistantes entre sí
      // se usan for loop para width y height, pero las variables están cambiadas 
                             // de 35 px de diámetro
      int rosado = color(331, 79, 57); // Variable de color rosado
      //error de sintaxis
      noStroke(); // Se declara que la figura no tiene borde
      fill(rosado); // Se declara que el color de la figura es rosado
      ellipse(i, h, 20, 20); // Se crean los círculos equidistantes entre sí
      // se usan for loop para width y height, pero las variables están cambiadas 
                             // de 20 px de diámetro sobre los círculos 
                             // rosado claro
    }
  }

  //CUADRADOS
  for (int i = 0; i < height; i += 50) {
    for (int h = 0; h < width; h += 50) { // Se distribuyen los puntos centrales
                                          // de los cuadrados que van sobre las
                                          // líneas blancas
      int negro = color(338, 1, 1); // Variable de color negro
      //error de sintaxis
      float r = random(15); // Se crea un random de máximo 15
      noStroke(); // se declara que la figura no tiene borde
      fill(negro, 100); // Se declara que la figura es de color negro
      rectMode(CENTER); // Se declara que la figura crece desde el centro
                        // en vez de el vértice
      rect(i, h, r, r); // Se crean los cuadrados sobre cada línea
      // se usan for loop para width y height, pero las variables están cambiadas 
                        // con un random de tamaño que los hace variar entre
                        // 1 y 15 px
    }
  }

  for (int i = 25; i < height; i += 100) {
    for (int h = 25; h < width; h += 100) { // Se distribuyen los puntos centrales
                                            // de los cuadrados que van sobre
                                            // los círculos rosados
      int negro = color(338, 1, 1); // Variable de color negro
      //error de sintaxis
      float r = random(15); // Se crea un random de máximo 15
      noStroke(); // se declara que la figura no tiene borde
      fill(negro, 100); // Se declara que la figura es de color negro
      rectMode(CENTER); // Se declara que la figura crece desde el centro
                        // en vez de el vértice 
      rect(i, h, r, r); // Se crean los cuadrados sobre cada círculo rosado
      // se usan for loop para width y height, pero las variables están cambiadas 
                        // con un random de tamaño que los hace variar entre
                        // 1 y 15 px
    }
  }

  for (int i = 75; i < height; i += 100) {
    for (int h = 75; h < width; h += 100) { // Se distribuyen los puntos centrales
                                            // de los cuadrados que van sobre
                                            // los círculos azules
      int negro = color(338, 1, 1); // Variable de color negro
      //error de sintaxis
      float r = random(15); // Se crea un random de máximo 15
      noStroke(); // Se declara que las figuras no tienen borde
      fill(negro, 100); // Se declara que la figura es de color negro
      rectMode(CENTER); // Se declara que la figura crece desde el centro
                        // en vez de el vértice 
      rect(i, h, r, r); // Se crean los cuadrados sobre cada círculo azul
      // se usan for loop para width y height, pero las variables están cambiadas 
                        // con un random de tamaño que los hace variar entre
                        // 1 y 15 px
    }
  }
}

void keyPressed(){
  if(key == 's') {
    saveFrame("s04c00Javiera_###.pdf");
  }
}