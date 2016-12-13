//Expresión Digital II - Diseño Digital - UDD - 2016
// M. Elena Errázuriz
//s03c00elenaerrazuriz00

/* Este código presenta una grilla de 40 x 40, donde cada posición es ocupada
 aleatoriamente por cuadrados con otro cuadrado dentro, por un espiral cerrado o
 un espacio vacío. Los cinco colores elegidos tambíen son usados aleatoriamente.*/

//Variables globales
import processing.pdf.*;                                         //variable para transformar a PDF el documento 

 
  
color [] colarray = {                                          //Array o biblioteca de los colores usados, para llamarlos después 
  color(21, 84, 92),                                             //Naranjo
  color(5, 76, 91),                                              //Sandía 
  color(334, 81, 62),                                            //Fucsia 
  color(293, 41, 42),                                            //Morado
  color(170, 74, 54)                                             //Sea green
  };



int update = 40;                                                 //Variable para el update dentro del for, la suma de cuanto en cuanto para la grilla

void setup() {
  size(800, 1000);                                               //Tamaño del canvas o mesa de trabajo
  colorMode(HSB, 360, 100, 100);                                 //Modo de color del documento, para poder imprimirlo
  background(360);                                              //Fondo blanco
 
  
}

/*Función que determina todo lo que se va a mostrar
gráficamente, ya sean las figuras o cómo van dispuestas.*/
void draw() {
  
  beginRecord(PDF, "folder/s04c01elenaerrazuriz_###.pdf");
  

  for (int x = 0; x <= width; x += update) { 
    for (int y = 0; y <= height; y += update) {                 //Dos for juntos dan las coordenadas de x e y en un plano cartesiano para determinar el tamaño de la grilla.
      float e = random(2);                                      //Random de posición entre rangos de 0 a 2
      if (e > 1) {                                              //Determinar lo que va a pasar entre 0 y 1
/*Todo lo escrito dentro de estos corchetes
está atado a la condición anterior*/
        noFill();                                               //Figuras sin relleno                                             
        strokeWeight(2);                                        //Bordes de 2 pixeles de grosor.
        stroke( colarray [(int)random(5)]);                  //Color de bordes pintados aleatoriamente con los colores previamente seleccionados
        rect(x, y, 34, 34);                                     //Rectángulo inicial de 34 x 34 pixeles                          
        line(x - 4, y + 9, x + 16, y + 9);                      //línea horizontal conectada al lado derecho del cuadrado
        line(x - 4, y + 9, x - 4, y - 8);                       //Línea vertical originada de la anterior
        line(x - 4, y - 8, x + 10, y - 8);                      //Línea horizontal originada de la anterior vertical
        line(x + 10, y - 8, x + 10, y + 3);                     //Línea vertical 
        line(x + 10, y + 3, x - 12, y + 3);                     //Línea horizontal final, interior del espiral
        line(x - 12, y + 3, x - 12, y - 16);                    //Línea vertical hacia arriba, hasta llegar al borde superior del cuadrado
      } else {                                                  //Indicador que todo lo que no fue abarcado por la condición anterior puede tener otra acción.
        drawTarget(x + 40, y + 2, 25, 2);                           //Función que ocurre, el resultado visible
      }  
    }
  }
  
  noLoop();                                                     //Dejar la composición quieta en un fotograma de tiempo
  endRecord();
}

/*Función para crear figuras proporcionales, que nazcan
del centro de la más grande y vayan decreciendo regularmente*/

/*
Esta función tiene el mismo nombre y los mismos parámetros
que la descrita en la referencia de Processing,
con leves cambios de color y función de dibujo. 
Esto pone en duda el conocimiento de lo que está dibujando.
Además de un error de entrega al utilizar contenido que no ha 
sido enseñado.
*/
void drawTarget(float xloc, float yloc, int size, int num) {    //Definir comportamiento de cada coordenada dentro de los índices para cada figura

  float steps = size / num;                                       //Definir la misma variable para el porte y la cantidad de figuras dentro de una
  for (int i = 0; i < num; i++) {                               //De cuando en cuando ya a avanzar una variable
  
// Este array debe ser global y solo llamado al uso.
    color [] color2 = {                                              //Array o biblioteca de los colores usados, para llamarlos después 
      color(21, 84, 92, 80),                                         //Naranjo, más opacidad
      color(5, 76, 91, 80),                                          //Sandía, más opacidad
      color(334, 81, 62, 80),                                        //Fucsia, más opacidad
      color(293, 41, 42, 80),                                        //Morado, más opacidad
      color(170, 74, 54, 80)                                         //Sea green, más opacidad
    };

    noStroke();                                                 //Figuras sin bordes
    fill(color2 [(int)random(5)]);                           //Color de relleno pintado aleatoriamente con los colores previamente seleccionados
    rectMode(CENTER);                                           //Definir que las figuras nacen del centro
    rect(xloc, yloc, size - i * steps, size - i * steps);           //La ecuación para determinar el comportamiento de la función
  }
}

/*Determinar funciones de teclado, asignar
una tecla del computador para alguna acción
determinada. Todo lo que ocurre aquí afecta al void draw*/
void keyPressed() {      

  if (key == 'a') {                                             //Si la tecla 'a' es apretada en el computador
    redraw();                                                   //La composición se vuelve a dibujar en un nuevo orden
  } else if (key == 's') {                                      //Si la tecla 's' es apretada
    exit();                                                     //Salir programa
  } else if (key == 't') {
    saveFrame("fils/fotos_##.pdf");
  }
}