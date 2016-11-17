// Expresión Digital - Diseño Digital - UDD - 2016
// Dante Crovetto
// s02t01Dante

/*
Se dibujarán Rombos en un canvas de 100x100 pixeles, que podrán ser blancos, negros, amarillos o rojos en una cuadrícula de 10x8. El resto de los triángulos exteriores al rombo tendrán el mismo color de fomra vertical.
Por otro lado se dibujará una cuadícula que tendrá una separación de 50 px en el eje vertical y horizontal hasta completar el tamaño del canvas general. Y se dibujará el contorno de cada rombo de color negro a menos que el rombo sea blanco, 
en ese caso las líneas serán de color blanco.
 */


void setup() {          //  Función que se ejecuta al principio una sola vez

  size(1000, 800);         // Se crea un canvas de medidas 1000x800
  background (#FFFFFF);    //Se pone un fonde de color blanco
  frameRate(0.5);         //Se dibuja medio cuadro por cada segundo
}

void draw() {             //  Función que se ejecuta infinitas veces mientras el programa funciona
  strokeWeight(1);        //grosor de linea 1px
  
  int[] Color = { #FFFFFF, #000000, #FFFF00, #FF0000 };     //se crea un arreglo (librería) de nombre Color que contiene 4 colores, blanco, negro, amarillo y rojo
  int[] Color2 = { #FFFF00, #FF0000, #FFFFFF, #000000 };    //se crea un arreglo (librería) de nombre Color2 que contiene 4 colores, blanco, negro, amarillo y rojo



  for (int i = 0; i < 1000; i += 100) {      //minetras la nueva variable i sea menor que 1000, se ejecutará el código de abajo e irá sumando 100 cada vez.
  
    int k= Color[(int) random(4)];           //se crea una variable k que puede ser igual a cualquiera de los cuatro colores que contiene el array Color y se ejecutará cada vez que i sea menor que 1000
    int l= Color2[(int) random(4)];          //se crea una variable l que puede ser igual a cualquiera de los cuatro colores que contiene el array Color2 y se ejecutará cada vez que l sea menor que 1000

    while (l==k) {                        //Mientras la variable l sea igual a la variable k que ocurra lo que sigue.
      l= Color2[(int) random(4)];         // la variable l es igual a cualquiera de los cuatro colores que contiene el array Color2, se ejecutará tantas veces como sea necesario hasta que el color de la variable l sea diferente al del color de la variable k
    }

    for (int j = 0; j < 800; j += 100) {  //minetras la nueva variable j sea menor que 1000, se ejecutará el código de abajo e irá sumando 100 cada vez.

      stroke(#000000);            //el color de la línea será negro
      fill(k);                    //el color de relleno de los objetos es igual al color que contenga actualmente la variable k
      triangle(i, j, i+50, j, i, j+50);                    //Se dibuja un triángulo rectángulo en la parte superior izquierda 
      triangle(i+50, j, i+100, j, i+100, j+50);            // Se dibuja un triángulo rectángulo en la parte superior derecha
      triangle(i, j+50, i, j+100, i+50, j+100);            // Se dibuja un triángulo rectángulo en la parte inferior izquierda 
      triangle(i+50, j+100, i+100, j+50, i+100, j+100);    // Se dibuja un triángulo rectángulo en la parte inferior derecha

      if (l==#000000) {                    //si es que la variable l es de color negro que se ejecute lo siguiente
        stroke(#FFFFFF);                   //el color de línea será blanco
      } else {                             //si no es de color negro la variable l, que se ejecute lo siguiente
        stroke(#000000);                   //el color de línea sera negro
      }

      fill(l);      //el color de relleno de los objetos es igual al color que contenga actualmente la variable l
      
      triangle(i, j+50, i+50, j, i+50, j+50);           //Se dibuja un triángulo rectángulo, donde su ángulo recto se encuentra ubicado en el centro de la figura dibujándose hacia abajo a la derecha
      triangle(i+50, j, i+50, j+50, i+100, j+50);       //Se dibuja un triángulo rectángulo, donde su ángulo recto se encuentra ubicado en el centro de la figura dibujándose hacia abajo a la izquierda
      triangle(i, j+50, i+50, j+50, i+50, j+100);       //Se dibuja un triángulo rectángulo, donde su ángulo recto se encuentra ubicado en el centro de la figura dibujándose hacia arriba a la derecha
      triangle(i+50, j+50, i+100, j+50, i+50, j+100);   //Se dibuja un triángulo rectángulo, donde su ángulo recto se encuentra ubicado en el centro de la figura dibujándose hacia arriba a la izquierda
    }
  }
}