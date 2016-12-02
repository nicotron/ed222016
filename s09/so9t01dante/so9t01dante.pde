// Expresión Digital II - Diseño Digital - UDD - 2016
// Dante Crovetto
// so9t01dante

/*
Se dibujan 4 círculos sin relleno con borde de grosor 20 que van cambiando de color entre amarillo negro y rojo a medida que los bordes se van despazando. Todo esto sobre un fondo amarillo
 */


Objects[] objetos = new Objects [4];  // Se crea la clase Objects que es igual a objetos

void setup() {  // Función que se ejecuta al principio una sola vez
  size(1000, 1000);  // Se crea un canvas de 1000x1000 px
  for (int i = 0; i < 2; i++) {  // Mientras la nueva variable i sea menor que 2, i va sumando 1 cada vez.
    for (int j = 0; j < 2; j++) {  // Mientras la nueva variable j sea menor que 2, j va sumando 1 cada vez.
      int total = j + i * 2;  // Se crea la variable entera total igual a la multiplicación de 2 por i más j.
      float ix = i * 300; // Se crea la variable decimal ix que es igual a la multiplicación de i por 300.
      float jy = j * 300; // Se crea la variable decimal jy que es igual a la multiplicación de j por 30.
      objetos[total] = new Objects(i, j, ix, jy, total, total, total);  // Se ingresan las variables i, j, ix, jy, total, total, total a la clase
      background( #ECF500);  // El color de fondo es amarillo
    }
  }
}

void draw() {  // se crea la funcion void draw
  translate(width / 2 - 150, height / 2 - 150);  //Se traslada el origen a la mitad del ancho y alto, dividido por dos y restándoles 150.
  for (int i = 0; i < objetos.length; i++) {  // Mientras la nueva variable i sea menor que el total de valores dentro del objeto, i va sumando 1 cada vez.

    objetos[i].dibujarEngranaje();  // Se utiliza la clase objetos creando figuras nuevas de la función dibujarEngranaje
    objetos[i].dibujarEngranaje2();  // Se utiliza la clase objetos creando figuras nuevas de la función dibujarEngranaje2
    objetos[i].dibujarEngranaje3();  // Se utiliza la clase objetos creando figuras nuevas de la función dibujarEngranaje3
  }
}