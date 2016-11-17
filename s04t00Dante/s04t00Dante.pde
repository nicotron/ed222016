// Expresión Digital II - Diseño Digital - UDD - 2016
// Dante Crovetto
// s04t00Dante

/*
Una vez que corre el programa se creará un canvas de quinientos por quinientos pixeles, con un fondo de color negro. Sobre este se dibujarán elipses (con un relleno de color amarillo o rojo aleatoriamente, y un borde de color blanco)
en cada cruce de una grilla de nueve de ancho y siete de alto equidistantes entre sí de margen a margen, con un diámetro igual a un décimo del lado más pequeño del canvas.
 En el caso de que ambos lados del canvas sean iguales se utilizará el ancho del canvas, y el color de relleno de las elipses cambiará cada un segundo. Por otro lado, el programa será responsivo al size que se ponga.
 */


void setup() {                                         // Función que se ejecuta al principio una sola vez

  size(500, 500);                                      // Se crea un canvas de medidas 500x500 px
  background (#000000);                                // Se pone un fondo de color negro
  ellipseMode(CENTER);                                 // A partir de ahora todas las elipses se dibujarán desde el centro
  frameRate(1);                                        //Se dibujará un cuadro por cada segundo
}

void draw() {                                          // Función que se ejecuta infinitas veces mientras el programa funciona
  int[] Color = { #FFFF00, #FF0000 };                  //Se crea un arreglo (librería) de nombre Color que contiene dos colores, amarillo y rojo
  strokeWeight(1);                                     // El grosor de las líneas será de 1px desde ahora
  int diametro =0;                                     // Se declara una variable "diametro" ya que no se puede utilizar la variable diámetro
  stroke(#FFFFFF);                                     // El color de las líneas será blanco
  if (width>=height) {                                 // Si el ancho es mayor o igual al alto que ocurra lo siguiente
    diametro=height/10;                                // la variable "diametro" pasa a ser igual al alto del canvas dividido en 10
  } else {                                             // Si no ocurre la condición anterior, se ejecutará lo siguiente
    diametro=width/10;                                 // la variable "diametro" pasa a ser igual al ancho del canvas dividido en 10
  }


  for (int x = 0; x <= width; x += width/8) {          // Mientras la nueva variable x sea menor o igual que el ancho del canvas, se ejecutará el código de abajo e irá sumando el valor resultante del ancho del canvas dividido por ocho cada vez.
    for (int y = 0; y <= height; y += height/6) {      // Mientras la nueva variable y sea menor o igual que el alto del canvas, se ejecutará el código de abajo e irá sumando el valor resultante del alto del canvas dividido en seis cada vez.
      int k= Color[(int) random(2)];                   // Se crea una variable k que puede ser igual a cualquiera de los dos colores que contiene el array Color
      fill(k);                                         //el color de relleno de los objetos es igual al color que contenga actualmente la variable k
      ellipse(x, y, diametro, diametro);               // Se dibujará una elipse en las coordenadas x,y creadas anteriormente, con un diámetro igual a un décimo del lado más pequeño del canvas.
                                                       // En el caso de que ambos lados del canvas sean iguales se utilizará el ancho del canvas.
    }
  }
}