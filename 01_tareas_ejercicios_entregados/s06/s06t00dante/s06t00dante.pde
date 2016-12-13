// Expresión Digital II - Diseño Digital - UDD - 2016
// Dante Crovetto
// so6t00dante

/*
Se dibuja una elipse en que su tamaño se agranda una vez que el mouse está más a la derecha, rodeada de triángulos que corre libremente dentro del canvas. El grosor de línea de estas figuras se agranda cada vez más mientras el cursor se encuentre más a la derecha el color de estas figuras cambia entre blanco, amarillo, negro y rojo aleatoriamente al chocar con uno de los bordes del canvas, y mientras recorren este último van cambiando de color.
 Si se presiona la tecla e el programa se cerrará, si se presiona la tecla c las elipses desaparecerán. Si se vuelve a presionar aparecerá nuevamente y lo mismo ocurre al presionar la tecla t con los triángulos.
 */

boolean triangulos;  // Se crea una boolean con nombre "triangulos"
boolean transparencia_circulo;  // Se crea una boolean con nombre "transparencia_circulo"
float eje;  // Se crea la variable decimal con nombre "eje"
float amt;  // Se crea la variable tipo decimal amt
int x, y;  // Se crean la variables x e y
int vel = 5;  // Se crea la variable vel igual a 5
int vel2 = 3;  // Se crea la variable vel2 igual a 3 
int elipse = 60;  // Se crea la variable elipse igual a 60 
int diametro = 70;  // Se crea la variable diametro igual a 70
float modulo = 70;  // Se crea la variable modulo igual a 70
color c1;  //  Se crea la variable color c1
color blanco, amarillo, negro, rojo, color1, color2;  // Se crean las variables de color blanco, amarillo, negro, rojo, color1, color2

void setup() {  // Función que se ejecuta al principio una sola vez
  size(800, 600);  // Se crea un canvas de 800x600 px
  frameRate(45);  // Las figras se dibujarán 45 cuadros por segundo
  x = width / 2 ;  // La variable x es igual al ancho dividido en 2
  y = height / 2;  // La variable y es igual al alto dividido en 2
  c1 = (255);  // La variable c1 es igual a 255 (blanco)
  blanco = color (255);  // La variable blanco es igual a 255 (blanco)
  negro = color (0);  // La variable negro es igual a 0 (negro)
  amarillo = color (255, 255, 0);// La variable amarillo es igual a 255,255,0 (amarillo)
  rojo = color (255, 0, 0);  // La variable rojo es igual a 255,0,0 (rojo)
  transparencia_circulo = true;  //el boolean transparencia_circulo es verdadero
  triangulos = true;  //el boolean triangulos es verdadero
}

