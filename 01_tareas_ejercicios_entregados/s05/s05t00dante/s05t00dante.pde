// Expresión Digital II - Diseño Digital - UDD - 2016
// Dante Crovetto
// s05t00Dante

/*
Una vez que corre el programa se dibujarán una serie de figuras (elipses, lineas y triángulos) que forman un patrón que consta de un fondo color blanco, 
 sobre este hay una serie de triángulos de color rojo con líneas de un color negro. Estos forman figuras similares a las de un copo de nieve en el contorno de cada módulo. Al mover el mouse en el eje Y hacia abajo el relleno de los copos tendrá una mayor opacidad.
 En el centro de cada módulo hay un círculo de color amarillo que tendrán un tamaño diferente cada vez, al mover el mouse en el eje X, el grosor de la línea irá aumentando. 
 
 Sobre cada módulo, además se dibujará una cruz en el centro de la figura del tamaño de cada módulo, al desplazar el mouse a la derecha las líneas se juntarán formando una línea vertical.
 Si se presiona la letra "s", se guardará la imagen en formato pdf con nombre "s04c00dante(número de imagen).pdf" dentro de la carpeta frames la cual está contenida dentro de la carpeta del archivo.
 Si se presiona la tecla e se cerrará el programa, si se presiona la tecla c se cerrarán las elipses, si se presiona la tecla l se cerrarán las líneas y si presiona la tecla t se cerrarán los triángulos.
 
 */
