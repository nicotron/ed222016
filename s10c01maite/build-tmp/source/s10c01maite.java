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

public class s10c01maite extends PApplet {

//Expresi\u00f3n Digital II - Dise\u00f1o Digital - Facultad de Dise\u00f1o - UDD - 2016.
//Maite Iturriaga Batlle.
//s10c01

/* Este c\u00f3digo se ver\u00e1n distintos movimientos y formas gracias a dos boolean, 
la primera funci\u00f3n, "flor" est\u00e1 compuesta de 4 elipses que en su conjunto tienen un movimiento de random 
el que cambia los valores de x, y dentro de una peque\u00f1a grilla.
La segunda funci\u00f3n "margarita" est\u00e1 compuesta de cuadrados y puntos (formando una flor),
que se mueven a trav\u00e9s del eje y (de arriba hacia abajo) tambi\u00e9n de forma random, dentro de un espacio limitado, 
por otra parte, la funci\u00f3n "linea" compuesta por una serie de l\u00edneas que rotan en base a uno de sus propios puntos sumando cada vez + 0.02,
todo esto en una grilla cuadrada delimitada.
*/
Hola[] h = new Hola[100];
Hola[] k = new Hola[100];

boolean b, c;
int i;

public void setup() {
  
  rectMode(CENTER);
  b = true;
    /*Doble for loop para generar una grilla "flor" */
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      int total = j + i * 10;
      float x = i * 20;
      float y = j * 20;
      h[total] = new Hola(x, y, x + 5, y + 5, (int)random(-2, 2), (int)random(-2, 2), total);
    }
  }
/*Doble for loop para generar una grilla distinta usada en "margarita" y "linea" */
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      int total = j + i * 10;
      float x = i * 50;
      float y = j * 50;
      k[total] = new Hola(x, y, x + 5, y + 5, (int)random(-2, 2), (int)random(-2, 2), total);
    }
  }
}

public void draw() {

  /*Se genera un boolean dentro de un estado de otro, 
   boolean, incluyendo un conteo (fameCount) */

  if (frameCount % 100 == 0) {
    b = !b;
  }
  if (b == true) {
    if (frameCount % 50 == 0) {
      c = !c;
    }
  }
  // t\u00edtulos explicativos de lo que pasa en el parrafo de c\u00f3digo
  if (c == true) {
    pushMatrix();
    background(255, 255, 0);
    translate(width * .19f, height * .19f);
    for (int i = 0; i < h.length; i++) {
      h[i].flor();
      h[i].mover();
      h[i].borde();
    }
    popMatrix();
  }

  // t\u00edtulos explicativos de lo que pasa en el parrafo de c\u00f3digo
  if (c == false) {
    translate(width / 5, height / 5);
    background(51);
    for (int i = 0; i < k.length; i++) {
      k[i].margarita();
      k[i].borde();
    }
  }


  // t\u00edtulos explicativos de lo que pasa en el parrafo de c\u00f3digo
  if ( b == false) {
    pushMatrix();
    translate(width / 8, height / 8);
    background(220, 20, 60);
    for (int i = 0; i < k.length; i++) {
      k[i].moverlo();
      k[i].linea();
      k[i].dibujar();
      k[i].borde();
    }
    popMatrix();
  }
}
class Hola {
  /*Se declaran las variables globales de la clase*/
  float x, y, a, r, e, tx, ty, vx, vy, angulo;
  int carmesi, amarillo, blanco;

  Hola (float x, float y, float tx, float ty, float vx, float vy, float angulo) {
    this.x = x;
    this.y = y;
    this.r = 10; // variable sin uso
    this.tx = tx;
    this.ty = ty;
    this.angulo = angulo;
    this.vx = vx * 0.2f;
    this.vy = vy * 0.2f;
    this.carmesi = color(220, 20, 60);
    this.amarillo = color(255, 255, 0);
    this.blanco = color(255);
  }
  /*pushMatrix(); sirve para cambiar el estado de las coordenaras y 
   popMatrix(); para devolver el estado actual de las coordenadas,
   encerrando todas las funciones que est\u00e1n dentro de ellos*/

  // t\u00edtulos explicativos de lo que pasa en el parrafo de c\u00f3digo
  public void margarita() {
    pushMatrix();               
    translate(x, y); 
    e += vy;
    stroke(blanco);
    strokeWeight(10);
    point (x, y + 4 + e);
    point (x + 4, y + e);
    point (x + 8, y + 4 + e);
    point (x + 4, y + 8 + e);
    fill(amarillo);
    noStroke();
    rect(x + 4, y + 4 + e, 10, 10);
    popMatrix();
  } 

  /*Flor, dibujo 4 c\u00edrculos*/
  public void flor() {
    pushMatrix();                                                                          
    translate(x, y);     
    noStroke(); 
    fill(carmesi);
    point(x - 5, y - 5); // al estar noStroke() los puntos no se dibujar\u00e1n NUNCA
    ellipse(x, y, 6, 6);
    ellipse(x + 10, y + 10, 6, 6);
    ellipse(x, y + 10, 6, 6);
    ellipse(x + 10, y, 6, 6);
    popMatrix();
  }
  
  /* Movimiento, en base a (x, y)*/
  public void mover() {
    x += vx;
    y += vy;
  }

/*Movimiento y rotaci\u00f3n de l\u00edneas en base a cada punto (x, y)*/
  public void moverlo() {
    x += vx;
    y += vy;
    angulo += 0.02f;
  }

  // t\u00edtulos explicativos de lo que pasa en el parrafo de c\u00f3digo
  public void linea() {
    pushMatrix();
    translate(x, y);
    rotate(angulo);
    strokeWeight(5);
    stroke(blanco);
    line(0, 0, 10, 0);
    popMatrix();
  }

  // t\u00edtulos explicativos de lo que pasa en el parrafo de c\u00f3digo
  // el nombre de la funci\u00f3n debe ser m\u00e1s descriptivo, dibujar es gen\u00e9rico si hay m\u00e1s formas por dibujar
  public void dibujar() {
    pushMatrix();
    translate(width * .15f, height * .15f);
    noFill();
    strokeWeight(1);
    popMatrix();
  }

  // t\u00edtulos explicativos de lo que pasa en el parrafo de c\u00f3digo
  public void borde() {
    if (x > tx || x < tx - 10) {
      vx *= -1;
    }
    if (y > ty || y < ty - 10) {
      vy *= -1;
    }
  }
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "s10c01maite" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
