//Expresión digital - Diseño Digital - UDD- 2016.
//Isidora Ordoñez.
//s05t00isi.

/*En este código se ejecuta el certamen 1 del curso hecho con distintas funciones void
las cuales se les agregó una función map para cambiar tamaño o opacidad de las figuras
las cuales son triángulos y tres tipos de círculos que se pueden apreciar individualmente 
presionando las teclas 'a', 's', 'd' y 'f' gracias a un boolean.
 */
 
 
float q;                           //variable 'q'. 
float w;                           //variable 'w'. 
int c;                             //variable 'c'.

int blanco;                        //variable "blanco".

boolean bo;                        //creo boolean 'bo' para triángulo.
boolean bo1;                       //creo boolean 'bo1' para círculo.
boolean bo2;                       //creo boolean 'bo2' para ellipse1.
boolean bo3;                       //creo boolean 'bo3' para ellipse2.

int diametro = 0;                  //creo variable "diámetro".
float tam;                         //creo variable "tam".

color[] colarray = new color[4];   //creo array


void setup() {
  
  size (800, 600);                        //tamaño canvas.   
  bo = true;                              //bo es verdadero.
  bo1 = true;                             //bo1 es verdadero.
  bo2 = true;                             //bo2 es verdadero.
  bo3 = true;                             //bo3 es verdadero.

  q = height/18;                          //defino 'q'.
  w = height/9;                           //defino 'w'.

  frameRate (5);

  colorMode (HSB, 360, 100, 100);         //modo de color a HSB.
  blanco = color (52, 0, 100, 50);        //asigno color blanco a "blanco".

  colarray[0] = color (86, 26.5, 74.1);   //verde.
  colarray[1] = color (41, 93.7, 98.8);   //amarillo.
  colarray[2] = color (0, 0, 100);        //blanco.
  colarray[3] = color (0);                //negro.
}

void draw() {

  background (0, 0, 100);                             //defino background para volver a dibujar.

  for (int x = 0; x <= width; x += width/11.94) {     //for loop triángulo y círculo eje x.   
    for (int y = 0; y <= height; y += height/8.94) {  //for loop triángulo y círculo eje y.

      if (bo == true) {                               //si bo es verdadero...
        triangulo (x, y, color (c));                  //dibuja a función void triángulo.
      } else {                                        //si no...
        bo = false;                                   //bo es falso.
        if ( bo1 == true) {                           //si bo1 es verdadero...
          circulo (x, y, tam, color (blanco));        //dibuja la función círculo.
        } else {                                      //si no...
          bo1 = false;                                //bo1 es falso.
        }
      }
    }
  }
  for (float x = w; x < width; x += width/5.97) {     //for loop ellipse1 en eje x.
    for (int y = 0; y < height; y +=height/4.47) {    //for loop ellipse1 en eje y.
    
      if (bo2 == true) {                              //si el bo2 es verdadero...
        ellipse1 (x, y, diametro, color(0));          //dibuja función ellipse1.
      } else {                                        //si no...
        bo2 = false;                                  //bo2 es falso.
      }
    }
  }
  for (int x = 0; x < width; x += width/5.97) {       //for loop ellipse2 en eje x.
    for (float y = w; y < height; y +=height/4.47) {  //for loop ellipse2 en eje y.
    
      if (bo3 == true) {                              //si bo3 es verdadero...
        ellipse2 (x, y, diametro, color(0));          //dibuja función ellipse2.
      } else {                                        //si no.
        bo3 = false;                                  //bo3 es falso.
      }
    }
  }
}

void triangulo (int posX, int posY, int c) {
  
  float op= map(mouseX, 0, mouseY, 0, 100);                          //map para opacidad, izquierda menos opacidad.

  //triangulo 1 (arriba):
  c = colarray [ (int) random (4) ];                                 //llamo variable color random.
  fill (c, op);                                                      //asigno valor random a relleno.
  noStroke ();                                                       //no línea de contorno.
  triangle (posX, posY, posX + q, posY + q, posX + w, posY );        //creo triángulo 1.

 //triangulo 2 (derecha):
  c = colarray [ (int) random (4) ];                                 //llamo variable color random.
  fill (c, op);                                                      //asigno valor random a relleno.
  triangle (posX, posY, posX + q, posY + q, posX, posY + w);         //creo triángulo 2.

 //triangulo 3(izquierda):
  c = colarray [ (int) random (4) ];                                 //llamo variable color random.
  fill (c, op);                                                      //asigno valor random a relleno.
  triangle (posX + w, posY, posX + q, posY + q, posX + w, posY + w); //creo triángulo 3.

 //triangulo 4(abajo):
  c = colarray [ (int) random (4) ];                                 //llamo nuevamente variable color random.
  fill (c, op);                                                      //asigno valor random a relleno.
  triangle (posX, posY + w, posX + q, posY + q, posX + w, posY + w); //creo triángulo 4.
}


void circulo (float posX, float posY, float tam, float col) {

  if (width >= height) {                              //si el ancho es mayor o igual al alto...
    diametro = height/8;                              //diámetro es igual al alto/8.
  } else {                                            //si no...
    diametro = width/11;                              //el diámetro es igual al ancho/11.
  }

  //ellipse: 
  c = colarray [ (int) random (4) ];                //llamo variable color random.
  fill (0, (int) random (40, 100));                 //asigno valor random a relleno.
  ellipse (posX + q, posY + q, diametro, diametro); //creo una ellipse.
}


void ellipse1(float posX, float posY, float tam, color col) {

  tam = map(mouseX, 0, mouseY, 0, 60);    //función map para tamaño.

 //elipse:
  c = colarray [ (int) random (4) ];      //llamo variable color random.
  fill (0, (int) random (40, 100));       //asigno valor random a relleno.
  ellipse (posX+q, posY+q, tam, tam);     //creo una ellipse.
}


void ellipse2(float posX, float posY, float tam, color col) {

  tam = map(mouseY, 0, mouseX, 0, 60);   //función map para tamaño que funciona al revés de la anterior.

 //ellipse:
  c = colarray [ (int) random (4) ];     //llamo variable color random.
  fill (0, (int) random (40, 100));      //asigno valor random a relleno.
  ellipse (posX+q, posY+q, tam, tam);    //creo una ellipse.
}


void keyPressed() {
  
  if (key == 'a') {  //si presiono 'a'...
    bo = !bo;        //bo es igual a su inverso.
  }
  if (key == 's') {  //si presiono 's'...
    bo1 = !bo1;       //bo1 es igual a su inverso.
  }
  if (key == 'd') {  //si presiono 'd'...
    bo2 = !bo2;      //bo2 es igual a su inverso.
  }
  if (key == 'f') {  //si presiono 'f'...
    bo3 = !bo3;      //bo3 es igual a su inverso.
  }
}