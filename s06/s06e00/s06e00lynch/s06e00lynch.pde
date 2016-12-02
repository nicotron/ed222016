Planet a, b;
color red, blue, newC; // Variables de color.
Boolean nave = false; // Boolean para diferenciar una función de la otra.
int count = 10; // Contador para refrescar el fondo intermitentemente.
int miColor = 64; // Variable para crear mis colores.
int fondo = 20; // Color de fondo.

void setup() {
  size(800, 600);
  red = color ( miColor * 2, 0, miColor, miColor * 2); // Mi color 1.
  blue = color ( 0, miColor, miColor * 2, miColor * 2); // Mi color 2.
  background(20); // Fondo inicial.
  noStroke();

  a = new Planet(250, 400, 250, 650);

  b = new Planet(100, 130, 130, 260);
}


void draw() {


  if ( count == 10) { // El contador solo actúa cada 10 frames, para que el refresco de fondo genere el efecto de "rastro" que dejan las naves
    background(fondo, fondo, fondo, miColor*2); // Refresca el fondo.
    count = 0; // Resetea el contador.
    fill ( red);
    ellipse ( 100, 400, 300, 285);
    fill ( blue);
    ellipse ( 700, 400, 100, 96);
    ellipse ( 100, 100, 60, 59); // Se dibujan los planetas nuevamente;
  }
  if (nave == true) {
    b.movH();
  } else if (nave == false) {
    a.mov();
  }
  println(nave);
  count++; // Crecimiento del contador para refrescar el fondo.
}

void keyPressed() { // Este keyPressed cambia el estado del Boolean para mostrar una nave o la otra.
  nave = !nave;
}