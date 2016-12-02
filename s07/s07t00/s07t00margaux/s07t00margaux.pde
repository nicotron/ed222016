//Expresión Digital - Diseño Digital - UDD - 2016
//Margaux Leroy
//s07t00margaux

/*
El código debe utilizar la tarea de la semana 
pasada con la estructura de objecto visto en clase
*/

// Variables globales
Objeto[] o = new Objeto[50];
Objeto[] p = new Objeto[100];

int y, x, t, velx, vely;
color bl, ng, c, v, m, c1;

// Funciones de sistemas
void setup() {
  size(800, 600); 
  for (int i = 0; i < o.length; i++) {
    o[i] = new Objeto((int)random(0, width));
  }
 //Velocidad
  velx = 3;
  vely = 1;

 //Colores
  bl = color(255);
  ng = color(0);
  c = color(0, 255, 255);
  m = color(255, 0, 255);
  v = color(255, 255, 0);
}

  void draw() {
    background(200);
    for (int i =0; i < o.length; i++) {
    o[i].display();
    o[i].mover();
    o[i].borde();
   }
    x += velx;
    y += vely;

  //bordes
  if (x > width - t / 2 || x < t / 2) {           
   velx *= -1;
   int r = (int)random(4);
   if (r == 0) {
      c1 = bl;
  }
   if (r == 0) {
      c1 = ng;
  }
   if (r == 0) {
      c1 = c;
  }
   if (r == 0) {
      c1 = m;
    }
  }
 
}