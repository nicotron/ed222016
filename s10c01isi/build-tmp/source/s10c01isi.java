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

public class s10c01isi extends PApplet {

//Expreci\u00f3n digital - Dise\u00f1o Digital - UDD- 2016
//Isidora Ordo\u00f1ez
//s10c01isi.

/*
En este c\u00f3digo se llamar\u00e1n distintos voids de manera aut\u00f3noma a trav\u00e9s de un boolean y 
un frameCount.
Los voids ser\u00e1n de figuras y movimientos, y a trav\u00e9s de lo aprendido se lograr\u00e1 generar
distintas composiciones con movimiento.
El primer void es el de "elipses", que est\u00e1n dispuestas en la grilla de una forma
circular, generando en primer lugar un m\u00f3dulo de 14 elipses, y este repiti\u00e9ndolo 10 veces
rotandolo con el centro del canvas como eje. Este modulo cambia su disposici\u00f3n en el eje
'x' e 'y' lo que hace que las secuencias de elipses descritas se acerquen y alejen del
centro del canvas.
Por otra parte tenemos el void de transici\u00f3n que hace que la funci\u00f3n descrita 
anteriormente rote sobre su eje 'y' cambiando el valor de 'x' de la funci\u00f3n.
Por \u00faltimo tenemos el void display que crea una composici\u00f3n de tri\u00e1ngulos que rotan sobre
su propio eje gracias a la funci\u00f3n rotate y sobre el eje central de la composici\u00f3n 
gracias a translate cambiando el punto 0,0 del canvas lo que hace que giren y a la vez
se alejen y acerquen.
 */

// NIVEL 2: Pero no hay grilla, s\u00ed hay 3 movimivientos del nivel y 3 figuras del nivel 3
// NIVEL 2:

Objeto [] o = new Objeto [1]; //es solo un objeto.                                                         // Creo "Objeto".
boolean evalDivision;

// Inicializaci\u00f3n:
public void setup() {

  
  for (int i = 0; i < o.length; i ++) {                
    o[i] = new Objeto(); // no hay par\u00e1metros en el constructor hacia la clase                                                               // Inicializo "Objeto".
  }
  
  evalDivision = true;  
}

// Corre programa:
public void draw() {
  
  background(0);                                                   
  translate(height / 2, width / 2);                                                   //Posiciona composici\u00f3n en el centro del canvas. 
  
  for (int i = 0; i < o.length; i++) {
    
// Cambiar estados de el boolean:
    if (frameCount % 200 == 0) {
      evalDivision = !evalDivision;
    }
// Dibujar primeras funciones:    
    if (evalDivision) {
      o[i].movimiento("elipse");
      o[i].transicion();
    }
// Dibujar segunda funci\u00f3n: 
    else { 
      o[i].movimiento("cuadrado"); 
    }
// Dibujar funciones que siempre est\u00e1n:    
    o[i].display();    
  }
}
class Objeto {
// Creo variables:
  float x, x1, x2, x3, y, y1, y2, y3;                                                           // Variables de posici\u00f3n.       
  int tam, amp;                                                                                 // Variable de tama\u00f1o.
  int xe, ye, incremento;                                                                       // Variables de cambio.

//Inicializo variables:
  Objeto() {
    
    x1 = 40;
    x2 = 40;
    x3 = 60;
    y1 = 40;
    y2 = 120;
    y3 = 0;
    
    tam = 10;
    amp = 90;
    
    xe  = 200; 
    ye  = 200;
    incremento = 1;
    
  }

//Void que se usar\u00e1 para hacer girar un void sobre el eje x:
  public void transicion() {
    
    println(xe);

    if (xe >= 200) {
      incremento = -1;
    }                                                             // Al llegar a 200 xe comienza a restar.
    if (xe <= 0) {
      incremento = 1;                                                              // Al llegar a 0 xe comienza a sumar.
    }
    xe += incremento;
  }

// Void que crear\u00e1 las figuras y les dar\u00e1 posici\u00f3n:
  public void movimiento (String tipoMovimiento) {

 // Posici\u00f3n de figuras:
    // for (int o = 0; o < 360; o += 36) {                                
      // for (int q = 0; q < 140; q += 10) {                              
        int o = 10;
        int q = 4;
          //posici\u00f3n inicial * amplitud + ubicaci\u00f3n en el eje * rotaci\u00f3n
        x = sin(radians(o)) * amp + sin(radians (o + q - frameCount)) * xe;                   // F\u00f3rmula que me da posici\u00f3n de cada figura y amplitud y posici\u00f3n del m\u00f3dulo total en el eje x.      
        y = cos(radians(o)) * amp + cos(radians (o + q - frameCount)) * ye;                   // F\u00f3rmula que me da posici\u00f3n de cada figura y amplitud y posici\u00f3n del m\u00f3dulo total en el eje y.   
        
 // Caracter\u00edsticas de las figuras:        
        noStroke();                                                  
        fill(map(q, 0, 140, 255, 0), 255, 255);                      

 // Tipos de figuras:
        if (tipoMovimiento == "elipse"){                                                        // Si escribo "elipse" entre par\u00e9ntesis luego de "tipoMovimiento" me dibuja lo siguiente:
          ellipse(x, y, tam, tam);
        }
        if (tipoMovimiento == "cuadrado"){                                                      // Si escribo "elipse" entre par\u00e9ntesis luego de "tipoMovimiento" me dibuja lo siguiente:
          rect(x, y, tam, tam);
        }
      // }
    // }
  }

// Void que crea una secuencia de tri\u00e1ngulos que giran sobre un eje central y su propio eje:
  public void display() {
    
    // for (int i = 0; i < 360; i+=30) {  
      int i = 10;
      pushMatrix();                                                             

      translate(sin(radians( i + frameCount)) * 100, cos(radians( i + frameCount)) * 100); // Figura rota. 
      rotate(radians(-i));                                                                    // Cada tri\u00e1ngulo gira sobre su eje.                                                       

      fill(map(i, 0, 140, 255, 0), 200, 255);                                      
      triangle(x1, y1, x2, y2, x3, y3);                                          
      popMatrix();
    // }
  }
}
  public void settings() {  size (600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "s10c01isi" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
