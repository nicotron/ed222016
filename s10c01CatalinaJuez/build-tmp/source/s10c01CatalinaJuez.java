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

public class s10c01CatalinaJuez extends PApplet {

//Expresi\u00f3n Digital - Dise\u00f1o Digital - UDD - 2016
//Catalina Juez
//s10c01CatalinaJuez

/*
En este c\u00f3digo se puede apreciar tri\u00e1ngulos que giran en un sentido, mientras que una l\u00ednea gira de manera m\u00e1s lenta y a sentido contrario 
(desde el mismo punto de origen del tri\u00e1ngulo). Y sobre esto se puede notar unas l\u00edneas de c\u00edrculos las cuales se encuentran m\u00e1s separadas 
entre ellas y los mismos c\u00edrculos, a medida que se empieza a acercar al final de la composici\u00f3n. Adem\u00e1s de que estas l\u00edneas se encuentran 
en constante movimiento hacia el lado derecho y vuelven a aparecer nuevamente por el lado izquierdo.*/

// NIVEL 2.3: Al tener una grilla, 3 movimientos y 3 figuras (nivel 3)
// Pregunta: 1.0 no supo responder el porqu\u00e9 las l\u00edneas de elipses se iban separando a lo largo del canvas

// LLamamos a nuestros class
Cata[] e = new Cata [625];
Cata2[] d = new Cata2 [625];

// Ac\u00e1 creamos las funciones y llamamos a nuestros class (llamados anteriormente al principio del c\u00f3digo), para que act\u00faen en dichos for.
public void setup() {
  
  for (int i = 0; i < 25; i++) {
    for (int j = 0; j < 25; j++) {
      int total = j + i * 25;
      float ix = i * 25; //separaci\u00f3n entre los elementos, separaci\u00f3n de 25px entre cada uno
      float jy = j * 25; //separaci\u00f3n entre los elementos, separaci\u00f3n de 25px entre cada uno
      e[total] = new Cata(ix, jy, total);
    }

    for (int z = 0; z < 25; z++) {
      for (int w = 0; w < 25; w++) {
        int total = w + z * 25;
        float zx = z * 5; //separaci\u00f3n entre los elementos, separaci\u00f3n de 5px entre cada uno
        d[total] = new Cata2(zx);
      }
    }
  }
}


//Dentro del void draw llamamos a todos las funciones creadas dentro de cada class, para que as\u00ed se dibujen en nuestro c\u00f3digo.
public void draw() {
  background(253);
  for (int i = 0; i < e.length; i++) {

    e[i].dibujarLinea();
    e[i].dibujarTriangulo();
    e[i].mover();

    d[i].dibujarCirculo();
    d[i].mover();
    d[i].borde();
  }
}
class Cata {

  // Creamos nuestros float y int que usaremos en nuestro c\u00f3digo

  float  x, y, tx, ty, velx, vely, angulo, radius;
  float r = random(10, 30);
  float g = random(50, 100);
  float b = random(100, 200);
  int color1; 
  int color2; 
  int color3;
  int color4;

// Mencionamos nuestros float o int que usaremos en este class, que se comunica con nuestro total que se encuentra en la p\u00e1gina principal luego del for (e[total] = new Cata (x, y, z) ).
  Cata (float x, float y,  int angulo) {
    this.x = x;        
    this.y = y;
    this.angulo = angulo;

    color1 = color(r + g, g, b + g, 70); 
    color3 = color(r, g, b + r, 45);
    color4 = color(r, g, b + r, 45);
  }

// Creamos un void espec\u00edficos para nuestra l\u00ednea.
  public void dibujarLinea() {
    pushMatrix();
    translate(x, y);
    rotate(-angulo);
    strokeWeight(4);
    stroke(color3);
    line(0, 0, r, 0);
    popMatrix();
  }

// Creamos un void espec\u00edficos para nuestro tri\u00e1ngulo.
  public void dibujarTriangulo() {

    fill(color1);
    noStroke();
    pushMatrix();
    translate(x, y);
    rotate(angulo * 2);
    triangle(radius, 0, 40, 0, 2, 15);
    popMatrix();
  }

// Definimos nuestro valor para los elementos que usaremos para dar velocidad a nuestros objetos.
  public void mover() {
    angulo += 0.02f;
    ty++;
  }
}
class Cata2 {

  // Creamos nuestros float y int que usaremos en nuestro c\u00f3digo
  float y, x;
  // float r = random(5, 30);
  float r = 10 * (int)random(1,5);
  float g = random(50, 100);
  float b = random(100, 200);
  int color4;

  // Mencionamos nuestros float o int que usaremos en este class, adem\u00e1s de  definir el color a usar.
  Cata2 (float x) {
    this.x = x;
    color4 = color(r, g, b + r, 7);
  }

  // Creamos un void espec\u00edficos para nuestros c\u00edrculos.
  public void dibujarCirculo() {
    pushMatrix();
    noStroke();
    fill(color4);
    ellipse(x * 5, y + r, r, r);
    ellipse(x * 5, y + r * 5, r, r);
    ellipse(x * 5, y + r * 10, r, r);
    ellipse(x * 5, y + r * 20, r, r);
    popMatrix();
  }

  // Definimos nuestro valor de x, que ser\u00e1 el responsable de darle velocidad a nuestros objetos.
  public void mover() {
    x++;
  }

  // Ac\u00e1 hacemos posible que nuestra l\u00ednea de c\u00edrculos se repita como un bucle, (cuando x * 5 sea mayor al ancho, entonces x  vuelve a ser 0 ). 
  public void borde() {
    if (x * 5 > width) {
      x = 0;
    }
  }
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "s10c01CatalinaJuez" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
