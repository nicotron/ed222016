//Expresión Digital - Diseño Digital - UDD - 2016
//Benjamin Gutierrez
// s04c01

/*corre el programa y una elipse rebota en los limites del canvas, usando la funcion lerpcolor cambiamos el color.
usandso el void keypressed, cambia de una elipse a otra, con diferentes colores peri siguiendo el mismo camino*/
float x, y, velx, vely, amt, amt2;
color c1, c2, c3, c4, c5, c6;
int diam = 100;
int count = 30;
int N = 0;

void setup() {
  size(800, 600);
  x = random(width);
  y = random(height);
  velx = 5;
  vely = 5;
  c1 = color(70, 0, 255);
  c2 = color(35, 255, 25);
  c4 = color(255, 0, 0);
  c5 = color(60, 100, 90);
}

void draw() {
  if ( count == 30) {
    background(250);
    count = 0;
  }
  if (N==1) {
    c3 = lerpColor(c1, c2, amt);
    amt = map(x, 0, width, 0, 1);
    x += velx;
    y += vely;

    if (x > width - diam/2 || x < diam/2) {
      velx *= -1;
    }
    if (y > height - diam/2 || y < diam/2) {
      vely *= -1;
    }
    count++;


    fill(c3);
    noStroke();
    ellipse(x, y, diam, diam);
  } else if (N == 0) {
    c6 = lerpColor(c4, c5, amt2);
    amt2 = map(y, 0, height, 0, 1);
    x -= velx;
    y -= vely;

    if (x > width - diam/2 || x < diam/2) {
      velx *= -1;
    }
    if (y > height - diam/2 || y < diam/2) {
      vely *= -1;
    }
    fill(c6);
    noStroke();
    ellipse(x, y, diam/2, diam/2);
  }
}

void keyPressed() {
  if (key == 'n') {
    N = 1;
  } else { 
    N = 0 ;
  }
  if (key == 'r') {
    redraw();
  }
}