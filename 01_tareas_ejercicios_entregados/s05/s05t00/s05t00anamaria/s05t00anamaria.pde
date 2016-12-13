//Expresión Digital 2 - Diseño Digital - UDD - 2016
//Ana María Ortiz
//s05t00anamaria

/* El cógigo muestra una grilla de 12 x 9 columnas, en la que en sus intersecciones se dibujarán las figuras.
El código consta de 4 funciones distintas (rombo, punto, triángulo y flecha), todas con una letra del teclado 
determinada para hacer aparecer y desaparecer la figura, y con distintas variaciones a través del movimiento 
horizontal o vertical del mouse.*/ 

boolean rombo, punto, triangulo, flecha;                 //declarar que las figuras funcionarán como boolean


int w = 20;                                              //declarar valor para entero w    
int q = 10;                                              //declarar valor para entero q
int h = 5;                                               //declarar valor para entero h

color am, cal;                                                //declarar variable color amarillo y calipso

void setup() {

  size(800, 600);                                        //tamaño del canvas
  rectMode(CENTER);                                      //las figuras se comenzarán a dibujar desde el centro
  rombo = true;                                          //al ejecutar el programa el rombo comenzará en verdadero por lo que se verá desde un principio
  punto = true;                                          //al ejecutar el programa el punto comenzará en verdadero por lo que se verá desde un principio
  triangulo = true;                                      //al ejecutar el programa el triángulo comenzará en verdadero por lo que se verá desde un principio
  flecha = false;                                        //al ejecutar el programa la flecha comenzará en falso por lo que no se verá

  am = color(251, 234, 46);                              //inicializar color amarillo
  cal = color(46, 215, 251);                             //inicializar color calipso
}  

void draw() {
  background(255);                                       //color fondo blanco
  for (int x = 0; x <= width; x += width/11) {           //grilla de 12 columnas en el eje x
    for (int y = 0; y <= height; y += height/8) {        //grilla de 9 columnas en el eje y
      if (rombo == true) {                               //si el rombo es verdadero, se dibujará de a cuerdo a la función siguiente
        rombo(x, y, 20, 10);
      } /*else {                                           //de lo contrario (si es falso), se borrará
        rombo = false;
      }*/
      if (punto == true) {                               //si el punto es verdadero, se dibujará de a cuerdo a la función siguiente
        punto(x, y, q);
      } /*else {                                           //de lo contrario (si es falso), se borrará
        punto = false;
      }*/
      if (triangulo == true) {                           //si el triángulo es verdadero, se dibujará de a cuerdo a la función siguiente
        triangulo(x, y, 15);
      }/* else {                                           //de lo contrario (si es falso), se borrará
        triangulo = false;
      }*/
      if (flecha == true) {                              //si la flecha es verdadera, se dibujará de a cuerdo a la función siguiente
        flecha(x, y, q, h);
      }/* else {                                           //de lo contrario (si es falso), se borrará
        flecha = false;
      }*/
    }
  }
}

void rombo(int posiX, int posiY, int w, int q) {         //función del rombo
  float rom = map(mouseX, 0, width, 2, 5);               //si se mueve el mouse en el eje x, el ancho del stroke del rombo variará entre 2 y 5
  noFill();                                             //sin relleno
  strokeWeight(rom);                                     //el stroke variará de a cuerdo a la función rom, es decir entre 2 y 5
  stroke(am);                                            //stroke color amarillo
  quad(posiX + q, posiY, posiX + w, posiY + q, posiX + q, posiY + w, posiX, posiY + q); //rombo en el centro del módulo
}

void punto(int posiX, int posiY, int q) {                //función del punto
  float punt = map(mouseX, 0, width, 5, 0);              //si el mouse se mueve en el eje x, el ancho del stroke variará entre 5 y 0
  strokeWeight(punt);                                   //el stroke variará según la función punt, es decir, entre 5 y 0
  stroke(cal);                                          //stroke color calipso
  point(posiX + q, posiY + q);                          //punto en el centro del rombo
}

void triangulo(int posiX, int posiY, int size) {         //función del triángulo
  float trian = map(mouseY, 0, height, size / 2, size);  //si el mouse se mueve en el eje y, el fill cambiará de tamaño entre la mitad y su tamaño completo
  fill(am);                                             //relleno color amarillo que variará según la función trian
  noStroke();                                           //sin stroke
  triangle(posiX, posiY - trian, posiX - trian, posiY - trian, posiX - trian, posiY); //triángulo esquina superior izquierda
}

void flecha(int posiX, int posiY, int q, int h) {        //función de la flecha
  float fle = map(mouseY, 0, height, 0, 255);             //si el mouse se mueve en el eje y, la opacidad de la flecha variará 
  fill(cal, fle);                                       //relleno color calipso que variará su opacidad según la función fle
  noStroke();                                           //sin stroke
  triangle(posiX + q, posiY, posiX + q, posiY + q, posiX, posiY + q); //triángulo de la flecha 

  strokeWeight(2);                                      //stroke grosor 2px
  stroke(cal, fle);                                     //stroke color calipso que variará su opacidad según la función fle
  line(posiX - q, posiY - q, posiX + h, posiY + h);     //línea de la flecha 
}

void keyPressed() {                                      

  if (key == 'a') {                                      //si se apreta en el teclado la letra a
    rombo = !rombo;                                      //el rombo será verdadero o falso, es decir se dibujará o desaparecerá
  } 
  if (key == 's') {                                      //si se apreta en el teclado la letra s
    punto = !punto;                                      //el punto será verdadero o falso, es decir se dibujará o desaparecerá
  } 
  if (key == 'd') {                                      //si se apreta en el teclado la letra d
    triangulo = !triangulo;                              //el triángulo será verdadero o falso, es decir se dibujará o desaparecerá
  } 
  if (key == 'f') {                                      //si se apreta en el teclado la letra f
    flecha = !flecha;                                    //la flecha será verdadera o falsa, es decir se dibujará o desaparecerá
  }
}