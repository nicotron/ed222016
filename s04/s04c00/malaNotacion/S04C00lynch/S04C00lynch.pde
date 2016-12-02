// Expresión Digital II - Diseño Digital - UDD - 2016
// Ricardo Vidal Lynch
// s04c00lynch00

/*
No hay descripción general de lo que se verá al correr el programa, tampoco de cómo se usa en el caso de haber interacción 
*/

int lin2 = width / 6; // esto pasa porque width no está con el valor, este valor lo toma en la línea 18, cuando entras parámetros al size
int colT[] = {0, 100, 200}; // array para los colores del patrón de triángulos
int colRay = 42; //variable para degradado colores de línea de encima
int a = 0; // variables para tener estados de presión
int q = 0; // de las teclas a y q
int click = 0; // variable estado del click
import processing.pdf.*;  // inicializar función pdf

void setup() { 
  size(1200, 1000); //la relación era de 4x5 y no de 5x4
  background(0);
}

void draw() {
  int lin = width / 6; // luego de size puedes hacer esto, y así no tener que declarar e inicalizar a cada ciclo del draw
  println(lin2); // debug del error anterior
  int rayL[] =  {lin, lin * 2, lin * 3, lin * 4, lin * 5}; // definido aca para poder tomar valos de lin
  // array que divide la línea en 5 partes exactas
  // beginRecord(PDF, "s04c00LYNCH01.pdf"); // begin record
  
  background(0); 
  for (int i = 0; i < width; i += 10) {
    for (int j = 0; j < height; j += 10) {
      noStroke();
      //si esta línea no va, no se escribe
      //fill(i/2, j/2, 255);    // doble for loop que rellena el fondo de cuadrados tipo 
      if(click == 0){            // hormiguitas de tele de 2 opciones de color, relacionado al click
        fill(random(255));
      } else if(click == 1) {
        float colF = random(255);
        fill(colF, colF, 255);
      }
      rect(i, j, random(10, 20), random(10, 20));
    }
  }



  for (int i = 0; i < width; i += 40) {
    for (int j = 0; j < height; j += 40) {  // este otro doble for dibuja el patrón 
      patron(i, j);                    // de triángulos, definido en una función
    }                                  // en la otra pestaña
  }
  /* acá se dibuja la línea en degrade que va encima */
  strokeWeight(50);
  stroke(colRay * 6, q, colRay * 6);
  line(0, mouseY / 2.5, rayL[0], mouseY * 1.5);
  stroke(colRay * 5, q, colRay * 5);
  line(rayL[0], mouseY * 1.5, rayL[1], mouseY / 2);
  stroke(colRay * 4, q, colRay * 4);
  line(rayL[1], mouseY / 2, rayL[2], mouseY);
  stroke(colRay * 3, q, colRay * 3);
  line(rayL[2], mouseY, rayL[3], mouseY / 1.5);
  stroke(colRay * 2, q, colRay * 2);
  line(rayL[3], mouseY / 1.5, rayL[4], mouseY * 2);
  stroke(colRay, q, colRay);
  line(rayL[4], mouseY * 2, width, mouseY / 2.5);
  
  /* el color esta definido por el array */
  
  noLoop();
  // endRecord();
}

/* aca estan todas las funciones de teclado, varias letras */
void keyPressed(){
  if(key == 'a'){
    if(a == 0){  // esto lo uso para generar un estado de variable
      a = 1;       // que cambie con la presión de la tecla
      redraw();
    } else {
      a = 0;
      redraw();
    }
  }
  
  if(key == 'q'){
    if(q == 0){
      q = 255;
      redraw();
    } else {
      q = 0;
      redraw();
    }
  } 
  if(key=='p'){
   redraw();
  }
}

/*  evento de mouse */
// este void está bien utilizado, aunque no era necesario para el certamen
void mousePressed(){
  if (click == 0) {   
    click = 1;
    redraw();
  } else {
    click = 0;
    redraw();
  }
}