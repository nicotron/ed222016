// Expresión Digital - Diseño Digital - UDD - 2016
<<<<<<< HEAD
// Max Cordero
=======
// Max Cordero - Nicolás Troncoso
>>>>>>> pr/82
// s04t00
/*Patrón en grilla de 7x9. Cuadrados se dibujan con random de mi paleta de colores y otro random de 2 variables elije si se dibuja con o sin Stroke. en */
 
color random;

void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  size(500, 1000);
  background(0, 0, 100);
  noLoop();
}

void draw() {

  for (int x = 0; x <= width; x = x + width/7) {
    for (int y = 0; y <= height; y = y + height/9) {
      int c = int(random(0, 3));
      if (c == 0) {c = color(120, 90, 78);}
      if (c == 1) {c = color(0, 0, 0);}
      if (c == 2) {c = color(38, 100, 100);}
      int i = int(random(0, 2));
      if ( i == 0) {fill(c); noStroke(); rect(x, y, width/10, width/10);}
      if (i == 1) {fill(c); stroke(0, 0, 0); rect(x, y, width/10, width/10);}
    }
  }
}