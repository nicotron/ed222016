//Expresión digital II - Diseño Digital - UDD- 2016.
//Isidora Ordoñez.
//s06t01isi.

/*
En este código podemos ver como los distintos void rebotan en el canvas y al llegar a una orilla de este cambia de color según las diferentes tonalidades
dadas por la función lerpColor.
*/

//Variables:
int x, y, d, q, w;                  // Creo variables int.
int vx = 2;                         // Creo variable vx y le asigno valor.
int vy = 3;                         // Creo variable xy y le asigno valor.
float amt;                          // Creo variable flat amt.

color b, n, a, v, c1, c2, c3, c4;   // Creo variables de color.

boolean bo, bo1;                    // Creo variables boolean.                                                                                         

void setup() {

  size(800, 600);                     // Asigno tamaño a canvas.
  colorMode (HSB, 360, 100, 100);     // Modo de color HSB.
  ellipseMode(CENTER);                // Modo de la elipse central.

  bo = true;                          // bo es verdadero.                                                  
  bo1 = false;                        // bo1 es falso.                                       

  d = 80;                             // Asigno valor a 'd'.
  x = d;                              // Asigno valor a 'x'.
  a = 20;                             // Asigno valor a 'a'.                                                     
  y = height / 2;                     // Asigno valor a 'y'.
  q = 40;                             // Asigno valor a 'q'.                         
  w = 80;                             // Asigno valor a 'w'.  

  c1 = color(0, 0, 100);              // Asigno valor de color a "c1".
  b = color(0, 0, 100);               // Asigno valor de color a 'b'.
  n = color(0);                       // Asigno valor de color a 'n'.
  a = color(41, 93.7, 98.8);          // Asigno valor de color a 'a'.
  v = color(86, 26.5, 74.1);          // Asigno valor de color a 'v'. 

  amt = 0.99;                         // Asigno valor a "amt".      
}

