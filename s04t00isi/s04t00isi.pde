//Expresión digital - Diseño Digital - UDD- 2016
//Isidora Ordoñez
//s04t00isi. 9 7

/*En este código se ejecuta un doble for loop para una series de elipses, que gracias
 un if y un else se logra que en nuestro canvas se dibujen siempre 9 elipses de ancho
 y 6 de alto, a pesar de que el tamaño del canvas cambie.
 */



void setup() {
  size (1000, 1000);                        //Tamaño canvas.
  background (255);                         //Color canvas.

  ellipseMode (CENTER);                     //Que las ellipses se dibujen desde su centro.
}


void draw() {
  //Variables:   
  int a= width / 8;                         //Variable 'a'.
  int b= height / 6;                        //Variable 'b'.
  int verde= color(164, 189, 139);          //Variable verde.
  int amarillo= color(252, 179, 116);       //Variable color amarillo.

  int ellipse;                              //Variable "ellipse".

  //If para que ellipse siga el canvas:  
  if (width >= height) {                  // si el alto es mayor que el ancho.
    ellipse= height / 10;                 //mi variable es igual al ancho / 10.
  } else {
     ellipse = width / 10;                 //si no, es igual al alto / 10
  }

  //Doble for loop:
  for (int x = 0; x <= width; x += a) {       //for loop para eje x.
    for (int y = 0; y <= height; y += b) {    //for loop para eje y.

      //Ellipse:
      stroke (amarillo);
      //strokeWeight ();                      //línea de contorno.                        
      fill (verde);                            //relleno.
      ellipse( x, y, ellipse, ellipse);        //posición y tamaño elipse.
    }
  }
}