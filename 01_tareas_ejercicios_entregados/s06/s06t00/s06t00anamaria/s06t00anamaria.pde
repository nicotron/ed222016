//Expresión Digital II - Diseño Digital - UDD - 2016
//Ana María Ortiz
//s06t00anamaria

/*Se ven dos figuras (rombo y flecha) que aparecen y desaparecen con las teclas r (rombo)
y f (flecha), están en constante movimiento y al rebotar con los extremos van cambiando de
color. */

float velx, vely, amt;                               //declarar variables
int w, q, h, x, y, diam, r;                          //declarar variables enteras
color bla, ne, am, cal, col, col1;                   //declarar varianles de color

boolean rombo;                                       //declarar que las figuras funcionarán como boolean
boolean flecha;

void setup() {
  size(800, 600);                                    //tamaño del canvas
  rectMode(CENTER);                                  //las figuras se comenzarán a dibujar desde el centro
  velx = 2;                                          //declarar la variable de velocidad para el eje x
  vely = 2;                                          //declarar la variable de velocidad para el eje y
  w = 40;                                            //declarar valor para entero w
  q = 20;                                            //declarar valor para entero q
  h = 10;                                            //declarar valor para entero h
  x = (int)random(width);                            //declarar valor para entero x
  y = height / 2;                                    //declarar valor para entero y
  diam = 55;                                         //declarar valor para entero diam
  r = 20;                                            //declarar valor para entero r

  rombo = false;                                     //al ejecutar el programa el rombo comenzará en falso por lo que no se verá
  flecha = true;                                     //al ejecutar el programa la flecha comenzará en verdadero por lo que se verá desde un principio

  bla = color(255);                                  //inicializar color blanco
  ne = color(0);                                     //inicializar color negro
  am = color(251, 234, 46);                          //inicializar color amarillo
  cal = color(46, 215, 251);                         //inicializar color calipso
  col = am;                                          //inicializar color amarillo para cambio de color
  col1 = cal;                                        //inicializar color calipso para cambio de color
}

void draw() {
  background(bla);                                   //color blanco de fondo
  x += velx;                                         //moverse en el eje x segun la velx
  y += vely;                                         //moverse en el eje y segun la vely

  if (rombo == true) {                               //si el rombo es verdadero, se dibujará de a cuerdo a la función siguiente
    rombo(x, y, 20, 10);
  } else {                                           //de lo contrario (si es falso), se borrará
    rombo = false;
  }    
  if (flecha == true) {                              //si la flecha es verdadera, se dibujará de a cuerdo a la función siguiente
    flecha(x, y, q, h);
  } else {                                           //de lo contrario (si es falso), se borrará
    flecha = false;
  }

  if (x > width - diam / 2 || x < diam / 2) {        //si x cumple con la condición
    velx *= -1;                                      //al llegar a un extremo la velocidad se multiplicará por -1, por lo tanto rebotará
    amt = map(x, 0, width, 0, 1);                    //declarar a la variable amt su valor máximo y mínimo
    col = lerpColor(am, ne, amt);                    //la variación de color será de amarillo a negro
    col1 = lerpColor(cal, bla, amt);                 //la variación de color será de calipso a blanco
  }


  if (y > height - diam / 2 || y < diam / 2) {       //si y cumple con la condición
    vely *= -1;                                      //al llegar a un extremo la velocidad se multiplicará por -1, por lo tanto rebotará
    amt = map(x, 0, width, 0, 1);                    //declarar a la variable amt su valor máximo y mínimo
    col = lerpColor(am, ne, amt);                    //la variación de color será de amarillo a negro
    col1 = lerpColor(cal, bla, amt);                 //la variación de color será de calipso a blanco
  }
}
void keyPressed() {
  if (key == 'r') {                                  //Si se apreta la tecla 'r'
    rombo = !rombo;                                  //el rombo aparecerá y desaparecerá
  }
  if (key == 'f') {                                  //Si se apreta la tecla 'f'
    flecha = !flecha;                                //la flecha aparecerá y desaparecerá
  }
}

void rombo(int posiX, int posiY, int w, int q) {     //función del rombo
  noFill ();                                         //sin relleno
  strokeWeight(4);                                   //stroke grosor 4px
  stroke(col);                                       //el color del stroke variará según la función col
  quad(posiX + q, posiY, posiX + w, posiY + q, posiX + q, posiY + w, posiX, posiY + q); //posición del rombo
}

void flecha(int posiX, int posiY, int q, int h) {    //función de la flecha
  fill (col1);                                       //el relleno variará según la función col1
  noStroke ();                                       //sin stroke
  triangle (posiX + q, posiY, posiX + q, posiY + q, posiX, posiY + q); //triángulo de la flecha 

  strokeWeight (3);                                  //stroke grosor 3px
  stroke (col1);                                     //el stroke variará según la función col1
  line (posiX - q, posiY - q, posiX + h, posiY + h); //línea de la flecha
}