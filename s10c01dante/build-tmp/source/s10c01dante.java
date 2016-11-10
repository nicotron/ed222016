import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class s10c01dante extends PApplet {

// Expresi\u00f3n Digital II - Dise\u00f1o Digital - UDD - 2016
// Dante Crovetto
// s10c01dante

/*
Se crea un fondo color verde claro y sobre este se dibuja una grilla en el fondo que va cambiando sus valores en el eje X, con diferentes elipses que se van dibujando una sobre la otra de un color verde m\u00e1s oscuro.
En el centro del cambas se dibuja una grilla en el eje X con 7 figuras que van a ir cambiando entre tri\u00e1ngulos, c\u00edrculos y rect\u00e1ngulos altern\u00e1ndose y combin\u00e1ndose entre s\u00ed
 */

 // NIVEL 

float inicio, inicio2, fin, fin2, amt;  // Se crean las variables decimales inicio, inicio2, fin, fin2, amt
boolean b, z, r, t;  // Se crean los boolean b, z, r, t
int q, w, a, e;  //Se crean las variables enteras q, w, a, e
int NUM_C = 7;  // numero de circulos interiores de cada circulo en la grilla
Objects[] objetos = new Objects [7];  // Se crea la clase Objects 

public void setup() {  // Funci\u00f3n que se ejecuta al principio una sola vez
    // Se crea un canvas de 600x600 px
  inicio = height / 4;  // La variable inicio es igual al alto dividido en 4
  inicio2 = 3 * (height / 4);  // La variable inicio 2 es igual al triple del alto dividido en 4
  fin = 3 * (height / 4);  // La variable fin es igual al triple del alto dividido en 4 
  fin2 = height / 4;  // La variable fin 2 es igual a el alto dividido en 4
  for (int i = 0; i < 7; i++) {  // Mientras la nueva variable i sea menor que 30, i va sumando 1 cada vez.
    float ix = i * width / 10; // Se crea la variable decimal ix que es igual a la multiplicaci\u00f3n de i por 30.
    // int total = i;  // total es una equivalencia directa a i por lo que no es necesario que exista.
    objetos[i] = new Objects(i, ix, inicio, inicio2, fin, fin2);  // Se ingresan las variables i, ix, inicio, inicio2, fin, fin2 a la clase
  }
}

public void draw() {  // Funci\u00f3n que se ejecuta cada vez
  background(0xffDDFAB3);  // El color de fondo es verde
  //esto es espec\u00edfico para la funci\u00f3n `fondo` por lo que debe ser declarado en esa funci\u00f3n
  noStroke();  // Las figuras no tienen borde
  objetos[0].fondo();  // La funci\u00f3n `fondo` puede ser escrita fuera de la clase y no afecta. Al igual que puede ser asignada a cualquier objeto.
  //al igual que este stroke es para toda la clase, si se trabaja con m\u00e1s de una clase, esta funci\u00f3n entra en conflicto con las clases
  stroke(3);  // el color de l\u00ednea de los bordes de las figuras es de 3 entre 0 y 255
  translate(width / 2 - width / 3, 0);  // Se traslada el origen a las cordenadas ancho dividido en 2 menos el ancho dividido en 3, 0

  for (int i = 0; i < objetos.length; i++) {  // Mientras la nueva variable i sea menor que el total de valores dentro del objeto, i va sumando 1 cada vez.

    objetos[i].colormap();  // Se dibuja el contenido del void colormap i veces

// Cada medio segundo la boolean z pasa entre positiva y negativa, si la boolean z es falso se dibuja la funci\u00f3n dibujarcirculos, si es positivo la funci\u00f3n dibujartriangulos
    if (frameCount % 30 == 0) {
      z = !z;
    } 
    if (z == false) {
      objetos[i].dibujarcirculos();
    }
    if (z == true) {
      objetos[i].dibujartriangulos();
    }
    
    // Cada dos segundos la boolean r pasa entre positiva y negativa, si la boolean r es falso se dibuja la funci\u00f3n dibujarlineas, si es positivo la funci\u00f3n dibujarrectangulos
    if (frameCount % 120 == 0) {
      r = !r;
    } 
    if (r == false) {

      objetos[i].dibujarlineas();
    }
    if (r == true) {

      objetos[i].dibujarrectangulos();
    }
    
    // Cada un segundo la boolean r pasa entre positiva y negativa, si la boolean r es falso se dibuja la funci\u00f3n configuracion, si es positivo la funci\u00f3n configuracion2
    if (frameCount % 60 == 0) {
      r = !r;
    } 
    if (r == false) {
      objetos[i].configuracion();
    }
    if (r == true) {
      objetos[i].configuracion2();
    }
  }
}
class Objects {  // Se crea la clase Objetos
  int i;  // Se crea la variable entera i
  float ix, inicio, inicio2, inicioM, fin, fin2;  // Se crean la variables decimales ix, inicio, inicio2, inicioM, fin, fin2

  Objects (int i, float ix, float inicio, float inicio2, float fin, float fin2) {  //Se ingresan los valores de las variables i, ix, inicio, inicio2, fin, fin2 provenientes de la otra ventana y se le asignan a las nuevas variables creadas anteriormente
    this.i = i;
    this.ix = ix;
    this.inicio = inicio;
    this.inicioM = inicio;
    this.inicio2 = inicio2;
    this.fin = fin;
    this.fin2 = fin2;
  }

// Se crea la funci\u00f3n fondo, en que cada un cuarto de segundo la boolean t pasa de positivo a negativo afectando haciendo que la variable NUM_C vaya sumando o restando 1 y la variable e pase entre 200 y 300
  public void fondo() {   
    if (frameCount % 15 == 0) {
      t = !t;
    } 
    if (t == false) {
      e = 200;
      NUM_C += 1;
    }
    if (t == true) {
      e = 300;
      NUM_C -= 1;
    }

// Se crean 3 for loop, en el primero se modifica el valor que va sumando q entre 200 y 300, en el segundo el valor que va sumando es  100, y en el tercero se dibujan el valor ingresado en la variable NUM_C veces i que es igual a su n\u00famero correspondiente
    for (q = 0; q <= width; q += e) {
      for (w = 0; w <= height; w += 100) {
        for (int i = 0; i < NUM_C; i++) {

// Se modifica el tama\u00f1o de la elipse variando seg\u00fan el valor de NUM_C e i
          float sizeX = (100 - (i * (100 / NUM_C)));
          float sizeY = (100 - (i * (100 / NUM_C)));

          fill(160, 190, 110, 60);
          ellipse(q, w, sizeX, sizeY);
        }
      }
    }
  }

// Var\u00eda el valor de inicioM con un frameCount para los desplazamientos en el eje Y
  public void configuracion() {
    inicioM = inicio;
    if (i % 2 == 0) {
      inicioM = inicio2;
    }
    inicio = lerp(inicio, fin, .2f);
    inicio2 = lerp(inicio2, fin2, .2f);

    if (frameCount % 60 == 0) {
      b = !b;
    } 
    if (b == true) {
      fin = height / 4;
      fin2 = 3 * (height / 4);
    }
    if (b == false) {
      fin = 3 * (height / 4);
      fin2 = height / 4;
    }
  }

//Se crea una funci\u00f3n que hace un cambio de colores seg\u00fan la altura en el eje Y
  public void colormap() {

    int partida = color(0xff6EAF6E);
    int termino = color(0xff4B674B);
    amt = map(inicioM, height / 4, 3 * height / 4, 0, 1); 
    partida = lerpColor(partida, termino, amt);
    fill(partida);
  }
  
  // Var\u00eda el valor de inicio M con un movimiento lineal para los desplazamientos en el eje Y
  public void configuracion2() {
    inicioM = inicio;
    if (i % 2 == 0) {
      inicio = inicio2;
    }


    if (frameCount % 60 == 0) {
      b = !b;
    } 
    if (b == false) {
      inicio += 5;
      inicio2 -= 5;
    }
    if (b == true) {
      inicio -= 5;
      inicio2 += 5;
    }
  }

// Se dibujan l\u00edneas desde la mitad del alto hasta el valor de inicioM modificado en la configuraci\u00f3n
  public void dibujarlineas() {

    line(ix - width / 20, height / 2, ix, inicioM);
    line(ix, inicioM, ix +  width / 20, height / 2);
  }
  
// Se dibujan rect\u00e1ngulos desde la mitad del alto hasta el valor de inicioM modificado en la configuraci\u00f3n


  public void dibujarrectangulos() {

    quad(ix - width / 20, inicioM, ix + width / 20, inicioM, ix + width / 20, height / 2, ix - width / 20, height / 2);
  }

// Se dibujan c\u00edrculos desde la mitad del alto hasta el valor de inicioM modificado en la configuraci\u00f3n


  public void dibujarcirculos() {

    ellipse(ix, inicioM, 8, 8);
  }

// Se dibujan tri\u00e1ngulos desde la mitad del alto hasta el valor de inicioM modificado en la configuraci\u00f3n

  public void dibujartriangulos() {

    triangle(ix, inicioM, ix + width / 20, height / 2, ix - width / 20, height / 2);
  }
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "s10c01dante" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
