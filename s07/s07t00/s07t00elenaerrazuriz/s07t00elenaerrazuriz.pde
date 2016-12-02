//Expresión Digital II - Diseño Digital - UDD - 2016
// M. Elena Errázuriz
//s07t00elenaerrazuriz

/*
El código muestra seis elementos, que rebotan de los
 bordes de la composición cíclicamente. Sus colores van variando luego de cada bote según las tonallidades en degradé
 de dos colores previamente elegidos y determinados por el lerpColor. El código está dividido en dos: la pantalla principal con el void setup y el void draw;
 y una pestaña adjunta, que tiene los elementos que son dibujados compuestos en un class. Éste último es llamado en la pestaña principal para ser dibujado.
 */

Elena[] o = new Elena[4];                                       //Definir array de 4 elementos de un class llamado Elena, con especificación de nombre 'o'
Elena[] p = new Elena[2];                                       //Definir array de 2 elementos de un class llamado Elena, con especificación de nombre 'p'

void setup() {

  size(800, 600);                                               //Tamaño del canvas
  for (int i = 0; i < o.length; i++) {                          //Definir el tamaño de alcance que tiene el array 'o' dentro del canvas
    o[i] = new Elena( (int)random(0, width));                   //Definir que la ellección de elementos dentro del array sean al azar
  }
  for (int j = 0; j < p.length; j ++) {                         //Definir el tamaño de alcance que tiene el array 'p' dentro del canvas
    p[j] = new Elena( (int)random(0, width));                   //Definir que la ellección de elementos dentro del array sean al azar
  }
}

void draw() {

  background(220);                                               //Determinar color de fondo del canvas
  for (int i = 0; i < o.length; i ++) {                          //Para cada valor que toma 'i', y que recorre todo el largo del canvas
    o[i].mover();                                                //va a leer y ejecutar la función de 'mover' dentro del class 'o'
    o[i].borde();                                                //va a leer y ejecutar la función de 'borde' dentro del class 'o'
    o[i].cuadradito(o[i].x + 10, o[i].y + 15);                   //va a leer y ejecutar la función de 'cuadradito' dentro del class 'o', pero alterando los valores previos de 'x' e 'y'
    o[i].cuadrado(o[i].x + 10, o[i].y + 15);                     //va a leer y ejecutar la función de 'cuadrado' dentro del class 'o', pero alterando los valores previos de 'x' e 'y'
  }
  for (int j = 0; j < p.length; j ++) {                          //Para cada valor que toma 'j', y que recorre todo el largo del canvas
    p[j].mover();                                                //va a leer y ejecutar la función de 'mover' dentro del class 'p'                                              
    p[j].borde();                                                //va a leer y ejecutar la función de 'borde' dentro del class 'p' 
    p[j].cGrande();                                              //va a leer y ejecutar la función de 'cGrande' dentro del class 'p' 
    p[j].espiral();                                              //va a leer y ejecutar la función de 'espiral' dentro del class 'p' 
  }
}