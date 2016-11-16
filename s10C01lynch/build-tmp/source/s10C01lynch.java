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

public class s10C01lynch extends PApplet {

//Expresi\u00f3n digital II - Dise\u00f1o Digital - UDD - 2016.
//Ricardo Vidal.
//s10c01lynch.


/*
Este c\u00f3digo genera una grilla en el fondo con "planetas" que tienen otros elementos
o "sat\u00e9lites" que los orbitan, la amplitud de esta \u00f3rbita puede manejarse para que
vaya hacia al centro y luego siga alej\u00e1ndose con las teclas 's' y 'd'.\u00f3rbita sino que cambiar el radio
El c\u00f3digo genera tambien una "nube" de ellipses que rotan alrededor del centro
del canvas, ademas de rotar sobre su propio eje. Hay ellipses de tonos distintos
y en degrad\u00e9 para genera el efecto de sombra. Las ellipses tienden a desordenarse
(entrop\u00eda) siempre, pero este desorden se puede controlar y revertir presionando
la tecla 'a'.
*/
Dot[] d = new Dot[225];  // Clase Dot, nubes rosadas.
Plan[] p = new Plan[81]; // Clase Plan, ellipse orbitando el fondo.
float chng = 0.5f;
boolean spire = false;
boolean sett = false; // Booleans para control de eventos.

public void setup() {
  
  rectMode(CENTER);
  
  
  for (int i = 0; i < 15; i++) { // Inicializadores de objetos de clases.
    for (int j = 0; j < 15; j++) {
      int total = j + i * 15;
      float x = i * 20;
      float y = j * 20;
      d[total] = new Dot(x, y, 
        (int)random(-30, 30), (int)random(-30, 10), 
        (int)random(1, 11), (int)random(-1, 1));
    }
  }

  for (int i = 0; i < 9; i++) {  // Inicializadores de objetos de clases.
    for (int j = 0; j < 9; j++) {
      int total = j + i * 9;
      float px = i * 30;
      float py = j * 30;
      float cc = i * 22;
      float posX = width / 8 * i;
      float posY = height / 8 * j;
      p[total] = new Plan(px, py, cc, posX, posY);
    }
  }
}

public void draw() {
  background(5);
  // Esta condici\u00f3n debe estar dentro de las funciones espec\u00edficas para ello
  // es el objetivo principal de la Programaci\u00f3n Orientada a Objetos, ya que
  // al usar m\u00e1s de una clase, o varias funciones de dibujo diferentes, 
  // podr\u00edamos querer unas que no tengan esta condici\u00f3n.
  noStroke();

  for (int i = 0; i < p.length; i++) {  // Creaci\u00f3n de objetos de clase Plan.
    p[i].displayPlan();
    p[i].movePlan();
    if (sett) {  // Esta l\u00ednea permite congelar la \u00f3rbita de los Plan.
      p[i].spir(); // Ya sabemos que no se puede congelar la \u00f3rbita sino que cambiar el radio
    }
  }
  translate(width * .15f, height * .15f); // Grilla desde el centro para Dot.

  // for (int i = 0; i < d.length; i++) { // Creaci\u00f3n de objetos de clase Dot.
  //   d[i].displayRect();
  //   d[i].move();
  // }
}

public void keyPressed() { // Eventos teclado.
  if (key == 'a') {
    // Esto es mejor que sea escrito dentro de draw, y que 'a' modifique un boolean, as\u00ed la lectura
    // de los comportamientos ser\u00e1 siempre dentro de draw, la estructura principal del programa
    for (int i = 0; i < d.length; i++) {
      d[i].entropy();
    }
  }
  // Estas dos condicionales hacen lo mismo, al restar velY y llegar a 0, sigue hacia el negativo
  // que es lo mismo que sumar velY estando negativo, pasar\u00e1 a 0 y luego a positivo. 
  if (key == 's') {
    spire = !spire;
  }
  if (key == 'd') {
    sett = !sett;
  }
}
class Dot {

  float x, y, tx, ty, vx, vy, angulo, rot, dir;

  Dot (float x, float y, float vx, float vy, float angulo, int dir) {  // Constructor de Dot.
    this.x = x;
    this.y = y;
    this.vx = vx * 0.1f;
    this.vy = vy * 0.1f;
    this.angulo = angulo;
    this.dir = dir;
  }

/*  Mostrar figuras, estas son elipses que giran en su propio eje,
adem\u00e1s de girar en torno a la grilla.
*/

  public void displayRect() {  // Mostrar figuras, estas son elipses que giran en su
    pushMatrix();  
      translate(width / 3, height / 3);
      rotate(dir);
      dir +=.02f;  
      pushMatrix();
        translate(x, y);
        rotate(rot);
        rot += .2f;
        noStroke();
        fill(y / 2, 0, y / 2);
        ellipse(0, 0, angulo * .75f, angulo);
        pushMatrix();
          translate(10, 10);
          fill(70 + (y / 1.1f), 0, 70 + (y / 1.1f));
          ellipse(0, 0, angulo, angulo * .75f);
        popMatrix();
      popMatrix();
    popMatrix();
  }

  public void move() { // Esta funci\u00f3n hace que las elipses roten, y crezcan de acuerdo al valor de angulo. 
    x += vx;
    y += vy;

    angulo += chng;
    if (angulo > 80) {
      chng = -chng;
    }
    if (angulo <10) {
      chng = -chng;
    }
  }

  public void entropy() { // Con esta funci\u00f3n se puede controlar el nivel de desorden de los ellipses.
    vx = -vx;
    vy = -vy;
  }
  
}
class Plan {

  float px, px2, py, py2, cc, posX, posY, a, a2, velX, velY;
  float r = 30;

  Plan(float px, float py, float cc, float posX, float posY) { // Constructor de Plan.
    this.px = px;
    this.py = py;
    this.cc = cc;
    this.posX = posX;
    this.posY = posY;
  }

  public void displayPlan() { // Ac\u00e1 se dibujan los Plan, son varios ellipses de colores distintos.
    px2 = px;
    py2 = py;
    noStroke();
    fill(cc, cc, 100);
    ellipse(px, py, 8, 8);
    fill(100, cc, cc);
    ellipse(px * 2, py * 1.5f, 6, 6);
    fill(cc, 100, cc);
    ellipse(px2 * 1.5f, py2 * 2, 10, 10);
    fill(22, 0, 22);
    ellipse(posX, posY, 22, 22);
  }

  public void movePlan() { // Esta funci\u00f3n mueve los Plan en \u00f3rbitas alrededor del ellipse mas grande.
    velX = .05f;
    velY = .06f;
    px = r * cos(a) + (posX);  
    py = r * sin(a) + (posY); 
    px2 = r * cos(a2) + (posX);  
    py2 = r * sin(a2) + (posY); 
    a += velX; 
    a2 -= velX;
  }

  public void spir() { // Esta funci\u00f3n permite controlar la amplitud de la \u00f3rbita.
    if (spire == true) {
      r += velY;
      println(r);
    } else if (spire == false) {
      r -= velY;
      println(r);
    }
  }
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "s10C01lynch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
