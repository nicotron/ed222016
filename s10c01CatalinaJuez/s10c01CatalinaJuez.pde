//Expresión Digital - Diseño Digital - UDD - 2016
//Catalina Juez
//s10c01CatalinaJuez

/*
En este código se puede apreciar triángulos que giran en un sentido, mientras que una línea gira de manera más lenta y a sentido contrario 
(desde el mismo punto de origen del triángulo). Y sobre esto se puede notar unas líneas de círculos las cuales se encuentran más separadas 
entre ellas y los mismos círculos, a medida que se empieza a acercar al final de la composición. Además de que estas líneas se encuentran 
en constante movimiento hacia el lado derecho y vuelven a aparecer nuevamente por el lado izquierdo.*/

// NIVEL 2.3: Al tener una grilla, 3 movimientos y 3 figuras (nivel 3)
// Pregunta: 1.0 no supo responder el porqué las líneas de elipses se iban separando a lo largo del canvas

// LLamamos a nuestros class
Cata[] e = new Cata [625];
Cata2[] d = new Cata2 [625];

// Acá creamos las funciones y llamamos a nuestros class (llamados anteriormente al principio del código), para que actúen en dichos for.
void setup() {
  size(600, 600);
  for (int i = 0; i < 25; i++) {
    for (int j = 0; j < 25; j++) {
      int total = j + i * 25;
      float ix = i * 25; //separación entre los elementos, separación de 25px entre cada uno
      float jy = j * 25; //separación entre los elementos, separación de 25px entre cada uno
      e[total] = new Cata(ix, jy, total);
    }

    for (int z = 0; z < 25; z++) {
      for (int w = 0; w < 25; w++) {
        int total = w + z * 25;
        float zx = z * 5; //separación entre los elementos, separación de 5px entre cada uno
        d[total] = new Cata2(zx);
      }
    }
  }
}


//Dentro del void draw llamamos a todos las funciones creadas dentro de cada class, para que así se dibujen en nuestro código.
void draw() {
  background(253);
  for (int i = 0; i < e.length; i++) {

    e[i].dibujarLinea();
    e[i].dibujarTriangulo();
    e[i].mover();

    d[i].dibujarCirculo();
    d[i].mover();
    d[i].borde();
  }
}