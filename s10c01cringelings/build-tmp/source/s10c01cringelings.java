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

public class s10c01cringelings extends PApplet {

// Expresi\u00f3n Digital II - Dise\u00f1o Digital - Facultad de Dise\u00f1o- Universidad del Desarrollo - 2016
// Catalina Ringeling Selman
// s10c01cringelings

/* Al correr el Programa, se ver\u00e1n figuras que rotan en cierto \u00e1ngulo (c\u00edrculos y l\u00edneas), otras 
 figuras que rotan y van cambiando de forma (rect\u00e1ngulos) y todas las figuras se van moviendo en el canvas.
 Se crea un fondo blanco donde se dibujan dos c\u00edrculos que giran con una linea cada uno y van girando en su 
 propio eje y se van moviendo con respecto al eje x e y. A igual que un rect\u00e1ngulo que se dibuja que va 
 cambiando de forma y tama\u00f1o mediante va girando en su propio eje mientras se mueve en el eje x e y.
 */

int a;              //Se crea una variable entera para usar en uno de los objetos.
int c1, c2, c3;   //Se se\u00f1alan las Variables a usar en los colores
float amt;          //Se se\u00f1ala un valor decimal a usar en los colores
boolean cambio;     //Se crea un boolean llamado cambio.

Catalina[] c = new Catalina[25];  // Se crea la clase Catalina

public void setup() {                            //Se ejecuta al iniciar el programa.
                           //Tama\u00f1o del Canvas
  cambio =  true;                         //Se indica si el boolean es verdadero o falso para cuando se inicie el programa.
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      int total = j + i * 5;
      float ix = i * 5;
      float jy = j * 5;
      c[total] = new Catalina(ix, jy, ix + 5, jy + 5, (int)random(0), (int)random(0), random(0));  //se mencionan las variables j, i, ix y ji
      println(total);
    }
  }
}

public void draw() {                              //Se ejecuta cada vez que se inicia el programa. 
  background(253);                         //Color de fondo - Blanco.
  translate(width * .05f, height * .05f);    //El origen de cada variable se cambia. El alto x .05 y el ancho x .05.
  a++;                                     //El a va aumentando 1 en 1.

/*Cada cierto tiempo, el boolean con nombre cambio, cambia de ser verdadero a ser falso y nuevamente verdadero, as\u00ed sucesivamente. 
En el caso que sea falso, se hacen rect\u00e1ngulos.*/
  if (frameCount % 400 == 0) {  // Se ocupa para cambiar estados del boolean. "Refresca" cada void draw.
    cambio = !cambio;
  }
  for (int i = 0; i < c.length; i++) {
  
  if (cambio == true) {
      c[i].lineaCirculo1();
      c[i].lineaCirculo2();
      c[i].mover();
      c[i].d();
    }   
  if (cambio == false) {
      c[i].rectangulo();
      c[i].mover1();
    }
  }
}
class Catalina {  //Se establece la clase Catalina
  //variables as things
  float x, y, tx, ty, vx, vy, angulo; //Variables en decimal a usar.
  int velx, vely; //Variables enteras a usar.
  
  Catalina (float x, float y, float tx, float ty, float velx, float vely, float angulo) { /*Se escriben los valores de cada variable. 
  Se utiliza this. para referirse a variables de a otra ventana.*/
    //Inicialize the things
    this.x = x;
    this.y = y;
    this.tx = tx;
    this.ty = ty;
    this.velx = 2;
    this.vely = 2;
    this.angulo = angulo;
    c1 = color(0xffCB4040); //Rojo
    c2 = color(0xff406FCB); //Azul

  }

//Se crea los c\u00edrculos m\u00e1s grandes junto a una l\u00ednea. Giran en torno a un angulo y se mueven entre x e y.
  public void lineaCirculo2() {
    pushMatrix();                    //Comienza una acci\u00f3n - Todo lo que suceda dentro de este pushMatrix(); no afectar\u00e1 a otro objeto
    translate(x * 5, y * 5);
    rotate (angulo);
    amt = map(x, 0, width, 0, 8);
    c3 = lerpColor(c1, c2, amt);
    fill(c3);
    ellipse(20, 20, 7, 7);
    stroke(51);
    line(4, 4, 18, 18);
    popMatrix();
  }
//Se crea los c\u00edrculos m\u00e1s peque\u00f1os junto a una l\u00ednea. Giran en torno a un angulo y se mueven entre x e y.
  public void lineaCirculo1() {
    pushMatrix();                  //Comienza una acci\u00f3n - Todo lo que suceda dentro de este pushMatrix(); no afectar\u00e1 a otro objeto
    translate(x * 5, y * 5);
    rotate (-angulo);
    stroke(51);
    line(4, 4, 18, 18);
    amt = map(x, 0, width, 0, 2);
    c3 = lerpColor(c1, c2, amt);
    fill(c3);
    ellipse(20, 20, 5, 5);
    popMatrix();              //Termina una acci\u00f3n
  }
  
// Se crean unos rect\u00e1ngulos que se mueven entre x e y y van cambiando de forma.
  public void rectangulo() {
    pushMatrix();                  //Comienza una acci\u00f3n - Todo lo que suceda dentro de este pushMatrix(); no afectar\u00e1 a otro objeto
    translate(x * 8, y * 8);
    rotate (-angulo);
    amt = map(x, 0, width, 0, 1);
    c3 = lerpColor(c1, c2, amt);
    fill(c3);
    rect(20, 20, 10*sin(a/12)+50, 10*sin(a/15)+50);
    popMatrix();              //Termina una acci\u00f3n
  }

//Se se\u00f1ala el movimiento para x e y que se utiliza con las ellipses y l\u00edneas
  public void mover() {
    x += velx;
    y += -.01f;
    angulo += .05f;
  }

  public void d(){
    if (x > width) {
      velx *= -1;
      x = 0;
    }
  }

////Se se\u00f1ala el movimiento para x e y que se utiliza con los rect\u00e1ngulos.
  public void mover1() {
    x += .09f;
    y += .09f;
    angulo += .02f;
    // a++;
  }
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "s10c01cringelings" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