void draw() {

  background(113);                         // Asigno color a fondo.

  x += vx;                                 // A 'x' que se le sume "vx".
  y += vy;                                 // A 'y' que se le sume "vy".

// Primera condicional:
  if (bo == true) {                        // Si "bo" es verdadero.                                            
    circulo(x, y, d);                      // Dibuja void círculo. 
  } else {                                 // Si no                
    bo = false;                            // "bo" es falso.
  }

// Segunda condicional:
  if (bo1 == true) {                       // Si "bo1" es verdadero.                                      
    triangulo1(x, y);                      // Dibuja void triángulo1.       
    triangulo2(x, y);                      // Dibuja void triángulo2.
    triangulo3(x, y);                      // Dibuja void triángulo3.
    triangulo4(x, y);                      // Dibuja void triángulo4.
  } else {                                 // Si no,                                              
    bo1 = false;                           // "bo1" es falso.
  }

  //Random de color eje x:
  if (x > width - d /2 || x < d/2) {       // Si x es mayor que el ancho menos la mitad de 'd' ó menor que la ma mitad de 'd'.
    vx *= -1;                              // Multiplica "vx" por menos 1.

   amt = map(x , 0, width, 0, 1);          // "amt" es igual a la función map.

    int rx1 = (int)random(4);              // Creo variable "rx1" y le asigno un valor random de 4 valores.
    if ( rx1 == 0) {                       // Si "rx1" es igual a 0.
      c1 = lerpColor(b, n, amt);           // Asigno función lerpColor a "c1" entre 'b' y 'n'. 
    }
    if ( rx1 == 1) {                       // Si "rx1" es igual a 1.
      c1 = lerpColor(n, a, amt);           // Asigno función lerpColor a "c1" entre 'n' y 'a'.  
    }
    if ( rx1 == 2) {                       // Si "rx1" es igual a 2.
      c1 = lerpColor(v, b, amt);           // Asigno función lerpColor a "c1" entre 'v' y 'b'.
    }
    if ( rx1 == 3) {                       // Si "rx1" es igual a 3.
      c1 = lerpColor(a, v, amt);           // Asigno función lerpColor a "c1" entre 'a' y 'v'.
    }


    int rx2 = (int)random(4);              // Creo variable "rx2" y le asigno un valor random de 4 valores.
    if ( rx2 == 0) {                       // Si "rx2" es igual a 0.
      c2 = lerpColor(b, n, amt);           // Asigno función lerpColor a "c2" entre 'b' y 'n'.
    }
    if ( rx2 == 1) {                       // Si "rx2" es igual a 1.
      c2 = lerpColor(n, a, amt);           // Asigno función lerpColor a "c2" entre 'n' y 'a'.
    }
    if ( rx2 == 2) {                       // Si "rx2" es igual a 2.
      c2 = lerpColor(v, b, amt);           // Asigno función lerpColor a "c2" entre 'v' y 'b'.
    }
    if ( rx2 == 3) {                       // Si "rx2" es igual a 3.
      c2 = lerpColor(a, v, amt);           // Asigno función lerpColor a "c2" entre 'a' y 'v'.
    }


    int rx3 = (int)random(4);              // Creo variable "rx3" y le asigno un valor random de 4 valores.
    if ( rx3 == 0) {                       // Si "rx3" es igual a 0.
      c3 = lerpColor(b, n, amt);           // Asigno función lerpColor a "c3" entre 'b' y 'n'.
    }
    if ( rx3 == 1) {                       // Si "rx3" es igual a 1.
      c3 = lerpColor(n, a, amt);           // Asigno función lerpColor a "c3" entre 'n' y 'a'.
    }
    if ( rx3 == 2) {                       // Si "rx3" es igual a 2.
      c3 = lerpColor(v, b, amt);           // Asigno función lerpColor a "c3" entre 'v' y 'b'.
    }
    if ( rx3 == 3) {                       // Si "rx3" es igual a 3.
      c3 = lerpColor(a, v, amt);           // Asigno función lerpColor a "c3" entre 'a' y 'v'.
    }

    int rx4 = (int)random(4);              // Creo variable "rx4" y le asigno un valor random de 4 valores.
    if ( rx4 == 0) {                       // Si "rx4" es igual a 0.
      c4 = lerpColor(b, n, amt);           // Asigno función lerpColor a "c4" entre 'b' y 'n'.
    }
    if ( rx4 == 1) {                       // Si "rx4" es igual a 1.
      c4 = lerpColor(n, a, amt);           // Asigno función lerpColor a "c4" entre 'n' y 'a'.
    }
    if ( rx4 == 2) {                       // Si "rx4" es igual a 2.
      c4 = lerpColor(v, b, amt);           // Asigno función lerpColor a "c4" entre 'v' y 'b'.
    v
    if ( rx4 == 3) {                       // Si "rx4" es igual a 3.
      c4 = lerpColor(a, v, amt);           // Asigno función lerpColor a "c4" entre 'a' y 'v'.
    }
  } 

  //Random de color eje y:
  if ( y > height - d / 2 || y < d/2) {
    vy *= -1;

    amt = map(x, 0, width, 0, 1);

    int ry1 = (int)random(4);
    if ( ry1 == 0) {
      c1 = lerpColor(b, n, amt);
    }
    if ( ry1 == 1) {
      c1 = lerpColor(n, a, amt);
    }
    if ( ry1 == 2) {
      c1 = lerpColor(v, b, amt);
    }
    if ( ry1 == 3) {
      c1 = lerpColor(a, v, amt);
    }


    int ry2 = (int)random(4);
    if ( ry2 == 0) {
      c2 = lerpColor(b, n, amt);
    }
    if ( ry2 == 1) {
      c2 = lerpColor(n, a, amt);
    }
    if ( ry2 == 2) {
      c2 = lerpColor(v, b, amt);
    }
    if ( ry2 == 3) {
      c2 = lerpColor(a, v, amt);
    }


    int ry3 = (int)random(4);
    if ( ry3 == 0) {
      c3 = lerpColor(b, n, amt);
    }
    if ( ry3 == 1) {
      c3 = lerpColor(n, a, amt);
    }
    if ( ry3 == 2) {
      c3 = lerpColor(v, b, amt);
    }
    if ( ry3 == 3) {
      c3 = lerpColor(a, v, amt);
    }

    int ry4 = (int)random(4);
    if ( ry4 == 0) {
      c4 = lerpColor(b, n, amt);
    }
    if ( ry4 == 1) {
      c4 = lerpColor(n, a, amt);
    }
    if ( ry4 == 2) {
      c4 = lerpColor(v, b, amt);
    }
    if ( ry4 == 3) {
      c4 = lerpColor(a, v, amt);
    }
  }
}


void triangulo1(int posX, int posY) {                             

  //triangulo 1 (arriba):
  fill (c1);                                                      
  noStroke ();                                                       
  triangle (posX, posY, posX + q, posY + q, posX + w, posY );
}

void triangulo2(int posX, int posY) {                             

  //triangulo 2 (derecha):
  fill (c2);                                                     
  triangle (posX, posY, posX + q, posY + q, posX, posY + w);
}

void triangulo3(int posX, int posY) {                            

  //triangulo 3(izquierda):
  fill (c3);                                                      
  triangle (posX + w, posY, posX + q, posY + q, posX + w, posY + w);
}

void triangulo4(int posX, int posY) {                             

  //triangulo 4(abajo):
  fill (c4);                                                     
  triangle (posX, posY + w, posX + q, posY + q, posX + w, posY + w);
}

void circulo(int posX, int posY, float d) {                 

  noStroke();  
  fill(c1);     
  ellipse(posX, posY, d, d);
}

void keyPressed() {

  if (key == 'a') {                                           
    bo = !bo;
  }
  if (key == 's') {                                           
    bo1 = !bo1;
  }
}