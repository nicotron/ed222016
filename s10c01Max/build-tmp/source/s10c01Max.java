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

public class s10c01Max extends PApplet {

// Expresi\u00f3n Digital II - Dise\u00f1o Digital - UDD - 2016
// Max Cordero
// s10c01
/*Programa basado en la acumulaci\u00f3n de la materia pasada en las clases de expresi\u00f3n digital.
El programa consta de dos instancias. La primera es de una grilla ordenada la cual presenta 400 elipses que se mueven dentro de un per\u00edmetro
no mayor a dos veces su propio tama\u00f1o. La idea de esta instancia es poder ordenar elementos en una grilla cuadrada y a su vez, poder moverlos independientemente.
Cuando pasa una cantidad determinada de tiempo, estos elementos cambian de elipses a cuadrados y se empiezan a mover con mayor rapidez en forma el\u00edptica
y en l\u00edneas curvas con velicidad independiente*/

//nombrar clase y llammar 400 elementos (0 a 399)
Dot[] d = new Dot [400];
boolean b;
// definir tama\u00f1o e instancia de partida
public void setup() {
  

  b = true;
//generar el ordenamiento de la grilla
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 20; j++) {
      int total = j + i * 20;
      float ix = i * 25;
      float jy = j * 25;
      float vertical = map (total, 0, 399, 10, height - 10);
      d[total] = new Dot(ix, width / 2, jy, vertical, ix + 20, jy + 20, (int)random(-2, 2), (int)random(-2, 2), (int)random(-1, 1), (int)random(-1, 1), color(0, 100, 160, random(255)), color(50, 150, 10, random(255)));
    }
  }
}

//definir dos instancias para poder hacer las transiciones entre estados. Em primero con framecount entre 0 y 300 y el segundo entre 300 y 600)
public void draw() {
  background(0);
  // println(frameCount); //no es necesario que estas funciones esten en constante uso, espec\u00edficamente println() ya que su principal uso es para debugging al ser usado con la consola
  for (int i = 0; i < d.length; i++) {
    if (frameCount > 600) {
      frameCount = frameCount % 600; // esto es igual a frameCount = 0;
    }
    if (frameCount >= 0 && frameCount < 300) {
      // b = true;
      d[i].display(0);
      d[i].grilla(0);
      d[i].move();
    } 
    if (frameCount > 300 && frameCount < 600) {
      // b = false;
      d[i].display(1);
      d[i].grilla(1);
      d[i].move2();
    }
  }
}

class Dot {
  //Llamar variables.
  float x, x2, y, y2, tx, ty, vx, vy, vx2, vy2;

  float grillax, grillay, finalx, finaly;
  
  float rotAngle;

  int c, c1;

  Dot (float x, float x2, float y, float y2, float tx, float ty, float vx, float vy, float vx2, float vy2, int c, int c1) {

    this.x = x;
    this.x2 = x2;
    this.y = y;
    this.y2 = y2;
    this.tx = tx;
    this.ty = ty;
    this.vx = vx * 0.1f;
    this.vy = vy * 0.1f;
    this.vx2 = vx2 * 0.1f;
    this.vy2 = vy2 * 0.1f;
    this.c = c;
    this.c1 = c1;

  }
  
//Definir formas y posici\u00f3n para los distintos estados 
  public void display(int f) {
    if (f == 0) {
      pushMatrix();
      translate(width * .1f, height * .1f);
      noStroke();
      fill(c);
      ellipse(grillax, grillay, 20, 20);
      popMatrix();
    } else if (f == 1) {
      pushMatrix();
      translate(width * .02f, height * .02f);
      noStroke();
      fill(c1);
      rectMode(CENTER);
      rect(grillax, grillay, 15, 15);
      popMatrix();
    }
  }

//Generar el cambio de grilla
  public void grilla(int f) {
    grillax = lerp(grillax, finalx, 0.1f);
    grillay= lerp(grillay, finaly, 0.1f);

    if (f == 0) {
      finalx = x;
      finaly = y;
    } else if (f == 1) {
      finalx = x2;
      finaly = y2;
    }
  }
//Movimiento instancia 1
  public void move() {
    x += vx;
    y += vy;
    x2 = width / 2;
    y2 = y2;
  }
  
//Movimiento instancia 2
  public void move2() {
   rotAngle++;
   rotate(radians(rotAngle / 50));
    x2 += vx / 10;
    y2 += vy / 20;
    x -= vx;
    y -= vy;
  }
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "s10c01Max" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
