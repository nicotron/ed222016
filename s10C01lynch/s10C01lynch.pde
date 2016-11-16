//Expresión digital II - Diseño Digital - UDD- 2016.
//Ricardo Vidal.
//s10c01lynch.


/*
Este código genera una grilla en el fondo con "planetas" que tienen otros elementos
o "satélites" que los orbitan, la amplitud de esta orbita puede manejarse para que
aumente o disminuya con la tecla 's', y se puede congelar en una amplitud a gusto 
con la tecla 'd'.
El código genera tambien una "nube" de ellipses que rotan alrededor del centro
del canvas, ademas de rotar sobre su propio eje. Hay ellipses de tonos distintos
y en degradé para genera el efecto de sombra. Las ellipses tienden a desordenarse
(entropía) siempre, pero este desorden se puede controlar y revertir presionando
la tecla 'a'.
*/
Dot[] d = new Dot[225];  // Clase Dot, nubes rosadas.
Plan[] p = new Plan[81]; // Clase Plan, ellipse orbitando el fondo.
float chng = 0.5;
boolean spire = false;
boolean sett = false; // Booleans para control de eventos.

void setup() {
  size(600, 600);
  rectMode(CENTER);
  
  
  for (int i = 0; i < 15; i++) { // Inicializadores de objetos de clases.
    for (int j = 0; j < 15; j++) {
      int total = j + i * 15;
      float x = i * 20;
      float y = j * 20;
      d[total] = new Dot(x, y, 
        (int)random(-30, 30), (int)random(-30, 10), 
        (int)random(1, 11), (int)random(-1, 1));
    }
  }

  for (int i = 0; i < 9; i++) {  // Inicializadores de objetos de clases.
    for (int j = 0; j < 9; j++) {
      int total = j + i * 9;
      float px = i*30;
      float py = j*30;
      float cc = i*22;
      float posX = width/8*i;
      float posY = height/8*j;
      p[total] = new Plan(px, py, cc, posX, posY);
    }
  }
}

void draw() {
  background(5);
  noStroke();

  for (int i = 0; i < p.length; i++) {  // Creación de objetos de clase Plan.
    p[i].displayPlan();
    p[i].movePlan();
    if (sett) {  // Esta línea permite congelar la orbita de los Plan.
      p[i].spir();
    }
  }
  translate(width * .15, height * .15); // Grilla desde el centro para Dot.

  for (int i = 0; i < d.length; i++) { // Creación de objetos de clase Dot.
    d[i].displayRect();
    d[i].move();
  }
}

void keyPressed() { // Eventos teclado.
  if (key == 'a') {
    for (int i = 0; i < d.length; i++) {
      d[i].entropy();
    }
  }
  if (key == 's') {
    spire = !spire;
  }
  if (key == 'd') {
    sett = !sett;
  }
}