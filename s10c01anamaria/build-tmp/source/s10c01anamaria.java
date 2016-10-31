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

public class s10c01anamaria extends PApplet {

//Expresi\u00f3n Digital II - Dise\u00f1o Digital - UDD - 2016
// Ana Mar\u00eda Ortiz
//s10c01anamaria

/* En primer lugar aparecer\u00e1n flechas que van cambiando de color entre amarillo y gris mientras se 
 mueven en su direcci\u00f3n, al llegar a la esquina, se cambiar\u00e1 la imagen y se ver\u00e1n rombos en constante
 movimiento con una l\u00ednea en su interior que gira, al volver nuevamente a las flechas, ellas estar\u00e1n 
 nuevamente en el centro.*/


Objeto[] e = new Objeto [144];      //nueva clase con 144 objetos rombo
Objeto[] ob = new Objeto [256];      //nueva clase con 256 objetos flecha
boolean b;      //declaraci\u00f3n objeto
public void setup() {
        //tama\u00f1o del canvas
  colorMode(HSB, 360, 100, 100);      //modo de color

  //for para rombo
  for (int i = 0; i < 12; i++) {      //creaci\u00f3n de 12 objetos
    for (int j = 0; j < 12; j++) {      //creaci\u00f3n de 12 objetos
      int total = j + i * 12;
      float ix = i * 45;      //45 px de distancia entre los elementos
      float jy = j * 45;      //45 px de distancia entre los elementos
      e[total] = new Objeto(ix, jy, ix + 5, jy + 5, (int)random(-2, 2), (int)random(-2, 2), total);
    }
  }

  //for para flecha
  for (int i = 0; i < 16; i++) {      //creaci\u00f3n de 16 objetos
    for (int j = 0; j < 16; j++) {      //creaci\u00f3n de 16 objetos
      int total = j + i * 16;
      float ix = i * 34;      //34 px de distancia entre los elementos
      float jy = j * 34;      //34 px de distancia entre los elementos
      ob[total] = new Objeto(ix, jy, ix + 5, jy + 5, (int)random(-2, 2), (int)random(-2, 2), total);
    }
  }
}

public void draw() {
  background(314, 1, 94);      //color background
  translate(width / 15, height / 15);      //posici\u00f3n de la composici\u00f3n
  if (frameCount % 30 == 0) {      //tiempo
    b = !b;      //boolean
  }

  //Se dibuja la primera funci\u00f3n
  if (b == true) {
    // pushMatrix();      //cambiar el estado de las coordenadas  
    translate(width / 1000, height / 1000);      //posici\u00f3n de los objetos
    for (int i = 0; i < e.length; i++) {      //si i es menor que el ancho, se suma 1 y se dibujan las funciones 
      e[i].dibujarRombo();      //se dibuja el rombo
      e[i].dibujarLinea();      //se dibuja la l\u00ednea
      e[i].mover();      //se cumple la funci\u00f3n mover
      e[i].bordes();      //se cumple la funci\u00f3n bordes
    }
    // popMatrix();      //volver al estado original de las coordenadas
  }

  //Se dibuja la segunda funci\u00f3n
  if (b == false) {
    // pushMatrix();      //cambiar el estado de las coordenadas   
    for (int i = 0; i < ob.length; i++) {      //si i es menor que el ancho, se suma 1 y se dibujan las funciones 
      ob[i].dibujarFlecha();      //se dibuja la flecha
    }
    // popMatrix();      //volver al estado original de las coordenadas
  }
}
class Objeto {      //se crea la clase
  int a;      //se crean las variables enteras
  float x, y, i, tx, ty, velx, vely, angulo, xr, yr;      //se crean las variables
  int[] c1 = new int [2];
  int ao, gc, go, t;      //declaraci\u00f3n de colores

  //inicializar las variables
  Objeto (float x, float y, float tx, float ty, float velx, float vely, float angulo) {
    this.x = x;
    this.y = y;
    this.tx = tx;
    this.ty = ty;
    this.velx = velx * 0.2f; //velocidad para que se muevan
    this.vely = vely * 1;
    this.angulo = angulo;
    // this.ao = color(57, 98, 83);      //amarillo oscuro
    this.gc = color(314, 1, 94);      //gris claro
    // this.go = color(49, 4, 54);      //gris oscuro
    c1[0] = color(57, 98, 83); // igual al ao
    c1[1] = color(49, 4, 54); // igual al go
    xr = 32;      //x del rombo
    yr = 32;      //y del rombo
  }

  public void dibujarRombo() {
    pushMatrix();      //cambiar el estado de las coordenadas
    noFill();      //sin relleno
    strokeWeight(3);      //grosor de la l\u00ednea 
    stroke(c1[1]);      //color gris oscuro

    quad(x + xr / 2, y, x + xr, y + yr / 2, x + xr / 2, y + yr, x, y + yr / 2);      //se dibuja el rombo
    popMatrix();      //volver al estado original de las coordenadas
  }

  public void dibujarLinea() {
    pushMatrix();      //cambiar el estado de las coordenadas
    translate(x + 16, y + 16);      //posici\u00f3n
    angulo += 0.04f;      //rotaci\u00f3n
    rotate(angulo);      //rotaci\u00f3n
    strokeWeight(3);      //grosor de la l\u00ednea
    stroke(c1[0]);      //color l\u00ednea amarillo oscuro

    line(-3, 3, 3, -3);      //se dibuja la l\u00ednea
    popMatrix();      //volver al estado original de las coordenadas
  }

  //movimiento de la l\u00ednea
  public void movimiento() {      
    a = 1;
    a++;
  }

  public void dibujarFlecha() {
    pushMatrix();      //cambiar el estado de las coordenadas   
    if (a >= frameCount % 30) {      //velocidad de cambio de color
      a = 1;
    }
    a++;
    t = c1[(int) random(2)];      //array para cambio de color
    // frameRate(10);      //tiempo para cambio de color - el uso de esta funci\u00f3n modifica todo el programa, debe ir en setup o no ir
    strokeWeight(2);      //ancho de la l\u00ednea
    stroke(t);       //color de la l\u00ednea

    line(x - 10 + a, y - 10 + a, x + 5 + a, y + 5 + a);      //se dibuja la l\u00ednea
    fill(t);      //color relleno tri\u00e1ngulo
    triangle(x + 10 + a, y + a, x + 10 + a, y + 10 + a, x + a, y + 10 + a);      //se dibuja el tri\u00e1ngulo
    popMatrix();      //volver al estado original de las coordenadas
  }

  //funci\u00f3n velocidad de movimiento
  public void mover() {
    // pushMatrix();      //cambiar el estado de las coordenadas   
    x += velx;
    y += vely;
    // popMatrix();      //volver al estado original de las coordenadas
  }

  //funci\u00f3n grilla de movimiento
  public void bordes() {
    // pushMatrix();      //cambiar el estado de las coordenadas   
    if (x > tx || x < tx - 20) {
      velx *= -1;
    }
    if (y > ty || y < ty - 1) {
      vely *= -1;
    }
    // popMatrix();      //volver al estado original de las coordenadas
  }
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "s10c01anamaria" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
