// Expresión Digital II - Diseño Digital - UDD - 2016
// Dante Crovetto
//s06e01dante

/*
se dibuja una elipse de izquierda a derecha en el centro del eje Y, la cual va cambiando de rojo a amarillo.
 */

float x, y, amt;  // Se crean las variables decimales x, y ,amt
color c1, c2, c3;  // Se crean los colores c1, c2 y c3

void setup() {  // Función que se ejecuta al principio una sola vez
  size(400, 400);  // Se crea un canvas de 400 x 400 px
  x = 0;  // La variable x pasa a ser 0
  y = height / 2;  // La variable y es igual al alto dividido en 2

  c1 = color (255, 0, 0); // Variable c1 pasa a ser de color rojo
  c2 = color (255, 255, 0); //Variable c1 pasa a ser de color amarillo
}

void draw() {  // Función que se dibuja todo el tiempo
  amt = map(x, 0, width, 0, 1);  // la variable amt es igual a una tabla de conversión entre el ancho del canvas a 0 y 1 
  c3 = lerpColor(c1, c2, amt);  // La variable c3 es igual a el resultado entregado por lerpColor, donde va pasando de rojo a amarillo según la variable recién creada. 

  background(0);  // Se crea un fondo de color negro
  fill(c3);  // Desde ahora las figuras tendrán un relleno igual al color entregado por la variable c3
  noStroke();  // Desde ahora las figuras no tendrán grosor de línea
  ellipse(x, y, 15, 15);  // se dibuja un círculo en las coordenadas x,y de diámetro 15
  x++;  // la variable x va sumando x cada vez
}