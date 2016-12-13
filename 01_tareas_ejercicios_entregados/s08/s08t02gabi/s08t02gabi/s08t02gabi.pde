//Expresión Digital II - Diseño Digital - UDD - 2016
//Gabriela Navarro Risopatrón  
//s08t00gabi

Gabi [] g = new Gabi[625];

void setup() {
  size(1000, 1000);
  for (int j = 0; j < 25; j++) {
    for (int z = 0; z < 25; z++) {
      int total = j + z * 25;
      float jx = j * 25;
      float zy = z * 25;
      g[total] = new Gabi(jx, zy, jx + 5, zy + 5, (int) random (-2, 3), (int) random(-2, 3), total);
    }
  }
}

void draw() {
  background(120);
  translate (width * .15, height * .15);
  for (int j = 0; j < g.length; j++) {
    g[j].dibujar();
    g[j].lineas();
    g[j].mover();
    g[j].rotar();
    g[j].bordes();
  }
}