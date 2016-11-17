//Expresión Digital - Diseño Digital - UDD - 2016
//Margaux Leroy
//s02t01margaux

/*
Aplicación de los funciones aprendidas en clase - con 4 colores diferentes
*/

//declaración de variables
  //de colores
  int a = #1BBC9B;
  int b = #3A539B;
  int c = #F7CA18;
  
  //de posición
  int x = 0;     
  int y = 5;   
    
  void setup(){
    size (500, 500); //tamaño del canvas
    background(a); //color del fondo
}
                    
  void draw() {   
    //formas en todo el canvas 
      for (int i = 0; i < width; i += 20){        //distancia de 20px en la anchura
        for (int j = 0; j < height; j += 20){     //distancia de 20px en la altura
          
    fill(b);                           //relleno azul
    ellipse(i, j, y*1.5, y*1.5);      //
    fill(c);                          //relleno amarillo 
    stroke(0);                        //contorno negro
    rect(i, j, y, y);                 //
    
     }
    }
  }