//Expresión Digital II - Diseño Digital - UDD - 2016
//Margaux Leroy
//s04c00margaux00

import processing.pdf.*; //registrar el pdf en la carpeta

/*
Falta una descripción general del resultado gráfico final y 
los cambios que ocurren con el teclado
*/

void setup(){            //anunciación de los predeterminados
  background(#00BC9C);   //color del fondo
  size(400, 500);        //tamaño del canvas
} 

  //declaración de variables

  color c = color(random(250), random(250), random(250));
  int i = 50;
  int j = 80;
  float r = random(20);

void draw() {            //formas en todo el canvas 
  // beginRecord(PDF, "s04c01margaux01.pdf");      //empieza el registro del pdf en la carpeta
  for (int y = 0; y < height; y += 20) {       //distancia de 20px en la altura
    for (int x = 0; x < width; x += 20) {      //distancia de 20px en la anchura
      stroke(c);                              //color del contorno
      strokeWeight(1);                        //espesor del contorno
      noFill();                               //sin relleno
      rect(x, y, i, j);                       //rectángulo que forma una cuadrícula
 }
}
 
  for (int y = 0; y < height; y += 40) {      //distancia de 40px en la altura
    for (int x = 0; x < width; x += 120) {    //distancia de 120px en la anchura
      stroke(#EEEEEE);                      //color del contorno
      line(x + 20, y - 20, x - 20, y + 20);
 }
}
  
  for (int y = 0; y < width; y += 120) {    //distancia de 120px en la anchura
    for (int x = 0; x < height; x += 40) {  //distancia de 40px en la altura
      line(x - 10, y + 10, x + 10, y - 10);
 }
}

//cambio de las variables
 
  i = 20;    
  j = 40;    


  // existe un error de sintaxis, la variable X y la variable Y están siendo
  // usadas al revés, X para Y, Y para X, es por eso que no existen elipses at the bottom of the canvas
  for (int y = 0; y < height; y += 20) {    //distancia de 20px en la altura
    for (int x = 0; x < width; x += 20) {   //distancia de 20px en la anchura
      c = color(random(250), random(250), random(250));  //precisión del color
      strokeWeight(2);      //espeso del contorno 
      stroke(c);            //color del contorno
      noFill();             //no fundo
      if (x > 100){                         //si x superior a 100px
        ellipse(y + 20, x + 20, i, j);          //cambio de los predeterminados de la elipse
      }
      else{
        noStroke();                        //no espeso
        fill(c);                            //fundo con variable c
        ellipse(y + 20, x + 20, 10, 10);
  }
}

noLoop();            //no se ejecutan la bucle
endRecord();         //terminar el registro del PDF
  }
}

void keyPressed(){      //función que permite de cambiar los random con una letra
  if (key == 'b') {   
    redraw();
   } else if (key == 'c') {
     exit();
  }    
}