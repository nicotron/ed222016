//Expresión digital II - Diseño Digital - UDD- 2016.
//Isidora Ordoñez.
//s07e00isi.

/*
En este código vemos como rebotan distintas funciones llamadas a través de un class.
 */


Objeto[] o = new Objeto[2];
Objeto[] p = new Objeto[2];

void setup() {

  size(800, 600);                     
  for (int i = 0; i < o.length; i++) {
    o[i] = new Objeto((int)random(0, width));
    p[i] = new Objeto((int)random(0, width));
  }
}

void draw() {

  background(113);                         

  for (int i = 0; i < o.length; i++) {
    o[i].triangulo1();
    o[i].triangulo2();
    o[i].triangulo3();
    o[i].triangulo4();
    o[i].mover();
    o[i].borde();
    p[i].circulo();
    p[i].mover();
    p[i].borde();
  }
}