// Expresión Digital II - Diseño Digital - UDD - 2016
// Dante Crovetto
// s04c00Dante00
// POSTER
/*
Una vez que corre el programa se dibujarán una serie de figuras (elipses, líneas y triángulos) que forman un patrón que consta de un fondo color violeta claro, 
 sobre este hay una serie de triángulos de color rosado oscuro con líneas de un color rosado claro. Estos forman figuras similares a las de un copo de nieve en el contorno de cada módulo.
 En el centro de cada módulo hay un círculo de color rosado oscuro que tendrán un tamañao diferente cada vez, que puede ir entre 0 px y 40 px y tendrán un contorno color rosado claro. 
 Si los círculos son menores a 15 px y mayores a 35 px los círculos no se dibujarán. Si los círculos son menores a 5px o mayores a 35px  el grosor de la línea del contorno será de 3 px.
 Sobre cada módulo, además se dibujará una cruz en el centro de la figura del tamaño de cada módulo con un grosor de 0.3px de color rosado.
 Si se presiona la letra "s", se guardará la imagen en formato pdf con nombre "s04c00dante(número de imagen).pdf" dentro de la carpeta frames la cual está contenida dentro de la carpeta del archivo.
 En la parte superior e inferior se formarán márgenes
 */
import processing.pdf.*;
void setup() {          //  Función que se ejecuta al principio una sola vez

  size(600,750);         // Se crea un canvas de medidas 600x750 px - era otro valor
  background(#FFFFFF);    //Se pone un fondo de color blanco
  // Esto no se cumple NUNCA, al tener `no loop()` la función frameRate queda inválida. 
  frameRate(3);         //Se dibuja medio cuadro por cada segundo - se dibujan 3 cuadros por cada segundo
  colorMode(HSB, 360, 100, 100);  //los colores a utilizar serán con el modo HSB
}
void draw() {        // función que dibuja, y se repite solamente si es que se presiona la tecla r
  beginRecord(PDF, "image/s04c00Dante.pdf"); // se empieza a guardar un pdf con lo que sigue

  for (int x = 0; x < width; x += 120) { //mientras la nueva variable x sea menor que el ancho, se ejecutará el código de abajo e irá sumando 120 a x cada vez.
    for (int y = 15; y < height; y += 120) { //mientras la nueva variable y sea menor que el ancho, se ejecutará el código de abajo e irá sumando 120 a y cada vez.
      fill(270, 12, 99);   //el color de relleno desde ahora será violeta claro.
      strokeWeight(1);  //el grosor de línea será 1
      stroke(330, 45, 99);  //el color de línea será rosado claro
      rect(x, y, x + 120, y + 120); //se dubuja un cuadrado con el origen en la esquina superior izquierda, de tamaño 120 px, que será el tamaño de los módulos.

      fill(323, 49, 77);  //el color de relleno desde ahora será rosado oscuro

      /*                           
       Los triángulos que se dibujarán a continuación (4 triángulos), irán en la parte superior de cada módulo, dibujándose de izquierda a derecha. Cada triángulo será de igual tamaño y mirarán hacia abajo (10 px)  
       */
      triangle(x, y, x + 30, y, x + 15, y + 10);
      triangle(x + 30, y, x + 60, y, x + 45, y + 10);
      triangle(x + 60, y, x + 90, y, x + 75, y + 10);
      triangle(x + 90, y, x + 120, y, x + 105, y + 10);

      /*                           
       Los triángulos que se dibujarán a continuación (4 triángulos), irán en el costado izquierdo de cada módulo, dibujándose de arriba hacia abajo. Cada triángulo será de igual tamaño y mirarán hacia la derecha (10 px)  
       */
      triangle(x, y, x, y + 30, x + 10, y + 15);// triángulos de la izquierda
      triangle(x, y + 30, x + 10, y + 45, x, y + 60);
      triangle(x, y + 60, x + 10, y + 75, x, y + 90);
      triangle(x, y + 90, x + 10, y + 105, x, y + 120);

      /*                           
       Los triángulos que se dibujarán a continuación (4 triángulos), irán en la parte inferior de cada módulo, dibujándose de izquierda a derecha. Cada triángulo será de igual tamaño y mirarán hacia arriba (10 px)  
       */
      triangle(x, y + 120, x + 15, y + 110, x + 30, y + 120);
      triangle(x + 30, y + 120, x + 45, y + 110, x + 60, y + 120);
      triangle(x + 60, y + 120, x + 75, y + 110, x + 90, y + 120);
      triangle(x + 90, y + 120, x + 105, y + 110, x + 120, y + 120);

      /*                           
       Los triángulos que se dibujarán a continuación (4 triángulos), irán en el costado derecho de cada módulo, dibujándose de arriba hacia abajo. Cada triángulo será de igual tamaño y mirarán hacia la izquierda (10 px)  
       */
      triangle(x + 120, y + 0, x + 120, y + 30, x + 110, y + 15);
      triangle(x + 120, y + 30, x + 120, y + 60, x + 110, y + 45);
      triangle(x + 120, y + 60, x + 120, y + 90, x + 110, y + 75);
      triangle(x + 120, y + 90, x + 120, y + 120, x + 110, y + 105);

      /*                           
       Los rombos que se dibujarán a continuación (2 triángulos), irán en el costado derecho, en el centro del módulo en el eje vertical. Cada triángulo será de igual tamaño, y uno mirará hacia arriba y otro hacia abajo  
       */
      triangle(x + 90, y + 60, x + 120, y + 60, x + 105, y + 70);
      triangle(x + 90, y + 60, x + 105, y + 50, x + 120, y + 60);

      /*                           
       Los rombos que se dibujarán a continuación (2 triángulos), irán en el costado izquierdo, en el centro del módulo en el eje vertical. Cada triángulo será de igual tamaño, y uno mirará hacia arriba y otro hacia abajo  
       */
      triangle(x, y + 60, x + 30, y + 60, x + 15, y + 70);
      triangle(x, y + 60, x + 15, y + 50, x + 30, y + 60);

      /*                           
       Los rombos que se dibujarán a continuación (2 triángulos), irán en el costado inferior, en el centro del módulo en el eje horizontal. Cada triángulo será de igual tamaño, y uno mirará hacia la izquierda y otro hacia la derecha 
       */
      triangle(x + 60, y + 90, x + 70, y + 105, x + 60, y + 120);
      triangle(x + 60, y + 90, x + 60, y + 120, x + 50, y + 105);

      /*                           
       Los rombos que se dibujarán a continuación (2 triángulos), irán en el costado superior, en el centro del módulo en el eje horizontal. Cada triángulo será de igual tamaño, y uno mirará hacia la izquierda y otro hacia la derecha 
       */
      triangle(x + 60, y, x + 60, y + 30, x + 70, y + 15);
      triangle(x + 60, y + 0, x + 60, y + 30, x + 50, y + 15);

      strokeWeight(0.3);  //el grosor de línea desde ahora será de 0.3px
      line(x, y, x + 120, y + 120);   //se dibujará un línea diagonal desde la esquina superior izquierda a la inferior derecha del módulo
      line(x, y + 120, x + 120, y);   //se dibujará un línea diagonal desde la esquina superior derecha a la inferior izquierda del módulo
      
      // Declarar e inicializar una variable antes de ser usada es lo correcto en una buena práctica.
      float r = random(40);  //se crea la variable "r" que es igual a un random decimal que puede ir entre 0 y 40.
      // Esta condición no se cumple nunca, porque para que sea verdadera, r tendría que ir entre 14 y dar la vuelta hacia todos los números negativos y llegar al 26
      if (r < 15 && r > 25) {   //si es que la variable r es menor a 15 ó es mayor a 25 se ejecutará lo siguiente - La condicional && es de 'y'
        noFill();//desde ahora las figuras no tendrán relleno
        noStroke(); // desde ahora no se dibujarán las líneas
        ellipse(x + 60, y + 60, r, r); // se dibuja una elipse en el centro de la figura con diámetro igual al valor asignado por el random dentro de la variable r
      } else if (r > 5 && r < 35) {   // si no se cumple la condición anterior, y r es mayor que 5 ó r es menor que 35 que se ejecute lo siguiente - La condicional && es de 'y'
        strokeWeight(3); //el grosor de línea será de 3px
      } else { //si no ocurre ninguna de las condiciones anteriores que ocurra lo siguiente
        fill(323, 49, 77); // el relleno de las figuras desde ahora será rosado oscuro
      }
      ellipse(x + 60, y + 60, r, r); // se dibuja una elipse en el centro de la figura con diámetro igual al valor asignado por el random dentro de la variable r
    }
  }
  rect(0, 0, width, 15);
  rect(0, height-15, width, height);
  noLoop(); //la función void draw no se reiniciará cada vez que termine el código a menos que se presione la tecla "r"
  endRecord(); // se deja de guardar
}


void keyPressed() {  // se crea la función keyPressed
  if (key == 'e') { // si se presiona la tecla e ocurrirá lo siguiente
    exit();    // salir
  } else if (key == 'r') { // si la condición anterior no se cumple y se presiona la tecla "r", se volverá a ejecutar la función void draw
    redraw(); // se volverá a ejecutar la función void draw
  }
    if(key == 's') {  //si es que se presiona la letra s que ocurra lo siguiente
    saveFrame("image_tiff/s04c00danteTiff###.pdf");
    }  //guarda el frame como tiff
}