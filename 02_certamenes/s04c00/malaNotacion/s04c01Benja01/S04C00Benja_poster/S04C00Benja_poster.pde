//Expresión Digital II - Diseño Digital - UDD - 2016
//Benjamin Gutierrez
// s04c00

/*
No existe nada respecto a una descripción general de resultado ni de uso
*/

import processing.pdf.*;
int N = 0; // debe ser n minúscula
color ellie;

void setup() {
// ocupo un framrate de 10 para el patrón,
// el tamaño del canvas es de 1024, 768 y use HSB para
// los colores en vez de usar RGB
  frameRate(10);
  size(900, 1500);
  colorMode(HSB, 360, 100, 100);
  
}

void draw() {
 //desde el primer "if" son ellipses con líneas 
 //superpuestas, que cruzan por la mitad de estas elipses.
//esta descripción no es completa, debido al segundo doble-for-loop
  
 beginRecord(PDF, "folder/s04c00Benja###.pdf");
 background(253);
 if (N==0) {
    background(0);
    strokeWeight(1);
    //falta comentario específico de cada bloque de texto o cada línea
    for (int x = 0; x < width; x +=30) {
      for (int y = 0; y < height; y +=30) {
        fill(174, 100, 65);
        float r = random(20, 20);
        ellipse(x, y, r, r);
      }
    }
    //este
    //falta comentario específico de cada bloque de texto o cada línea
    for (int x = 0; x <= width; x +=50) {
      for (int y = 0; y <= height; y +=50) {
        fill(random(255),random(50),random(100));
        float r = random(10, 10);
        ellipse(x, y, r, r);
      }
    }
    //falta comentario específico de cada bloque de texto o cada línea  
    for (int x = 0; x <= width; x +=60) {
      for (int y = 0; y <= height; y +=60) {
        line(x, y, x-30, y-30);
      }
    }
    //falta comentario específico de cada bloque de texto o cada línea
    for (int x = 0; x <= width; x +=90) {
      for (int y = 0; y <= height; y +=90) {
        line(30+x, 30+y, x-30, y-30);
      }
    }
    //falta comentario específico de cada bloque de texto o cada línea
    for (int x = 0; x <= width; x +=60) {
      for (int y = 0; y <= height; y +=60) {
        line(x, y, x-30, y-30);
      }
    }
    //falta comentario específico de cada bloque de texto o cada línea
    for (int x = 0; x <= height; x +=30) {
      for (int y = 0; y <= width; y +=30) {
        line(x, y, x-30, y-30);
      }
    }
  } else if(N==1) 
  //comienza un segundo patrón que incluye un random, el que
  //produce una suerte de oleaje con las elipses, más unas elipses
  //estáticas con líneas cruzándolas.
  {  
    //falta comentario específico de cada bloque de texto o cada línea
    for (int x = 0; x <= width; x +=15) {
      for (int y = 0; y <= height; y +=15) {
        fill(174, 236, 65);
        float r = random(15, 30);
        strokeWeight(1);
        stroke(0);
        ellipse(x, y, r, r);
      }
    }   
    //falta comentario específico de cada bloque de texto o cada línea
    for (int x = 0; x <= width; x +=60) {
      for (int y = 0; y <= height; y +=60) {
        fill(96, 59, 133);
        float r = random(10, 10);
        ellipse(x, y, r, r);
      }
    }
    //falta comentario específico de cada bloque de texto o cada línea
    for (int x = 0; x <= width; x +=90) {
      for (int y = 0; y <= height; y +=90) {
        fill(96, 59, 133);
        float r = random(20, 15);
        stroke(1);
        ellipse(x, y, r, r);
      }
    }
    //falta comentario específico de cada bloque de texto o cada línea
    for (int x = 0; x <= width; x +=90) {
      for (int y = 0; y <= height; y +=90) {
        stroke(5);
        stroke(0);
        line(30+x, 30+y, x-30, y-30);
      }
    }
    //falta comentario específico de cada bloque de texto o cada línea
    for (int x = 0; x <= width; x +=90) {
      for (int y = 0; y <= height; y +=90) {
        strokeWeight(10);
        stroke(255);
        line(15+x, y, x, 15+y);
      }
    }
  }
  println(N);
  endRecord();
  //ver el serial, con el fin de ver si esta funcionando
  //la funcion que del KeyPressed.
}



void keyPressed() {
//presionar letra "n" para cambiar el patrón, y apretar
//"s" para guardar uan imagen ene formato .pdf del patrón
//falta comentario específico de cada bloque de texto o cada línea
 if(key=='q'){
   exit();}
   
  if(key=='r'){
    redraw();}
    
  if (key =='n') {
    if (N ==0) {
      N=1;
    } else {
      N=0;
    }
  } else if (key=='s') {
    saveFrame("frames/s04c00Benja###.pdf");
    }
  }