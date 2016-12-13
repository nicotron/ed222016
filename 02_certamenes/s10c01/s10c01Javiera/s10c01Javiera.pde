// Expresión Digital II - Diseño Digital - UDD
// Javiera Ramírez
// s10c01Javiera

/* Cuando corra el programa se verá un fondo azul y una grilla de 625 objetos que varían entre elipses y líneas de borde cuadrado que rotan al rededor de un punto
fijo (individual para cada objeto). La distancia a la que rotan con respecto al punto central va variando cada cierto tiempo, aumentando y disminuyendo constantemente.
Al igual que el radio de giro, el grosor de la figura también va cambiando, aumentando y disminuyendo constantemente, pero a un ritmo distinto, lo que crea la ilusión de
que la grilla realiza diferentes movimientos*/

//  NIVEL 0.3: Una grilla, un movimiento, dos figuras (nivel 1)

// Declaración de variables
float  f, g, amt; //amt no está en uso de forma global debe ser declarados en el Constructor
boolean b;
// int nuevovalor, i; //nuevovalor, i no está en uso de forma global
color c1, c2, c3; // no están en uso de forma global deben ser declarados en el Constructor
float radioGiro = 0.01;
float grosor    = 0.001;  


Javi[] v = new Javi [625]; 
// Se crea el array con 625 espacios para rellenar con información

void setup() {
/* Aquí se crea el canvas de 600x600 px y se crea la grilla de 625 elementos por 
medio de un doble for loop, cada elemento tiene una separación con el otro de 18 px*/
  size(600, 600);
  f = 15;
  g = 10;
  for (int i = 0; i < 25; i++) {
    for (int j = 0; j < 25; j++) {
      int total = j + i * 25;
      float ix = i * 18; //distancia entre los elementos 
      float jy = j * 18; //distancia entre los elementos
      v[total] = new Javi(ix, jy, ix + 5, jy + 5, (int)random(-2, 2), (int)random(-2, 2), total);
    }
  }

  b = true;
}

/* Se dibujan el color de fondo y los objetos de la grilla al por medio de las 
funciones generadas en el class*/
void draw() {
  background(#42405F); // Azul
  translate(width * .15, height * .15);


  for (int i = 0; i < v.length; i++) {
    v[i].mover();
    v[i].bordes();
    v[i].linea(f, g);

    if (frameCount % 10 == 0) {radioGiro *= -1;}
    if (frameCount % 30 == 0) {grosor *= -1;}
    if (frameCount % 90 == 0) {b = !b;}

    f+= radioGiro;
    g+= grosor;

    if (b) {
      strokeCap(SQUARE);
    } else {
      strokeCap(ROUND);
    }
  }
}