void draw() {  // Función que dibuja todo el tiempo
  background (123);  //el color de fondo es gris

  x += vel;  // A la variable x se le suma la variable vel
  y += vel2;  // A la variable y se le suma la variable vel2

  if (x > width - modulo || x < eje) {  // Si es que la variable x es menor que el ancho menos la variable modulo, ó  la variable x es menor que la variable eje ocurrirá lo siguiente
    vel *= -1;  // Se le multiplica por -1 la vel
    int ra = (int)random(4);  // Se crea la variable ra igual a un valor entero entre 4 números
    if (ra == 0) {  // Si es que la variable r es 0 que ocurra lo siguiente
      color1 = blanco;  // La variable color1 es igual a la variable blanco
    }
    if (ra == 1) {  // Si es que la variable ra es 1 que ocurra lo siguiente
      color1 = amarillo;  // La variable color1 es igual a la variable amarillo
    }
    if (ra == 2) {  // Si es que la variable ra es 2 que ocurra lo siguiente
      color1 = rojo;  // La variable color1 es igual a la variable rojo
    }
    if (ra == 3) {  // Si es que la variable ra es 3 que ocurra lo siguiente
      color1 = negro;  // La variable color1 es igual a la variable negro
    }
  }
  if (y > height - modulo || y < eje) {  // Si es que la variable y es menor que el alto menos la variable modulo, ó  la variable y es menor que la variable eje que ocurra lo siguiente 
    vel2 *= -1;  // Se le multiplica por -1 a la variable vel2
    int r2 = (int)random(4);  // Se crea la variable r2 que es igual a un random entero entre 4 valores
    if (r2 == 0) {  // Si es que la variable r2 es 0 que ocurra lo siguiente
      color2 = blanco;  //la variable color2 es igual al valor de la variable blanco
    }
    if (r2 == 1) {  // Si es que la variable r2 es 1 que ocurra lo siguiente
      color2 = amarillo;  //la variable color2 es igual al valor de la variable amarillo
    }
    if (r2 == 2) {  // Si es que la variable r2 es 2 que ocurra lo siguiente
      color2 = rojo;  //la variable color2 es igual al valor de la variable rojo
    }
    if (r2 == 3) {  // Si es que la variable r2 es 3 que ocurra lo siguiente
      color2 = negro;  //la variable color2 es igual al valor de la variable negro
    }
  }
  amt = map(x, 0, width, 0, 1);  // la variable amt es igual a una tabla de conversión entre el ancho del canvas a 0 y 1, que se determinará por la posición del mouse en el eje X 
  c1 = lerpColor(color1, color2, amt);  // La variable c1 es igual a el resultado entregado por lerpColor, donde se realizará una transición entre colores según la variables recién creadas. 
  float r = map(mouseX, 0, width, 0, diametro);  //se crea la variable "r" que es igual a un random decimal que puede ir entre 0 y el valor de la variable "diametro", determinada por la posición del mouse en el eje X


  background(blanco);  // Se crea un fondo blanco
  fill(c1);  // Desde ahora las figuras tendrán un relleno igual al color entregado por la variable c1
  stroke(3);  // Desde ahora las figuras tendrán un grosor de línea de 3px

  if (transparencia_circulo == true) {   // si la variable transparencia_circulo es verdadera ocurrirá lo siguiente
    elipse_central(x, y, r);  //se ejecutará la variable elipse_central, entregándole los valores x e y, dibujando así las elipses que van en el centro de cada módulo.
  }
  if (triangulos == true) {  // si la variable triangulos es verdadera ocurrirá lo siguiente
    triangulos_exteriores(x, y);  //se ejecutará la varibale triangulos_exteriores, entregándole los valores x e y, dibujando así todos los triángulos en cada módulo
    modulo = diametro;  // La variable modulo será igual a la variable diametro
    eje = 0;  // La variable eje es igual a 0
  }
}

