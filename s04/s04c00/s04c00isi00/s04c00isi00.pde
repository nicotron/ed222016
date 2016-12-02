//Expresión digital II - Diseño Digital - UDD- 2016
//Isidora Ordoñez
//s04c00isi.

/*
Con un doble for loop generar un patrón, en este caso el módulo a repetir es
 una figura compuesta de cuatro triángulos, que en su conjunto forman un cuadrado,
 estos triángulos no tienen línea de contorno y tienen un relleno random dentro de
 un array que se compone por 7 colores distintos. También el patrón contiene un 
 for loop para una serie de elipses blancas, todas del mismo tamaño y con opacidad
 random en un margen de 40% a 100% de opacidad. Luego vemos un segundo doble for loop
 para el cual creamos una elipse de un tercio del tamaño de la anterior y que se ubicará
 al centro del primer conjunto de elipses y dibujándose elipse por medio. 
 Todos los randoms son solo de números enteros. Por último el código posee un void 
 Keypressed que logra volver a dibujar el patrón al presionar la tecla 'a', guardar 
 como imagen al presionar 's' y salir del programa al presionar cualquier otra tecla.
 */

import processing.pdf.*;     //voy a trabajar con pdf,

float q = 25;     //variable 'q' igual a 20.
float w = 50;     //variable 'w' igual a 50.
int c;            //creo variable 'c'.
int blanco; 

color[] colarray = new color[7];   //creo array


void setup() {
  println("certamen01");
  colorMode(HSB, 360, 100, 100);    //modo de color a HSB.

  size(600, 750);                 //tamaño canvas.

  background(0, 0, 100);           //color canvas.

  c = color(colarray[(int)random(0, 4)]);      //variable 'c' es igual al color array.

  blanco = color(52, 0, 100);       //asigno color blanco a "blanco".

  colarray[0] = color(11, 46, 98);    //rosado.
  colarray[1] = color(173, 76, 72);   //celeste.
  colarray[2] = color(129, 77, 69);   //verde.
  colarray[3] = color(33, 92, 98);    //naranjo.
  colarray[4] = color(196, 26, 10);   //negro azulado.
  colarray[5] = color(56, 100, 95);   //amarillo.
  colarray[6] = color(52, 27, 98);    //blanco amarillento.
}

void draw() {
  //beginRecord(PDF, "s04/s04c00isi00###.pdf");        //comienza a grabar.
  for (int x = 0; x < width; x += w) {                   //for loop para eje x.
    for (int y = 0; y < height; y += w) {                //for loop para eje y.
      noStroke();                                        //las figuras próximas no tenrán contorno.

      //triángulo 1 (arriba):
      fill(c);                                          //asigno valor random a relleno.
      triangle(x, y, x + q, y + q, x + w, y);           // creo triángulo 1.

      //triángulo 2 (izquieda):  
      c = colarray [ (int) random(7) ];                  //llamo nuevamente variable color random.
      fill(c);                                          //asigno valor random a relleno.
      triangle(x, y, x + q, y + q, x, y + w);           // creo triángulo 2.

      //triángulo 3 (derecha):    
      c = colarray [ (int) random(7) ];                  //llamo nuevamente variable color random.
      fill(c);                                          //asigno valor random a relleno.
      triangle(x + w, y, x + q, y + q, x + w, y + w);  // creo triángulo 3.

      //triángulo 4 (abajo):    
      c = colarray [ (int) random(7) ];                    //llamo nuevamente variable color random.
      fill(c);                                            //asigno valor random a relleno.
      triangle(x, y + w, x + q, y + q, x + w, y + w);   // creo triángulo 4.


      //elipse 
      // se llama a c para elegir entre colores y luego no se usa. 
      c = colarray [ (int) random(6) ];             //llamo nuevamente variable color random.
      fill(blanco, (int) random(40, 100));         // asigno valor random a relleno.
      ellipse(x + q, y + q, w, w);                  //creo una elipse.
    }
  }

  for (int x = 0; x < width; x += w + w) {           //for loop para eje x.
    for (int y = 0; y < height; y += w + w) {        //for loop para eje y.
      //elipse 
      // se llama a c para elegir entre colores y luego no se usa. 
      c = colarray [ (int) random(6) ];             //llamo nuevamente variable color random.
      fill(blanco, (int) random(40, 100));         // asigno valor random a relleno.
      ellipse(x + q, y + q, w / 3, w / 3);          //creo una elipse.
    }
  }

  for (int x = 50; x < width; x += w + w) {           //for loop para eje x.
    for (int y = 50; y < height; y += w + w) {        //for loop para eje y.
      //elipse 
      // se llama a c para elegir entre colores y luego no se usa. 
      c = colarray [ (int) random(6) ];              //llamo nuevamente variable color random.
      fill(blanco, (int) random(20, 50));           // asigno valor random a relleno.
      ellipse(x + q, y + q, w / 3, w / 3);           //creo una elipse.
    }
  }
  noLoop();    //imagen fija.
  //endRecord();  //termina de grabar.
}


void keyPressed() {
  //condicional 1:  
  if ( key == 'a' ) {    //si apreto la tecla 'a'...
    redraw();            //se vuelve a dibujar.
    //condicional 2:
  } else if ( key == 's' ) {              //si apreto la tecla 's' se guarda.
    saveFrame( "s04/s04c00isi###.pdf" );   //se guarda con este nombre.
    //condicional 3:
  } else {               // si no se cumple la condicional 1 o 2...
    exit();              //cierro el programa.
  }
}


