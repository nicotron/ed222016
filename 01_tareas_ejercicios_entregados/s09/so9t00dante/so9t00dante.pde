// Expresión Digital II - Diseño Digital - UDD - 2016
// Dante Crovetto
// so9t00dante

/*
Se dibuja una bandera hecha por círculos en una grilla de 30 por 20, que se van achicando de izquierda a derecha, la mitad inferior es de color de relleno rojo, del lado superior hasta el décimo círculo son amarillos y las demás son negros.
El contorno de los círculos es negro 
 */


Objects[] objetos = new Objects [600];  // Se crea la clase Objects que es igual a objetos

void setup() {  // Función que se ejecuta al principio una sola vez
  size(1000, 1000);  // Se crea un canvas de 1000x1000 px
  for (int i = 0; i < 30; i++) {  // Mientras la nueva variable i sea menor que 30, i va sumando 1 cada vez.
    for (int j = 0; j < 20; j++) {  // Mientras la nueva variable j sea menor que 20, j va sumando 1 cada vez.
      int total = j + i * 20;  // Se crea la variable entera total igual a la multiplicación de 20 por i más j.
      float ix = i * 30; // Se crea la variable decimal ix que es igual a la multiplicación de i por 30.
      float jy = j * 30; // Se crea la variable decimal jy que es igual a la multiplicación de j por 30.
      objetos[total] = new Objects(i, j, ix, jy, total);  // Se ingresan las variables i, j, ix, jy, total a la clase
    }
  }
}

void draw() {  // se crea la función keyPressed
  background(253);  //Se crea un fondo de color blanco
  translate(width / 20, height / 4);  //Se traslada el origen a el ancho dividido en 20 y el alto dividido en 4
  for (int i = 0; i < objetos.length; i++) {  // Mientras la nueva variable i sea menor que el total de valores dentro del objeto, i va sumando 1 cada vez.

    objetos[i].dibujarBandera();  // Se utiliza la clase objetos creando 600 nuevas figuras.

  } 
}