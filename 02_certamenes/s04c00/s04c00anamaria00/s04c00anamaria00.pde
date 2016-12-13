//Expresión Digital II - Diseño Digital - UDD - 2016
// Ana María Ortiz
//s04c00anamaria00

//Se crearán dos triángulos en distintas posiciones, unos en color gris y otros en color amarillo, también habrá un rombo con un punto en el centro

import processing.pdf.*;

color ao, gc, go, gmo;                       //colores
float r, q;                                  //variables de que?    
int w, update;                               //números enteros para qué?


void setup() {
  size(800, 1000);                             //tamaño del canvas

  colorMode(HSB, 360, 100, 100);                  //modo de color

  ao = color(57, 98, 83);                      //amarillo oscuro
  gc = color(314, 1, 94);                      //gris claro
  go = color(49, 4, 54);                       //gris oscuro
  gmo = color(33, 6, 39);                      //gris muy oscuro
  r = random(0, 255);                          //random

  w = 20;                                      //valor w
  q = 10;                                      //valor q

  update = 50;                                 //valor update
}

void draw() {
  beginRecord(PDF, "s04c00anamaria###.pdf"); //falta este comentario
  background(gc);                            //color del fondo

  for (int x = 20; x < width; x += update) {    //si x es menor que el ancho del canvas, se le sumará el valor del update
    for (int y = 20; y < height; y += update) {   //si y es menor que el largo del canvas, se le sumará el valor del update
      float p = random(3);                      //variable random de 0 a 3

      if (p > 1) {                                 //si la condición p es mayor a 1, se dibujará el rombo, el punto y el triángulo gris
        noFill();                                   //sin relleno
        strokeWeight(3);                            //stroke grosor 3px
        stroke(go);                                 //stroke color gris oscuro
        quad(x + q, y, x + w, y + q, x + q, y + w, x, y + q); //rombo en el centro del módulo

        strokeWeight(5);                            //stroke grosor 5px
        stroke(ao);                                 //stroke color amarillo oscuro
        point(x + 10, y + 10);                      //punto en el centro del rombo

        fill(gmo);                                  //relleno color gris más oscuro
        noStroke();                                 //sin stroke
        triangle(x, y - 15, x - 15, y - 15, x - 15, y); //triángulo esquina superior izquierda
        
      } else if (p < 1) {                         //en el caso de que p sea menor que 1, se dibujará el triángulo amarillo
        fill(ao);                                   //relleno color amarillo oscuro 
        noStroke();                                 //sin stroke
        triangle(x + 10, y, x + 10, y + 10, x, y + 10); //triángulo 

        strokeWeight(2);                            //stroke grosor 2px
        stroke(ao);                                 //stroke color amarillo oscuro
        line(x - 10, y - 10, x + 5, y + 5);         //posición de la línea
      }
    }
  }
  noLoop();                                    //hace que no se repita todo el tiempo
  endRecord();                                 //falta este comentario
}  

void keyPressed() {                          
  if (key == 'a') {                           //cada vez que se presiona la tecla a, se redibujará
    redraw ();
  }
}