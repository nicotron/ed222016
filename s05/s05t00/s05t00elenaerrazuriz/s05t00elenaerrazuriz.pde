//Expresión Digital - Diseño Digital - UDD - 2016
// M. Elena Errázuriz
//s05t00elenaerrazuriz

/* El código muestra una grilla de 12 x 9, en la cual, en cada intersección de sus x e y se diduja una figura.
Cada elemento de el patrón esta dividido en una función independiente, haciendo posible que se combinen
entre ellos para crear conjuntos nuevos cada vez que se apreta alguna de las teclas determinadas posteriormente.*/
 
int a;                                                        //Declarar variable a, para el tamaño de los cuadrados
boolean cua;                                                  //Declarar globalmente nombre boolean
boolean es;                                                   //Declarar globalmente nombre boolean
boolean ch;                                                   //Declarar globalmente nombre boolean
boolean ch2;                                                  //Declarar globalmente nombre boolean

color tur;                                                    //Declarar variable color turquesa
color sg;                                                     //Declarar variable color sea green

void setup() {

  size(800, 600);                                             //Tamaño del canvas
  rectMode(CENTER);                                           //Determinar que las figuras se dibujen desde el centro del cuadrado
  es = false;                                                 //Boolean comienza las acciones en estado 'falso'
  cua = false;                                                //Boolean comienza las acciones en estado 'falso'                            
  ch = false;                                                 //Boolean comienza las acciones en estado 'falso'
  ch2 = false;                                                //Boolean comienza las acciones en estado 'falso'
  a = 50;                                                     //Valor tamaño cuadrados
  tur = color(54, 215, 183);                                  //Inicializar la variable color que se va a usar: turquesa, por su identidad RGB
  sg = color(27, 163, 156);                                   //Inicializar la variable color que se va a usar: sea green, por su identidad RGB

}


void draw() {

  background(255);                                             //Fondo blanco 

  for (int x = 0; x <= width; x += width/11) {                 //Determinar las 12 columnas en el eje x
    for (int y = 0; y <= height; y += height/8) {              //Determinar las 9 columnas en el eje y

      if (cua == true) {                                       //Si el boolean llamado 'cua', es verdadero
        cGrande(x, y, a, 0);                                   //dibujar cuadrado en función 'cGrande'
      } else {                                                 //si no,
        // cua = false;                                           //el boolean es falso, por lo que no se dibuja
        ellipse(100, 100, 20, 20);
      }

      if (es == true) {                                        //Si el boolean llamado 'es', es verdadero
        espiral(x, y);                                         //dibujar el esperal compuesto por la función 'espiral'
      } else {                                                 //si no,
        es = false;                                            //el boolean es falso, por lo que no se dibuja
      }
      
      if (ch == true) {                                        //Si el boolean llamado 'ch', es verdadero
        cuadrado(x, y, a / 1.5);                               //dibujar cuadrado mediano de la función 'cuadrado'
      } else {                                                 //si no,
        ch = false;                                            //el boolean es falso, por lo que no se dibuja
      }
      
      if (ch2 == true) {                                       //Si el boolean llamado'ch2', es verdadero
        cuadradito(x, y, a / 1.5);                             //dibujar cuadrado chico dterminado por la función 'cuadradito'
      } else {                                                 //si no,
        ch2 = false;                                           //el boolean es falso, por lo que no se dibuja
      }
    }
  }
}

void keyPressed() {

  if (key == 'a') {                                            //Si se apreta la tecla 'a'
    es = !es;                                                  //el estado del boolean se cambia al opuesto del cual se encontraba
  } 
  if (key == 's') {                                            //Si se apreta la tecla 's'
    cua = !cua;                                                //el estado del boolean se cambia al opuesto del cual se encontraba
  }
  if (key == 'd') {                                            //Si se apreta la tecla 'd'
    ch = !ch;                                                  //el estado del boolean se cambia al opuesto del cual se encontraba
  }
  if (key == 'f') {                                            //Si se apreta la tecla 'f'
    ch2 = !ch2;                                                //el estado del boolean se cambia al opuesto del cual se encontraba
  }
}

void espiral(int posX, int posY) {                             //Función de nombre espiral que consta de dos variables

  float linea = map(mouseX, 0, width, 3, 1);                   //función map para el eje x del mouse que controla el grosor de las líneas, que va de 3px a 1px de izquierda a derecha
  stroke(sg);                                                  //color sea green de la línea
  strokeWeight(linea);                                         //grosor de la línea controlado por la función map
  line(posX - 4, posY + 16, posX + 24, posY + 16);             //línea horizontal conectada al lado derecho del cuadrado
  line(posX - 4, posY + 16, posX - 4, posY - 15);              //Línea vertical originada de la anterior                    
  line(posX - 4, posY - 15, posX + 16, posY - 15);             //Línea horizontal originada de la anterior vertical                      
  line(posX + 16, posY - 15, posX + 16, posY + 3);             //Línea vertical                   
  line(posX + 16, posY + 3, posX - 18, posY + 3);              //Línea horizontal final, interior del espiral
  line(posX - 18, posY + 3, posX - 18, posY - 24);             //Líena vertical hacia arriba, hasta llegar al borde superior del cuadrado
}

void cGrande(int posX, int posY, float tam, float size) {      //Función de nombre cGrande que consta de cuatro variables
   
  float linea1 = map(mouseX, 0, width, 0, 4);                  //función map para el grosor de la línea del cuadrado que va de 0px a 4px de izquierda a derecha según el eje x del mouse
  strokeWeight(linea1);                                        //grosor de la línea determinado por el map      
  noFill();                                                    //figuras sin relleno
  stroke(0);                                                   //color negro para las líneas de la figura
  rect(posX, posY, tam, tam);                                  //coordenadas y tamaño para el cuadrado
}

void cuadrado(int posX, int posY, float size) {                //Función de nombre tres, con cuatro variables  

  noFill();                                                    //figuras sin relleno
  stroke(0);                                                   //línea negra para la figura
  strokeWeight(2);                                             //con un grosor de 2px
  rect(posX, posY, size, size);                                //coordenadas de posición y tamaño para el cuadrado
}

void cuadradito(int posX, int posY, float size) {              //Función de nombre cuadradito, con tres variables  

  float porte = map(mouseY, 0, height, size / 2, size * 3.5);  //función map para agrandar y achicar el porte del cuadrado segun el eje y del mouse
  float transparente = map(mouseX, 0, width, 0, 255);          //función map para determinar la transparencia del color de la figura según el eje x del mouse
  fill(tur, transparente);                                     //color turquesa más transparencia
  noStroke();                                                  //figuras sin líneas
  rect(posX, posY, porte, porte);                              //coordenadas de posición y tamaño para el cuadrado, el último gobernado por función map
}