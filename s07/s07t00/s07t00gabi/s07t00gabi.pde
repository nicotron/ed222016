//Expresión Digital II - Diseño Digital - UDD - 2016
//Gabriela Navarro Risopatrón
//s07e00gabi
int x;                                                //Determinar vvariable x  
float y;                                              //Determinar variable y

//Variables globales
Objeto[] o = new Objeto[100];                         //Determinar variable de objeto

void setup() {
  size(800, 600);                                     //Tamaño de canvas
  //inicialización de variables globales    
  for (int i = 0; i < o.length; i++) {                //For loop para i
    o[i] = new Objeto((int) random(0, width));        
  }
}

void draw() {
  background(255);                                    //Determinar color canvas
  //uso de variables
  for (int i = 0; i < o.length; i++) {                //For loop para i
    o[i].display();                                   
    o[i].mover();                                     
    //o[i].borde();                                   
  }
}