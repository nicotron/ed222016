// Expresión Digital II - Diseño Digital - UDD - 2016
// Javiera Ramírez
// s06t00

/* Cuando el programa corra se verá un canvas negro en el cual 
 rebota un círculo en las paredes del canvas mientras cambia de color
 periódicamente entre el naranjo y el calipso*/

float x, y, amt;
int vel= 5;
int vel2= 6;
int vel3 = 6;
int vel4 = 5;
int diam= 80;
color c1, c2, c3;

void setup () {
  size (800, 600);
  x = 20 ;
  y = height / 2;

  c1 = color(255, 106, 0); // naranjo
  c2 = color (4, 175, 146); // calipso
}

void draw () {
  c3 = lerpColor(c1, c2, amt);
  amt = map(x, 0, width, 0, 1);
  background(0);
  fill(c3);
  noStroke();
  ellipse(x, y, diam, diam);
  x += vel;
  y += vel2;

  if (y > height - diam/2 || y < diam/2) {
    vel2*= -1;
  }

  if (x > width - diam/2 || x < diam/2) {
    vel*= -1;
  }
}