// Expresión Digital II
// Max Cordero
// s06e00max

/*
Pelota que rebota y cambia de color al llegar al borde
del canvas.
*/
 
int x, y;
int vel = 5;
int vel2 = 3;
int elipse = 60;
color c1;
color blanco, amarillo, negro, rojo;

void setup() {
  size(400, 400);
  x = width / 2 ;
  y = height / 2;
  c1 = (255);
  blanco = color (255);
  negro = color (0);
  amarillo = color (255, 160, 0);
  rojo = color (20, 200, 20);
  noStroke();
}

void draw() {
  background (123);
  ellipse(x, y, elipse, elipse);
  x += vel;
  y += vel2;
  fill (c1);
  if (x > width - (elipse / 2) || x < (elipse / 2)) {
    vel *= -1;
    int r =(int) random(4);
    if (r == 0) {
      c1 = blanco;
    }
    if (r == 1) {
      c1 = amarillo;
    }
    if (r == 2) {
      c1 = rojo;
    }
    if (r == 3) {
      c1 = negro;
    }
  }
  if (y > height - (elipse / 2) || y < (elipse / 2)) {
    vel2 *= -1;
    int r2 =(int) random(4);
    if (r2 == 0) {
      c1 = blanco;
    }
    if (r2 == 1) {
      c1 = amarillo;
    }
    if (r2 == 2) {
      c1 = rojo;
    }
    if (r2 == 3) {
      c1 = negro;
    }
  }
}