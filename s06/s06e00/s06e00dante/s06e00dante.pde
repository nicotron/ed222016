// Expresión Digital II - Diseño Digital - UDD - 2016
// Dante Crovetto
// so6e00dante

/*
se dibuja una elipse que corre libremente dentro del canvas, la cual cambia entre blanco, amarillo, negro y rojo aleatoriamente al chocar con uno de los bordes del canvas 
 */
 
int x, y;  // Se crean la variables x e y 
int vel = 5;  // Se crea la variable vel igual a 5
int vel2 = 3;  // Se crea la variable vel2 igual a 3 
int elipse = 60;  // Se crea la variable elipse igual a 60 
color c1;  //  Se crea la variable color c1
color blanco, amarillo, negro, rojo;  // Se crean las variables de color blanco, amarillo, negro, rojo

void setup() {  // Función que se ejecuta al principio una sola vez
  size(400, 400);  // Se crea un canvas de 400x400 px
  x = width / 2 ;  // La variable x es igual al ancho dividido en 2
  y = height / 2;  // La variable y es igual al alto dividido en 2
  c1 = (255);  // La variable c1 es igual a 255 (blanco)
  blanco = color (255);  // La variable blanco es igual a 255 (blanco)
  negro = color (0);  // La variable negro es igual a 0 (negro)
  amarillo = color (255, 255, 0);// La variable amarillo es igual a 255,255,0 (amarillo)
  rojo = color (255, 0, 0);  // La variable rojo es igual a 255,0,0 (rojo)
}

void draw() {  // Función que dibuja todo el tiempo
  background (123);  //el color de fondo es gris
  ellipse(x, y, elipse, elipse);  // se dibuja un círculo en las coordenadas x e y con diámetro igual al valor entregado por la variable elipse
  x += vel;  // A la variable x se le suma la variable vel
  y += vel2;  // A la variable y se le suma la variable vel2
  fill (c1);  // El color de relleno desde ahora será igual al color entregado por la variable c1
  if (x > width - (elipse / 2) || x < (elipse / 2)) {  // Si es que la variable x es menor que el ancho menos la variable elipse dividido en 2, ó  la variable x es menor que la variable elipse dividido en 2 que ocurra lo siguiente
    vel *= -1;  // Se le multiplica por -1 la vel
    int r =(int) random(4);  // Se crea la variable r igual a un valor entero entre 4 números
    if (r == 0) {  // Si es que la variable r es 0 que ocurra lo siguiente
      c1 = blanco;  // La variable c1 es igual a la variable blanco
    }
    if (r == 1) {  // Si es que la variable r es 1 que ocurra lo siguiente
      c1 = amarillo;  // La variable c1 es igual a la variable amarillo
    }
    if (r == 2) {  // Si es que la variable r es 2 que ocurra lo siguiente
      c1 = rojo;  // La variable c1 es igual a la variable rojo
    }
    if (r == 3) {  // Si es que la variable r es 3 que ocurra lo siguiente
      c1 = negro;  // La variable c1 es igual a la variable negro
    }
  }
  if (y > height - (elipse / 2) || y < (elipse / 2)) {  // Si es que la variable y es menor que el alto menos la variable elipse dividido en 2, ó  la variable y es menor que la variable elipse dividido en 2 que ocurra lo siguiente 
    vel2 *= -1;  // Se le multiplica por -1 a la variable vel2
    int r2 =(int) random(4);  // Se crea la variable r2 que es igual a un random entero entre 4 valores
    if (r2 == 0) {  // Si es que la variable r2 es 0 que ocurra lo siguiente
      c1 = blanco;  //la variable c1 es igual al valor de la variable blanco
    }
    if (r2 == 1) {  // Si es que la variable r2 es 1 que ocurra lo siguiente
      c1 = amarillo;  //la variable c1 es igual al valor de la variable amarillo
    }
    if (r2 == 2) {  // Si es que la variable r2 es 2 que ocurra lo siguiente
      c1 = rojo;  //la variable c1 es igual al valor de la variable rojo
    }
    if (r2 == 3) {  // Si es que la variable r2 es 3 que ocurra lo siguiente
      c1 = negro;  //la variable c1 es igual al valor de la variable negro
    }
  }
}