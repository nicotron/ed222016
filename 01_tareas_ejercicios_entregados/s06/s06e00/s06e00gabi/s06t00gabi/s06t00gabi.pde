//Expresión Digital II - Diseño Digital - UDD - 2016
//Gabriela Navarro Risopatrón
//s06t00gabi

/* En el código se verán dos elementos, uno círcular y uno triángular. Estos apareceran y desapareceran a medida que uno
oprime las teclas "t" y "c". Pueden estas los dos elementos juntos como por separado. Además, tendrán un degradé de colores, 
que fueron determinados con anterioridad. */




float x, y, amt;                                                  //Declarar variables
color c1, c2, c3;                                                 //Declarar variables color
int x1, y1, velx, vely, cc1, i;                                   //Declarar variables
boolean v, h;                                                     //Declarar boolean global


//colores
color turque, pin, ver, bl, nr;                                   //Declarar variables color

void setup() {
  size(800, 600);                                                 //Tamaño del Canvas
  x = 200;                                                        //Inicio variable X
  y = 200;                                                        //Inicio variable Y
  x1 = (int) random(width);                                       //Inicio variable x1
  y1 = height / 2;                                                //Inicio varibale y1

  velx = 4;                                                       //Inicio variable velocidad eje x
  vely = 6;                                                       //Inicio variable velocidad eje y

  cc1 = color(120);                                               //Inicio variable color
  c1 = turque;                                                    //Inicio variable color
  c2 =  bl;                                                       //Inicio variable color
  turque = color(97, 209, 206);                                   //Inicio variable color
  bl = color(255);                                                //Inicio variable color
  nr = color(0, 0, 0);                                            //Inicio variable color
  ver = color(93, 255, 70);                                       //Inicio variable color
  pin = color(250, 121, 229);                                     //Inicio variable color

  v = true;                                                       //Boolean parte en estado "true" (acciones)
  h = false;                                                      //Boolean parte en estado "false" (acciones)
}

void draw() {
  background(bl);                                                 //Determinar color fondo canvas
  fill(c1);                                                       //Relleno de color turqueza
  strokeWeight(2);                                                //Grosor de la línea
  stroke(cc1);                                                    //Color de la línea es gris

  x += velx;                                                      //Avanzar espacios en x según variable velocidad
  y += vely;                                                      //Avanzar espacios en y según variable velocidad

  if (v == true) {                                                //Si el boolean "v" es verdadero
    triangle(x + 30, y, x, y + 60, x + 60, y + 60);               //Dibujar triángulo
  } else {                                                        //si no
    v = false;                                                    //El boolean es falso. No se dibuja
  }

  if (h == true) {                                                //Si el boolean "h" es verdadero
    ellipse(x, y, 40, 40);                                        //Dibujar círculo
  } else {                                                        //si no
    h = false;                                                    //El boolean es falso. No se dibuja
  }


  //Colores en los ejes x e y
  //Margen del canvas


  if (x > width - 40 / 2 || x < 40 / 2) {                         //"x" si cumple con las condiciones dichas
    velx *= -1;                                                   //La velocidad se multiplica por "-" cada vez que llega al final
    amt = map(x, 0, width, 0, 1);                                 //Determinación función amt
    c1 = lerpColor(turque, bl, amt);                              //Determinar dos colores para hacer la degradación
    c2 = lerpColor(ver, nr, amt);                                 //Determinar dos colores para hacer la degradación
  }

  if (y > height - 40 / 2 || y < 40 /2) {                         //"y" si cumple con las condiciones dichas
    vely *= -1;                                                   //La velocidad se multiplica por "-" cada vez que llega al final
    amt = map(x, 0, width, 0, 1);                                 //Determinar funcion amt
    c1 = lerpColor(turque, bl, amt);                              //Determinar dos colores para hacer la degradación
    c2 = lerpColor(ver, nr, amt);                                 //Determinar dos colores para hacer la degradación
  }
}

void keyPressed() {
  if (key == 't') {                                              //Si apretamos la tecla "t"
    v = !v;                                                      //El estado del boolean hace desaparecer el triángulo y aparecer
  }
  if (key == 'c') {                                              //Si apretamos la tecla "c"
    h = !h;                                                      //El estado del boolean hace desaparecer el círculo y aparecer
  }
}