boolean transparencia_circulo;  // Se crea una boolean con nombre "transparencia_circulo"
boolean lineas_fondo;  // Se crea una boolean con nombre "lineas_fondo"
boolean triangulos;  // Se crea una boolean con nombre "triangulos"
void setup() {  //  Función que se ejecuta al principio una sola vez

  size(800, 600);  // Se crea un canvas de medidas 800x600 px
  frameRate(3);  //Se dibujan tres cuadros por cada segundo
  transparencia_circulo = true;  //el boolean transparencia_circulo es verdadero
  lineas_fondo = true;  //el boolean lineas_fondo es verdadero
  triangulos = true;  //el boolean triangulos es verdadero
}
void draw() {  // función que dibuja
  background (#FFFFFF);  //Se pone un fonde de color blanco
  strokeWeight(1);  //el grosor de línea será 1
  stroke(#000000);  //el color de línea será negro

  int diametro = 0;  // Se declara una variable "diámetro" igual a 0
  if (width >= height) {  // Si el ancho es mayor o igual al alto que ocurra lo siguiente
    diametro = height/20;  // la variable "diámetro" pasa a ser igual al alto del canvas dividido en 20
  } else {  // Si no ocurre la condición anterior, se ejecutará lo siguiente
    diametro = width / 20;  // la variable "diametro" pasa a ser igual al ancho del canvas dividido en 20
  }
  for (int x = 0; x <= 11 * width / 12; x += width / 12) {  // Mientras la nueva variable x sea menor o igual que el ancho del canvas, multiplicado por 11 y dividido por 12, se ejecutará el código de abajo e irá sumando el valor resultante del ancho del canvas dividido por doce cada vez.
    for (int y = 0; y <= 8 * height / 9; y += height / 9) {  // Mientras la nueva variable y sea menor o igual que el alto del canvas, multiplicado por 8 y dividido por 9, se ejecutará el código de abajo e irá sumando el valor resultante del alto del canvas dividido en nueve cada vez.

      float r = random(diametro);  //se crea la variable "r" que es igual a un random decimal que puede ir entre 0 y el valor de la variable "diametro".

      strokeWeight(0.5);  // el grosor de línea será de 0.5 px
      if (triangulos == true) {  // si la variable triangulos es verdadera ocurrirá lo siguiente
        triangulos_exteriores(x, y);  //se ejecutará la varibale triangulos_exteriores, entregándole los valores x e y, dibujando así todos los triángulos en cada módulo
      }


      strokeWeight(0.3);  //el grosor de línea desde ahora será de 0.3px
      if (lineas_fondo == true) {  // si la variable lineas_fondo es verdadera ocurrirá lo siguiente
        lineas_traseras(x, y);  //se ejecutará la variable lineas_traseras, entregándole los valores x e y, dibujando así las líneas que van en el fondo.
      }
      fill(#FFFF00);  //el relleno de las figuras será amarillo
      if (transparencia_circulo == true) {   // si la variable transparencia_circulo es verdadera ocurrirá lo siguiente
        elipse_central(x, y, r);  //se ejecutará la variable elipse_central, entregándole los valores x e y, dibujando así las elipses que van en el centro de cada módulo.
      }
    }
  }
}


void keyPressed() {  // se crea la funcion keyPressed
  if (key == 'e') { // si se presiona la tecla e ocurrirá lo siguiente
    exit();    //// salir
  } else if (key == 'r') { // si la condición anterior no se cumple y se presiona la tecla "r", se volverá a ejecutar la función void draw
    redraw(); // se volverá a ejecutar la función void draw
  }
  if (key == 's') {  //si es que se presiona la letra s que ocurra lo siguiente
    saveFrame("image_tiff/s04c00danteTiff###.pdf");
  }  //guarda el frame como tiff

  if (key == 'c' && transparencia_circulo == true) {  //si se presiona la tecla c y la función transparencia_circulo es verdadera ocurrirá lo siguiente
    transparencia_circulo = false;  // la boolean transparencia_circulo es falsa
  } else if (key == 'c' && transparencia_circulo == false) { //si no ocurre lo anterior, y se presiona la tecla c, cuando la boolean transparencia_circulo es falsa, ocurrirá lo siguiente
    transparencia_circulo = true;  // la boolean transparencia_ciruclo es verdadera
  }
  if (key == 'l' && lineas_fondo == true) {  //si se presiona la tecla l y la función lineas_fondo es verdadera ocurrirá lo siguiente
    lineas_fondo = false;  //la boolean lineas_fondo es falsa
  } else if (key == 'l' && lineas_fondo == false) {  //si no ocurre lo anterior, y se presiona la tecla l, cuando la boolean transparencia_circulo es falsa, ocurrirá lo siguiente
    lineas_fondo = true;  //la boolean lineas_fondo es verdadera
  }
  if (key == 't' && triangulos == true) {  //si se presiona la tecla t y la función triangulos es verdadera ocurrirá lo siguiente
    triangulos = false;  //la boolean triangulos es falsa
  } else if (key == 't' && triangulos == false) {  //si no ocurre lo anterior, y se presiona la tecla t, cuando la boolean triangulos es falsa, ocurrirá lo siguiente
    triangulos = true;  //la boolean triangulos es verdadera
  }
}

void elipse_central(int x, int y, float r) {  //se crea la función elipse_central, agregándole los valores x, y, r
  float color_strokeweight = map(mouseX, 0, width, 0, 2); // la variable decimal color_strokeweight tomará los valores ingresados por el mouse en el eje X, dándole valores entre o y 2
  strokeWeight(color_strokeweight);  //el valor del strokeweight desde ahora será igual a la variable recién mencionada.
  ellipse(x + (width / 24), y + (height / 18), r, r); // se dibuja una elipse en el centro de la figura con diámetro igual al valor asignado por el random dentro de la variable r
}
void lineas_traseras(int x, int y) {  //se crea la función lineas_traseras, agregándole los valores x e y
  float line_x = map(mouseX, 0, width, x, x + (width / 24));  // la variable decimal line_x tomará los valores ingresados por el mouse en el eje X, dándole valores entre x y x más el resultado del ancho dividido en 24
  float line_x2 = map(mouseX, 0, width, x + (width / 12), x + (width / 24));  // la variable decimal line_x2 tomará los valores ingresados por el mouse en el eje X, dándole valores entre x más el resultado del ancho dividido en 12 y x mas el resultado del ancho dividido en 24

  line(line_x, y, line_x2, y + (height / 9));   //se dibujará un línea diagonal desde la esquina superior izquierda a la inferior derecha del módulo, al estar el mouse al costado derecho del canvas la línea pasará a estar en el centro
  line(line_x, y + (height / 9), line_x2, y);   //se dibujará un línea diagonal desde la esquina superior derecha a la inferior izquierda del módulo, al estar el mouse al costado derecho del canvas la línea pasará a estar en el centro
}

void triangulos_exteriores(int x, int y) {  //se crea la función triangulos_exteriores, agregándole los valores x e y
  float alpha = map(mouseY, 0, height, 0, 100);   // se crea la variable decimal alpha, la cual tomará los valores ingresados por el mouse en el eje Y, dándole valores entre 0 y 100
  fill(255, 0, 0, alpha);  //el relleno de las figuras será roja, con un canal alpha igual a la variable recién creada.
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