// Expresión Digital II - Diseño Digital - UDD - 2016
//Gabriela Navarro Risopatrón
//s08t00gabi

body [] b = new body[625];

void setup() {
  size(1000, 1000);
  for (int j = 0; j < 25; j++) {
    for (int a = 0; a < 25; a ++) {
      int total = j + a * 25;
      float jx = j * 25;
      float ay = a * 25;
      b[total] = new body(jx, ay, jx + 25, ay + 25, (int) random(-2, 1), (int) random(-2, 3), total);
      println(total);
    }
  }
}
void draw() {
  background(69);
  //pushMatrix();
  for (int j = 0; j < b.length; j++) {
    b[j].display();
    b[j].mover();
    b[j].bordes();
  }
}


//popMatrix();
//saveFrame("files/###.png");
//if (fremaCount > 870) {
//exit();
//}