void keyPressed() {  // Función para botones presionados
  if (key == 'c' && transparencia_circulo == true) {  //si se presiona la tecla c y la función transparencia_circulo es verdadera ocurrirá lo siguiente
    transparencia_circulo = false;  // la boolean transparencia_circulo es falsa
  } else if (key == 'c' && transparencia_circulo == false) { //si no ocurre lo anterior, y se presiona la tecla c, cuando la boolean transparencia_circulo es falsa, ocurrirá lo siguiente
    transparencia_circulo = true;  // la boolean transparencia_ciruclo es verdadera
  }
  if (key == 't' && triangulos == true) {  //si se presiona la tecla t y la función triangulos es verdadera ocurrirá lo siguiente
    triangulos = false;  //la boolean triangulos es falsa
  } else if (key == 't' && triangulos == false) {  //si no ocurre lo anterior, y se presiona la tecla t, cuando la boolean triangulos es falsa, ocurrirá lo siguiente
    triangulos = true;  //la boolean triangulos es verdadera
  }
  if (key == 'e') { // si se presiona la tecla e ocurrirá lo siguiente
    exit();    //// salir
  }
}
void triangulos_exteriores(int x, int y) {  //se crea la función triangulos_exteriores, agregándole los valores x e y
  int a= 6;  //la variable entera a es 6

  //Los triángulos que se dibujarán a continuación (4 triángulos), irán en la parte superior de cada módulo, dibujándose de izquierda a derecha. Cada triángulo será de igual tamaño y mirarán hacia abajo 

  triangle(x, y, x + (width / 48), y, x + (width / 96), y + a);
  triangle(x + (width / 48), y, x + (width / 24), y, x + (width / 32), y + a);
  triangle(x + (width / 24), y, x + (width / 16), y, x + (5 * width / 96), y + a);
  triangle(x + (width / 16), y, x + (width / 12), y, x + (7 * width / 96), y + a);



  //Los triángulos que se dibujarán a continuación (4 triángulos), irán en la parte inferior de cada módulo, dibujándose de izquierda a derecha. Cada triángulo será de igual tamaño y mirarán hacia arriba  

  triangle(x, y + (height / 9), x + (width / 48), y + (height / 9), x + (width / 96), y - a + (height / 9));
  triangle(x + (width / 48), y + (height / 9), x + (2 * width / 48), y + (height / 9), x + (3 * width / 96), y - a + (height / 9));
  triangle(x + (width / 24), y + (height / 9), x+(3 * width / 48), y + (height / 9), x + (5 * width / 96), y - a + (height / 9));
  triangle(x + (width / 16), y + (height / 9), x + (4 * width / 48), y + (height / 9), x + (7 * width / 96), y - a + (height / 9));   


  //   Los triángulos que se dibujarán a continuación (4 triángulos), irán en el costado izquierdo de cada módulo, dibujándose de arriba hacia abajo. Cada triángulo será de igual tamaño y mirarán hacia la derecha 
  triangle(x + (width / 12), y, x + (width / 12), y + (height / 36), x - a + (width / 12), y + (height / 72));
  triangle(x + (width / 12), y + (height / 36), x + (width / 12), y + (height / 18), x - a + (width / 12), y + (height / 24));
  triangle(x + (width / 12), y + (height / 18), x + (width / 12), y + (height / 12), x - a + (width / 12), y + (7 * height / 96));
  triangle(x + (width / 12), y + (height / 12), x + (width / 12), y + (height / 9), x - a + (width / 12), y + (9 * height / 96));


  //   Los triángulos que se dibujarán a continuación (4 triángulos), irán en el costado derecho de cada módulo, dibujándose de arriba hacia abajo. Cada triángulo será de igual tamaño y mirarán hacia la izquierda
  triangle(x, y, x, y + (height / 36), x + a, y + (height / 72));
  triangle(x, y + (height / 36), x, y + (height / 18), x + a, y + (height / 24));
  triangle(x, y + (height / 18), x, y + (height / 12), x + a, y + (7 * height / 96));
  triangle(x, y + (height / 12), x, y + (height / 9), x + a, y + (9 * height / 96));


  //   Los triángulos que se dibujarán a continuación (2 triángulos), irán en el costado derecho, en el centro de cada módulo, dibujándose uno hacia arriba y otro hacia abajo. Cada triángulo será de igual tamaño 
  triangle(x, y + (height / 18), x + (width / 48), y + (height / 18), x + (width / 96), y + a + (height / 18));
  triangle(x, y + (height / 18), x + (width / 48), y + (height / 18), x + (width / 96), y - a + (height / 18));


  //   Los triángulos que se dibujarán a continuación (2 triángulos), irán en el costado inferior, en el centro de cada módulo, dibujándose uno hacia la izquierda y otro hacia la derecha. Cada triángulo será de igual tamaño 
  triangle(x + (width / 24), y + (height / 12), x + (width / 24), y + (height / 9), x + a + (width / 24), y + (9 * height / 96));
  triangle(x + (width / 24), y + (height / 12), x + (width / 24), y + (height / 9), x - a + (width / 24), y + (9 * height / 96));

  //   Los triángulos que se dibujarán a continuación (2 triángulos), irán en el costado izquierdo, en el centro de cada módulo, dibujándose uno hacia arriba y otro hacia abajo. Cada triángulo será de igual tamaño 
  triangle(x + (width / 16), y + (height / 18), x + (width / 12), y + (height / 18), x + (7 * width / 96), y + a + (height / 18));
  triangle(x + (width / 16), y + (height / 18), x + (width / 12), y + (height / 18), x + (7 * width / 96), y - a + (height / 18));


  //   Los triángulos que se dibujarán a continuación (2 triángulos), irán en el costado superior, en el centro de cada módulo, dibujándose uno hacia la izquierda y otro hacia la derecha. Cada triángulo será de igual tamaño 
  triangle(x + (width / 24), y, x + (width / 24), y + (height / 36), x + a + (width / 24), y + (height / 72));
  triangle(x + (width / 24), y, x + (width / 24), y + (height / 36), x - a + (width / 24), y + (height / 72));
}

void elipse_central(int x, int y, float r) {  //se crea la función elipse_central, agregándole los valores x, y, r
  float color_strokeweight = map(mouseX, 0, width, 0, 2); // la variable decimal color_strokeweight tomará los valores ingresados por el mouse en el eje X, dándole valores entre o y 2
  strokeWeight(color_strokeweight);  //el valor del strokeweight desde ahora será igual a la variable recién mencionada.
  ellipse(x + (width / 24), y + (height / 18), r / 2, r / 2); // se dibuja una elipse en el centro de la figura con diámetro igual al valor asignado por el random dentro de la variable r
}