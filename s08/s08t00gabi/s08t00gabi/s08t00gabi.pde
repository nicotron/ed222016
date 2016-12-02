// Expresión Digital II - Diseño Digital - UDD - 2016
//Gabriela Navarro Risopatrón
//s08t00gabi

Body[] b = new Body[625];

void setup() {
  size(1000, 1000);
  for (int i = 0; i < 25; i++) {
    for (int z = 0; z < 25; z++) {
      int total = z + i * 25;
      float ix = i * 25;
      float zy = z * 25;
      b[total] = new Body(ix, zy, ix + 25, zy + 25, (int) random(-2, 2), (int) random(-2, 2), total);
      //println(total);
    }
  }
}


void draw() {
  background(120);
  //pushMatrix();
  translate(width * .15, height * .15);
  for (int i = 0; i < b.length; i++) {
    b[i].display();
    b[i].lineas();
    b[i].mover();
    b[i].rotar();
    b[i].bordes();
  }
}
//popMAtrix();
  //saveFrame("files/###.png");
  //if (frameCount > 870) {
  //exit();
  //}