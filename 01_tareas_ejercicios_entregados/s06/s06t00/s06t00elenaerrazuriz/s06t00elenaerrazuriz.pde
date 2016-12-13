//Expresión Digital II - Diseño Digital - UDD - 2016
// M. Elena Errázuriz
//s06t00elenaerrazuriz

/*
El código muestra dos elementos, cuya aparición en la pantalla está definida por las teclas 'a' y 's', que rebotan de los
 bordes de la composición cíclicamente. Sus colores van variando luego de cada bote según las tonalidades en degradé
 de dos colores previamente elegidos.
 */

int x, y, a, d;                                                 //Declarar variable
int velx = 2;                                                   //Declarar variable velocidad eje x
int vely = 2;                                                   //Declarar variable velocidad eje y
float amt;                                                      //Declarar variable lerpColor

color bl, ng, tu, sg, c1, c2;                                   //Declarar variables de color

boolean cua;                                                    //Declarar globalmente nombre boolean
boolean ch;                                                     //Declarar globalmente nombre boolean

void setup() {

  size(800, 600);                                               //Tamaño del canvas
  rectMode(CENTER);                                             //Definir que todos los cuadrados se dibujen desde el centro
  d = 60;                                                       //Inicializar variable d
  x = d;                                                        //Inicializar variable x
  a = 55;                                                       //Valor tamaño cuadrados
  y = height / 2;                                               //Inicializar variable y

  cua = true;                                                   //Boolean comienza las acciones en estado 'falso'                            
  ch = false;                                                   //Boolean comienza las acciones en estado 'falso'

  bl = color(255);                                              //Inicializar variable color
  ng = color(0);                                                //Inicializar variable color
  tu = color(54, 215, 183);                                     //Inicializar variable color
  sg = color(27, 163, 156);                                     //Inicializar variable color
  c1 = tu;                                                      //Inicializar variable color
  c2 = sg;                                                      //Inicializar variable color
}

void draw() {

  background(bl);                                               //Determinar color de fondo del canvas

  x += velx;                                                    //Avanzar espacios en x según la variable de velocidad
  y += vely;                                                    //Avanzar espacios en y según la variable de velocidad

  if (cua == true) {                                            //Si el boolean llamado 'cua', es verdadero
    cGrande(x, y, a);                                           //dibujar cuadrado en función 'cGrande'
    espiral(x, y);                                              //dibujar el espiral compuesto por la función 'espiral'
  } else {                                                      //si no,
    cua = false;                                                //el boolean es falso, por lo que no se dibuja
  }


  if (ch == true) {                                             //Si el boolean llamado 'ch', es verdadero
    cuadrado(x, y, a / 1.5);                                    //dibujar cuadrado mediano de la función 'cuadrado'
    cuadradito(x, y, a / 1.5);                                  //dibujar cuadrado chico determinado por la función 'cuadradito'
  } else {                                                      //si no,
    ch = false;                                                 //el boolean es falso, por lo que no se dibuja
  }


  /*
  Colores en eje X y determinar el margen del canvas para que la figura rebote justo al borde y su velocidad
   */
  if (x > width - d / 2 || x < d / 2) {                         //Si 'x' en las figuras cumple con las condiciones dadas
    velx *= -1;                                                 //la velocidad, cada vez que llega al final, se multiplica por '-', por lo que hace el recorrido de vuelta
    amt = map(x, 0, width, 0, 1);                               //Determinar el comportameinto de la función amt, con sus mínimos y máximos
    c1 = lerpColor(tu, bl, amt);                                //Determinar los dos colores en los cuales se hará el dergradé
    c2 = lerpColor(sg, ng, amt);                                //Determinar los dos colores en los cuales se hará el dergradé
  } 

  /*
  Colores en eje Y y determinar el margen del canvas para que la figura rebote justo al borde y su velocidad
   */
  if ( y > height - d / 2 || y < d / 2) {                       //Si 'y' en las figuras cumple con las condiciones dadas
    vely *= -1;                                                 //la velocidad, cada vez que llega al final, se multiplica por '-', por lo que hace el recorrido de vuelta
    amt = map(x, 0, width, 0, 1);                               //Determinar el comportameinto de la función amt, con sus mínimos y máximos
    c1 = lerpColor(tu, bl, amt);                                //Determinar los dos colores en los cuales se hará el dergradé
    c2 = lerpColor(sg, ng, amt);                                //Determinar los dos colores en los cuales se hará el dergradé
  }
}

void keyPressed() {

  if (key == 'a') {                                             //Si se apreta la tecla 's'
    cua = !cua;                                                 //el estado del boolean se cambia al opuesto del cual se encontraba
  }
  if (key == 's') {                                             //Si se apreta la tecla 'd'
    ch = !ch;                                                   //el estado del boolean se cambia al opuesto del cual se encontraba
  }
}

void espiral(int posX, int posY) {                              //Función de nombre espiral que consta de dos variables

  stroke(c1);                                                   //Color c1 de la línea
  strokeWeight(4);                                              //Grosor de la línea controlado por la función map
  line(posX - 4, posY + 16, posX + 24, posY + 16);              //Línea horizontal conectada al lado derecho del cuadrado
  line(posX - 4, posY + 16, posX - 4, posY - 15);               //Línea vertical originada de la anterior                    
  line(posX - 4, posY - 15, posX + 16, posY - 15);              //Línea horizontal originada de la anterior vertical                      
  line(posX + 16, posY - 15, posX + 16, posY + 3);              //Línea vertical                   
  line(posX + 16, posY + 3, posX - 18, posY + 3);               //Línea horizontal final, interior del espiral
  line(posX - 18, posY + 3, posX - 18, posY - 24);              //Líena vertical hacia arriba, hasta llegar al borde superior del cuadrado
}

void cGrande(int posX, int posY, float tam) {                   //Función de nombre cGrande que consta de cuatro variables


  strokeWeight(4);                                              //Grosor de la línea determinado por el map      
  noFill();                                                     //Figuras sin relleno
  stroke(c1);                                                   //Color c1 para las líneas de la figura
  rect(posX, posY, tam, tam);                                   //Coordenadas y tamaño para el cuadrado
}

void cuadrado(int posX, int posY, float size) {                 //Función de nombre cuadrado, con tres variables  


  noFill();                                                     //Figuras sin relleno
  stroke(c2);                                                   //Línea c2 para la figura
  strokeWeight(3);                                              //con un grosor de 2px
  rect(posX, posY, size, size);                                 //Coordenadas de posición y tamaño para el cuadrado
}

void cuadradito(int posX, int posY, float size) {               //Función de nombre cuadradito, con tres variables  


  fill(c2);                                                     //Color c2 para relleno
  noStroke();                                                   //Figuras sin líneas
  rect(posX, posY, size / 2, size / 2);                         //Coordenadas de posición y tamaño para el cuadrado, el último gobernado por función map
}