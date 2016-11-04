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

public class s10c01elenaerrazuriz extends PApplet {

//Expresi\u00f3n Digital II - Dise\u00f1o Digital - UDD - 2016
// M. Elena Err\u00e1zuriz
//s10c01elenaerrazuriz
// No es autonomono al no generar un ciclo infinito
// NIVEL 2.3
/*
Este c\u00f3digo muestra tres elementos distintos (l\u00edneas, cuadrados y c\u00edrculos), que se trasladan desde sus respectivas grillas
 a las aristas de la composici\u00f3n, transform\u00e1ndolas en el centro. Cada una tiene un movimiento diferente gracias a la traslaci\u00f3n o 
 rotaci\u00f3n de los elementos. Al no haber background, cada fotograma queda plasmado en la pantalla sin ser borrado, formando las
 estelas del movimiento y una composici\u00f3n final/general.
 */

/*
Declaraci\u00f3n de elementos y creaci\u00f3n de los arrays y la cantidad de elementos en uso seg\u00fan el class Elena creado
 */
Elena[] na = new Elena [36];
Elena[] e = new Elena [100];
Elena[] li = new Elena [100]; 
int wtotal;
boolean bo;

/*
Creaci\u00f3n de las grillas para cada array Elena seg\u00fan su necesidad. Se determina su creaci\u00f3n con un doble forLoop y
 la distancia que habr\u00e1 entre cada unidad de la grilla. Aparte, en los mismos valores dentro del array, se podr\u00e1 manipular
 la rotaci\u00f3n, traslaci\u00f3n, direcci\u00f3n, de cada uno.
 Tambi\u00e9n se inicializa el boolean 'bo', en este caso como true.
 */
public void setup() {
   //tama\u00f1o del canvas
  bo = true;

  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 6; j++) {
      int total = j + i * 6;
      // float dx = i * 0; //distancia entre los elementos, separaci\u00f3n de 0px entre cada uno
      // float dy = j * 0; //distancia entre los elementos, separaci\u00f3n de 0px entre cada uno
      na[total] = new Elena(i, j, i, j, random(-4, 4), random(-4, 4), total * 2);
    }
  }

  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      int total = j + i * 10;
      float dx = i * 5; //distancia entre los elementos, separaci\u00f3n de 5px entre cada uno
      float dy = j * 5; //distancia entre los elementos, separaci\u00f3n de 5px entre cada uno
      e[total] = new Elena(dx, dy, dx + 10, dy + 10, random(-2, 2), random(-2, 2), (int)random(-1, 1));
    }
  }

  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      int total = j + i * 10;
      float dx = i * 3; //distancia entre los elementos, separaci\u00f3n de 3px entre cada uno
      float dy = j * 3; //distancia entre los elementos, separaci\u00f3n de 3px entre cada uno
      li[total] = new Elena(dx, dy, dx + 2, dy + 2, random(-2, 2), random(-2, 2), (int)random(-1, 1));
    }
  }
}

/*
Funci\u00f3n que, como dice su nombre, dibuja todo lo que est\u00e9 dentro de ella, es la representaci\u00f3n visual. Se llama a las funciones que est\u00e1n
 dentro del class Elena, con su prefijo adecuado para cada grilla. Estas funciones se encuentran dentro del boolean, que dependiendo si es 
 true o false dibuja algo diferente. A su vez, el boolean es activado por un frameCount, esto quiere decir que cada 1 seg se activa un estado
 del boolean. El resultado final es la intercalaci\u00f3n entre dos composiciones diferentes.
 */

public void draw() {
  if (frameCount % 60 == 0) { //determinar el tiempo entre cada estado.
    bo = !bo; //cuando 'bo' es verdadero, pasa a ser falso una vez que el tiempo determinado previamente se cumple. Crea la intercalaci\u00f3n.
  }

  if (bo) {
    pushMatrix(); //determina el inicio de un espacio de acci\u00f3n en el cual los elementos no son afectados por modificaciones previas y ajenas a las que est\u00e1n dentro 
    translate(width / 2.1f, height / 2.1f); //traslaci\u00f3n de la grilla en su totalidad, con el primer elemento (0, 0) como ancla

    for (int i = 0; i < wtotal; i++) { // se ordena a usar todos los elementos disponibles en los arrays creados
      na[i].circulos(na[i].am); //determinar la variable de color que sa va a usar del class
      na[i].espiralRotar(.3f); //determinar la direcci\u00f3n de rotaci\u00f3n anti-horario
    }

    popMatrix(); //cierre del espacio de acci\u00f3n

    // pushMatrix();
    // translate(width / 2.26, height / 2.1);

  //   for (int i = 0; i < e.length; i++) {
  //     e[i].dibujar((int)random(2, 14));
  //     e[i].mover();
  //     e[i].rotar();
  //   }

  //   popMatrix();
  // } else {

  //   pushMatrix(); 
  //   translate(width / 2.1, height / 2.1); //traslaci\u00f3n de la grilla en su totalidad, con el primer elemento como ancla, no es afectado por la traslaci\u00f3n anterior gracias al push y popMatrix

  //   for (int i = 0; i < na.length; i++) { // se ordena a usar todos los elementos disponibles en los arrays creados
  //     na[i].circulos(na[i].tu); //determinar la variable de color que sa va a usar del class
  //     na[i].espiralRotar(-.3);//determinar la direcci\u00f3n de rotaci\u00f3n horario
  //   }

  //   popMatrix(); 
    
  //   // pushMatrix();
  //   translate(width / 2.1, height / 2.1);

  //   for (int i = 0; i < li.length; i++) {
  //     li[i].linea((int)random(1, 8));
  //     li[i].mover();
  //   }

    // popMatrix();
  }
}


