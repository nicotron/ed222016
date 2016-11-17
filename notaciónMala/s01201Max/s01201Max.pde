// Expresión Digital - Diseño Digital - UDD - 2016
// Max Cordero
// s02t01max

/*Crear una composicion usando figuras basicas de Processing, funciones for, doble for e if 
 e incluyendo variables de color*/

int x; //declarar variable X
int y; //declarar variable Y
int a = 16; //declarar variable A, usada en todo el programa

/*Averigué como hacer un random de 4 colores especificos con el fin de generar nuevos colores en la composició cada vez que se incia usando el siguiente link:
https://forum.processing.org/one/topic/randomly-select-color-from-a-list-of-preset-colors.html */

color[] colorList = {color(255, 160, 0), color(20, 200, 20), color(0), color(255)}; //definir colores de lista
color randomColor = colorList[ (int) random(colorList.length)]; //definir random 1, para que no se repitan hasta que se termine el loop
color randomColor2 = colorList[ (int) random(colorList.length)]; //definir random 1, para que no se repitan hasta que se termine el loop
color randomColor3 = colorList[ (int) random(colorList.length)]; //definir random 1, para que no se repitan hasta que se termine el loop
color randomColor4 = colorList[ (int) random(colorList.length)]; //definir random 1, para que no se repitan hasta que se termine el loop




void setup () {
  size (1024, 768); //definir tamaño canvas
}
void draw () {

  rect (0, 0, 64*a, 48*a); //rectangulo principal



  for (int x = 0; x <= width; x += 5*a) { //cuadrado repetido base de patron en el eje X
    for (int y = 0; y <= height; y += 5*a) { //cuadrado repetido base de patron en el eje Y
      fill (randomColor); //relleno random
      rect (x-a, y-a, 2*a, 2*a); //dibujar cuadrado a repetir
    }
 }

  for (int x = 0; x <= width; x += 5*a) {//cuadrado repetido base de patron en el eje X
    for (int y = 0; y <= height; y += 5*a) {//cuadrado repetido base de patron en el eje Y
      fill (randomColor2); //relleno random
      rect (x+a, y+a, 3*a, 3*a);//dibujar cuadrado a repetir
    }
  }

  for (int x = 0; x <= width+80; x += 80) {//circulo repetido base de patron en el eje X
    for (int y = 0; y <= height+80; y += 80) {//circulo repetido base de patron en el eje Y
      fill (randomColor3);//relleno random
      ellipse (x, y, 3*a, 3*a);//dibujar circulo a repetir
    }
  }

  for (int x = 0; x <= width+5*a; x += 5*a) {//circulo repetido base de patron en el eje X
    for (int y = 0; y <= height+5*a; y += 5*a) {//circulo repetido base de patron en el eje Y
      fill (randomColor4);//relleno random
      ellipse (x, y, a, a);//dibujar circulo a repetir
    }
  }
}