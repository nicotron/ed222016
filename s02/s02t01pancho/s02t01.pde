// Expresión Digital - Diseño Digital - UDD - 2016
// Francisco Barría
// s02t01

/*
Espiral de mediaslunas verdes, donde la distancia entre ellas es i, y el angulo, j.
 */

void setup() {          //scope

  size  (1024, 768);
  translate (512, 384); //Se me hace mas comodo con el origen al centro.
  noStroke();
}



void draw() {           //scope
  int i = 0;
  int j = 0;

  background (#000000);
  translate (512, 384);
  fill  (0, 255, 96);
  for   (i = 0;   i < 850;   i += 6) {
    
    ellipse(i, 0, 30+i/8, 30+i/8);        //Circulo Verde
    
    fill(#000000);
    ellipse(i-5, 0, 30+i/10, 30+i/10);    //Circulo negro que tapa el verde
    
    fill (255);
    ellipse(i-5, 0, 5+i/50, 5+i/50);      //Puntos Blancos 
    
    fill  (0, 255, 96);
    for (j = 0; j < 850; j += 6)      //Angulo de la spiral.
      rotate(radians(j));
  }
}