public void keyPressed(){
  wtotal ++;
}
/*
Creaci\u00f3n del class 'Elena', en el cual se escribir\u00e1n todos los elementos necesarios para usar en el void draw y pesta\u00f1a principal del documento, ya sean
 las funciones y declarar/inicializar variables.
 Se inicia con la declaraci\u00f3n de todas las varables necesarias para la construcci\u00f3n de los elementos. 
 */
class Elena {
  float aDes, ra, x, y, tx, ty, velx, vely, angulo, amt, st;
  int mo, am, tu, na;

  /*
Espacio determinado como 'constructor' del c\u00f3digo. En \u00e9l se inicializan las variables, se construyen las funciones y es de donde la pesta\u00f1a
   principal del c\u00f3digo llama a los elementos a ser usados.
   */
  Elena(float x, float y, float tx, float ty, float velx, float vely, float angulo) {
    this.x = x;
    this.y = y;
    this.tx = tx;
    this.ty = ty;
    this.velx = velx * .5f; //velocidad para que se mueva x por 0.5
    this.vely = vely * .5f; //velocidad para que se mueva y por 0.5
    this.angulo = angulo;
    this.ra = 10;
    rectMode(CENTER); //dibujar cuadrados desde el centro
    ellipseMode(CENTER); //dibujar elipses desde el centro
    this.mo = color(156, 78, 133); //par\u00e1metros de color 
    this.am = color(252, 227, 0);
    this.tu = color(45, 204, 211);
    this.na = color(252, 76, 2);
  }

  /*
 Funci\u00f3n que dibuja cuadrados de un tama\u00f1o variable, que se trasladan, rotan sobre s\u00ed mismos y rota la grilla completa en s\u00ed.
   */
  public void dibujar(float t) { //variable a ser definida en el void draw
    rotate(angulo * .01f); //rotar la grilla completa en sentido horario
    pushMatrix();//no dejar que la rotaci\u00f3n anterior afecte a los elementos individualmente.
    translate(x / 2, y / 2);
    rotate(angulo);//rotar cada cuadrado sobre s\u00ed mismo
    fill(mo, (int)random(50, 90));
    noStroke();
    rect(0, 0, t, t);
    popMatrix();
  }

  /*
  Funci\u00f3n que dibuja c\u00edrculos de 5px de di\u00e1metro, que rotan dependiendo de un \u00e1ngulo de desplazamiento y un radio de distancia, que va
   variando, haciendo que se aleje de las coordenadas de inicio o cambie el sentido del giro.
   */
  public void circulos(int co) { //variable a ser definida en el void draw
    fill(co);
    noStroke();
    ellipse(x, y, 5, 5);
    x = ra * cos(aDes);
    y = ra * sin(aDes);
  }

  /*
Funci\u00f3n que dibuja l\u00edneas diagonales, que se trasladan, cambiando su posici\u00f3n, tanto en x como en y. 
   */
  public void linea(float st) { //variable a ser definida en el void draw
    pushMatrix();
    translate(x / 2, y / 2);
    stroke(na, 5);
    strokeWeight(st);
    line(0, 0, 20, -20);
    popMatrix();
  }

  /*
Funci\u00f3n que mueve los elementos de sus posiciones originales en funci\u00f3n a velx y vely, sumando de tanto en tanto.
   */
  public void mover() {
    x += velx;
    y += vely;
  }

  /*
Funci\u00f3n que rota los elementos de sus posiciones originales en funci\u00f3n a un \u00e1ngulo que se va sumando de tanto en tanto, en este caso de .03 en .03.
   */
  public void rotar() {
    angulo += .03f;
  }

  /*
Funci\u00f3n para usar en seno y coseno. Construcci\u00f3n de c\u00f3mo avanza la rotaci\u00f3n en espiral de un elemento.
   */
  public void espiralRotar(float di) {
    aDes -= di; //\u00e1ngulo que avance
    ra += .35f;  //radio, distancia, que se mueve
  }
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "s10c01elenaerrazuriz" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
