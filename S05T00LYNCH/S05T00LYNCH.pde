// Expresión Digital - Diseño Digital - UDD - 2016
// NRicardo Vidal Lynch
// s05c00lynch

/* El sketch funciona con click, y con la presion de las teclas 'n' y 'm'
para dibujar cuadrados, circulos y lineas, respectivamente.
El tamaño de las figuras depende de las posiciones del mouse en X para la
ellipse, y en Y para el cuadrado. Las lineas reciben ambos valores y se 
dibujan todas hacia el mismo punto.
*/ 

boolean click = false; 
boolean eme = false;
boolean ene = false; // booleans controlados por CLICK, 'M' Y 'N'
float cuad, elli, linX, linY; // controladores para MAP

void setup() {
  size(800, 600);
}

void draw() {
  for (int i=0; i<width; i+=5) {
    for (int j=0; j<height; j+=5) {
      fill(i/2, 0, j/2);
      noStroke();
      rect(i, j, 5, 5); // este forLoop genera una grilla en degrade a modo de background
    }
  }
  int fil = width/12;  // generar columnas
  int col = height/9;  // generar filas

  for (int i=0; i<width; i+=fil+5) {
    for (int j=0; j<height; j+=col+5) { //forLoop>forLoop para grilla de 12*9
      if (ene==true) { 
        linea(i, j);
      }
      if (click==true) {
        cuadrado(i, j);
      }
      if (eme==true) {
        circulo(i, j);  // estructuras de control para iterar entre dibujos
      }
    }
  }
}

void circulo(int x, int y) {  // funcion 1, ellipse modificada por posX del mouse
  noStroke();
  fill(0, 0, 255);
  elli=map(mouseX, 0, width, 0, 50);
  ellipse(x, y, elli, elli);
}
void cuadrado(int x, int y) { //funcion 2, rect modificado por posY del mouse
  noStroke();
  fill(255, 0, 255);
  cuad=map(mouseY, 0, height, 0, 50);
  rect(x, y, cuad, cuad);
}
void linea(int x, int y) {  // funcion 3, linea modificada por posX y posY del mouse
  stroke(0);
  strokeWeight(2);
  linX=map(mouseX, 0, width, 100, 700);
  linY=map(mouseY, 0, height, 100, 700);
  line(x, y, linX, linY);
}

void mousePressed() {  // evento mouse, cambia el valor del boolean click
  click = !click;
}
void keyPressed() {  //eventos teclado 
  if (key=='m') {  // evento tecla 'm', cambia el valor del boolean eme
    eme = !eme;
  }
  if (key=='n') { // evento tecla 'n', cambia el valor del boolean ene
    ene = !ene;
  }
}