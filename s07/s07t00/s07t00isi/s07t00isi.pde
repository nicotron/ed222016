//Expresión digital II - Diseño Digital - UDD- 2016.
//Isidora Ordoñez.
//s07t00isi.

/*
 En este código vemos como se dibujan los mismos objetos creados en el certamen 00, 
 pero esta vez se les llama a través de un class, a la vez hay funciones del class 
 relacionadas con el rebote de los objetos y con el color que al estar en contacto 
 con el contorno del canvas cambia en un degrade de los colores escogidos para las 
 tareas. 
*/

// Variables globales:
Objeto[] o = new Objeto[2];                         // Creo objeto 'o' de la class "Objeto".
Objeto[] p = new Objeto[2];                         // Creo objeto 'p' de la class "Objeto".

// Funciones del sistema:
void setup() {

  size(800, 600);                                   // Asigno tamaño a canvas.
  
// Inicialización objetos:
  for (int i = 0; i < o.length; i++) {              // Inicializar función.
    o[i] = new Objeto((int)random(0, width));       // Inicializar objeto 'o' y doy valor a "this.x"
    p[i] = new Objeto((int)random(0, width));       // Inicializar objeto 'u' y doy valor a "this.x"
  }
}

void draw() {

  background(113);                                  // Asigno color a canvas.                       

  for (int i = 0; i < o.length; i++) {              // Asigno movimiento a objetos.
                                                    
// llamado dot syntax:
    o[i].triangulo1();                              // Llamo a void "triangulo1" de objeto 'o'.
    o[i].triangulo2();                              // Llamo a void "triangulo2" de objeto 'o'.
    o[i].triangulo3();                              // Llamo a void "triangulo3" de objeto 'o'.
    o[i].triangulo4();                              // Llamo a void "triangulo4" de objeto 'o'.
    o[i].mover();                                   // Llamo a void "mover" de objeto 'o'.
    o[i].borde();                                   // Llamo a void "borde" de objeto 'o'.
    p[i].circulo();                                 // Llamo a void "circulo" de objeto 'p'.
    p[i].mover();                                   // Llamo a void "mover" de objeto 'p'.
    p[i].borde();                                   // Llamo a void "vorde" de objeto 'p'.
  }
}