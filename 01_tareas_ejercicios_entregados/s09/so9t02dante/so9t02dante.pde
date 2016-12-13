// Expresión Digital II - Diseño Digital - UDD - 2016
// Dante Crovetto
// so9t02dante

/*
Se dibuja una grilla de 10 por 4 figuras similares a un engranaje, las impares giran hacia la derecha y las pares a la izquierda. Las tres líneas centrales en el eje vertical son de color amarillo y las demás rojas. el borde de las líneas es negro.
 */
Objects[] objetos = new Objects [25];  // Se crea la clase Objects que es igual a objetos

void setup() {  // Función que se ejecuta al principio una sola vez
  size(1000, 1000);  // Se crea un canvas de 1000x1000 px
  for (int i = 0; i < 5; i++) {  // Mientras la nueva variable i sea menor que 5, i va sumando 1 cada vez.
    for (int j = 0; j < 5; j++) { // Mientras la nueva variable j sea menor que 5, j va sumando 1 cada vez.
      int total = j + i * 5;  // Se crea la variable entera total igual a la multiplicación de 5 por i más j.
      float ix = i * 30; // Se crea la variable decimal ix que es igual a la multiplicación de i por 30.
      float jy = j * 50; // Se crea la variable decimal jy que es igual a la multiplicación de j por 50.
      objetos[total] = new Objects(i, j, ix, jy, total, total);  // Se ingresan las variables i, j, ix, jy, total, total a la clase
    }
  }
}

void draw() {  // se crea la funcion void draw
  background(253);  // El color de fondo es blanco
  translate(width / 4, height / 4);  // Se traslada el origen al ancho divididio en 4 y el alto dividido en 4
  for (int i = 0; i < objetos.length; i++) {  // Mientras la nueva variable i sea menor que el total de valores dentro del objeto, i va sumando 1 cada vez.

    objetos[i].dibujarEngranaje();  // Se utiliza la clase objetos creando figuras nuevas de la función dibujarEngranaje
    objetos[i].dibujarEngranaje2();  // Se utiliza la clase objetos creando figuras nuevas de la función dibujarEngranaje2
  }
}