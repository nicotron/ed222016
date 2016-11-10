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

public class s10c01gabi extends PApplet {

//Expresi\u00f3n Digital II - Dise\u00f1o Digital - Facultad de Dise\u00f1o - Universidad del Desarrollo - 2016
//Gabriela Navarro Risopatr\u00f3n
//s10c01gabi

/* En este c\u00f3digo se llamar\u00e1n las diferentes clases, esto se lograr\u00e1 mediante un boolean. Las clases ser\u00e1n 
 movimientos y figuras. Esto permite lograr diferentes composiciones con los movimientos descritos en el c\u00f3digo.
 Lo que se muestra primero son los cuadrados, que estan posicionados en la grilla de tal manera que genera
 un m\u00f3dulo de 25 * 25 cuadrados de color tuqueza con un stroke de 1.5 y de color 120 (gris). Luego este cambia y se compone de
 de l\u00edneas, este tambi\u00e9n consta de un m\u00f3dulo de 25 * 25, la diferencia est\u00e1 en que este crea solamente la mitad
 del cuadrado, generando as\u00ed que se forme y desforme el cuadrado descrito. 
 */

Gabi[] g = new Gabi[625];                                                                                //Creo "Gabi"            
float x, y, angulo; // variables que no se usan

//Inicializaci\u00f3n
public void setup() {
                                                                                          //Tama\u00f1o canvas
  for (int h = 0; h < 25; h++) {                                                                          
    for (int d = 0; d < 25; d++) {
      int total = h + d * 25;
      float hx = h * 15;
      float dy = d * 15;
      g[total] = new Gabi(hx, dy, hx + 5, dy + 5, (int) random(-2, 2), (int) random(-2, 2), total);
      println(total); //vestigio de ejercicios en clase
    }
  }
}

//Corre el programa
public void draw() {
  background(255);
  translate(width * .15f, height * .15f);
  for (int j = 0; j < g.length; j++) {
    // g[j].dibujo(); //toda esta funci\u00f3n no existe en el canvas
    g[j].linea(angulo); // par\u00e1metro que no se usa
    g[j].contra();
    g[j].mover();
    g[j].bordes();
  }
}
//Crea clase Gabi
class Gabi {
  boolean on;
  float x, y, x1, y1, velx, vely, angulo;
  float ang = 95;
// Conecci\u00f3n entre las variables del c\u00f3digo principal s10c01gabi con las de la clase Gabi
  Gabi (float x, float y, float x1, float y1, float velx, float vely, float angulo) {
    this.x = x;
    this.y = y;
    this.x1 = x1;
    this.y1 = y1;
    //Velocidad con la que se mover\u00e1n
    this.velx = velx * 2;
    this.vely = vely * 2;
    // this.angulo = angulo;
    angulo = 0.08f;
  }

  public void dibujo() {
    pushMatrix();
    noStroke();
    //Color Turqueza
    fill(97, 209, 206);  
    // ellipse(x, y, 4, 4); // si no se va a mostrar, no se escribe
    popMatrix();
  }

//Crean las figuras 
  public void linea(float angulo) { // este argumento no se usa nunca
    pushMatrix();
    translate(x, y);
    rotate(ang);
    stroke(120);
    line(0, 0, 10, 10);
    popMatrix();
  }

  //cambiar estados del boolean
  public void contra() {
    if (frameCount % 150 == 0) {
      on = !on;
    }

    if (on == true) {
      pushMatrix();
      translate(x + 15, y + 15);
      rotate(angulo - 180);
      stroke(120);
      line(0, 0, 10, 10);
      noStroke();
      fill(97, 209, 206);

      popMatrix();
    } else if (on == false) {
        pushMatrix();
        translate(x - 15, y - 15);
        rotate(angulo);
        stroke(120);
        strokeWeight(1.5f);
        fill(97, 209, 206);
        rect(10, 10, 20, 20);
        popMatrix();
    } 
  }
  
  // Genera movimiento
  public void mover() {
    x += velx;
    y += vely;
    // angulo = 0.08; // esta variable si es est\u00e1tica para todo el programa, debe ser inicializada en el Constructor
  }

// Grilla en el canvas
  public void bordes() {
    if (x > x1 || x < x1 - 50) {
      velx *= -1;
    }
    if (y > y1 || y < y1 - 50) {
      vely *= -1;
    }
  }
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "s10c01gabi" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
