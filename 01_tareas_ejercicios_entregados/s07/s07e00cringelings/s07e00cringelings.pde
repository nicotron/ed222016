// Expresión Digital 2 - Diseño Digital - UDD - 2016
// Catalina Ringeling Selman
// s06t00cringelings

/*
Al correr el programa, aparecerá un ellipse el cuál se irá moviento con una velocidad 4 en x y 6 en y e irá rebotando en las paredes.
A medida que se mueve, se va cambiando de color gracias a un lerpColor, entre los colores verde y burdeo.
Al apretar la tecla i, la ellipse, desaparecerá, al apretarla de nuevo aparecerá.
Al mover el mouse se va cambiando el tamaño.
 
*/

Objeto [] o = new Objeto [100];

void setup() {                                 // Se inicia el programa al iniciarlo una vez
  size(800, 600);                              // Tamaño de el Canvas
  x = 200;                                     // Variable de tamaño para x
  y = 200;                                     // Variable de tamaño para y
  x1 = (int)random(width);                     // Variable de tamaño para x1
  y1 = height / 2;                             // Variable de tamaño para y1

  velx = 4;                                    // Variable de velocidad para x
  vely = 6;                                    // Variable de velocidad para y

  t = 10;
  
  c1 = color (80, 149, 100);  // Verde         // Se señala la variable de color para la figura a dibujar
  c2 = color (255, 0, 0);     // Rojo          // Se señala la variable de color para la figura a dibujar
  c3 = color (#7C3148);       // Morado        // Se señala la variable de color para la figura a dibujar

  bl = color(255);            // Blanco        // Variable de color a usar en el background

  a = true;                   // Se señala que el boolean es verdadero al iniciar el programa
}

void draw() {                                  // Se puede efectar varias veces de principio a fin
  t = mouseY + 10;                             // Al mover el mouse por el programa en Y, se le cambiará el tamaño a la ellipse.
  amt = map(x1, 0, width, 0, 1);               //
  c2 = lerpColor(c1, c3, amt);                 //

  background(bl);                              // Color de Fondo.
  fill (c2);                                   // Color de la Ellipse al iniciar el programa.
  noStroke();                                  // No hay línea de borde
  
  x1++;
  y1++;

  x += velx;
  y += vely;

  if (a == true) {                             // Si la variable es verdadera, pasará o siguiente.
    ellipse(x, y, t * 2, t * 2);
  } else {
    a = false;
  }
  if (x > width - t / 2 || x < t / 2) {
    velx *= -1;
  }

  if (y > height - t / 2 || y < t / 2) {
    vely *= -1;
  }
}

void keyPressed () {                            // Se efectuará al apretar la letra 'i'
  if (key == 'i' && a == true) {                // Si se apreta la le
    a = false;
  } else if (key == 'i' && a == false) {
    a = true;
  }
}