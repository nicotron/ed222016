//Expresión Digital - Diseño Digital - UDD - 2016
// M. Elena Errázuriz
//s02t01elenaerrazuriz

/* El código muestra una red, estilo estampado escocés, con una de las redes 
 cambiando entre negro y blanco con un fondo de colores turquesa y sea green*/

//canvas
void setup() {
  size(1024, 768);                  //tamaño del canvas o pantalla
}

void draw() {
  for (int x = 0; x <= width; x += 60) {           //indicar el valor de x, declarar la condición y por último, la acción que ejecutará
    for (int y = 0; y <= height; y += 60) {        //el mismo proceso que el anterior pero para y, al igual que el otro, se va sumando de 60 en 60
                                                   //el inicio de cada figura.
      color a = color(54, 215, 183);               //variable de color turquesa
      color b = color(27, 163, 156);               //variable de color sea green
      float d = random(0, 255);                    //variable de aleatoria de color entre negro y blanco


      fill(b);                                     //determinar el color de relleno de las figuras
      noStroke();                                  //determinar que la figura no tenga líneas
      rect(x*2, y*2, 90, 90);                      //definir la figura como un cuadrado de 90x90 y su posición

      fill(a, 50);                                 //determinar el color de relleno mas la transparencia de la figura
      noStroke();                                  //determinar que la figura no tiene líneas
      rect(x+1, y+1, 90, 90);                      //definir la figura como un cuadrado de 90x90 y su posición

      for (int h = 0; h <= width; h += 130) {      //valor de variable h, su condición para actuar y su acción si se cumple
        for (int i = 0; i <= height; i += 135) {   //valor de variable i, su condición y su acción si se cumple

          strokeWeight(5);                         //grosor de línea de 5 pixeles
          stroke(d);                               //color de la línea, que sería el random de blanco y negro
          line(h, i, h, height);                   //posición inicial de la línea

          strokeWeight(5);                         //grosor de línea de 5 pixeles
          stroke(d);                               //color de la línea, random entre blanco y negro
          line(h, i, width, i);                    //posición inicial de la línea
        }
      }
    }
  }
}