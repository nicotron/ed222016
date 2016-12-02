// Expresión Digital II - Diseño Digital - UDD - 2016
//Benjamin Gutierrez 
//s10c01benja

// NIVEL 0.6: una grilla (nivel 1), un movimiento (nivel 1), dos figuras (nivel 1)
/* declaramos la clase, dandole nombre y creando un array con el numero total de objetos*/
Body[] b = new Body[400];

/*en el void setup donde doy el tamaño del canvas, e iniciamos la clase
a traves del for loop, y asi creando la grilla*/
void setup () {
  size(600, 600);
  background(253);
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 20; j++) {
      int total = j + i * 20;
      float ix = i * 20;
      float jy = j * 20;
      b[total] = new Body(ix, jy, ix + 5, jy + 5, (int)random(-2, 2), (int)random(-2, 2), total * .001);
      println(total);
    }
  }
}

/* en el void draw, damos un fondo, y use la funcion de translate
para centrar la grilla, y con el for loop del void draw, traemos las 
funciones de la clase, como lmor, o rotar, que traen las lineas y las hacen girar
generando una grilla de lineas que crean cuadrados al girar*/
void draw() {
  background(255);
  translate(width * .20, height * .20);

  for (int i = 0; i < b.length; i++) {

    b[i].lmor();
    b[i].lmor2();
    b[i].lver();
    b[i].lver2();
    b[i].rotar();
  }
}