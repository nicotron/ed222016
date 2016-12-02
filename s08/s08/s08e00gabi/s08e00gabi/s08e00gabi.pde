// Expresión Digital II - Diesño Digital - UDD - 2016
// Gabriela Navarro Risopatrón
//s08e00gabi

//float x, y, tx, ty, vx, vy;
Body[] d = new Body[625]; //[9]

void setup() {
  size(1000, 1000);
  for (int i = 0; i < 25; i++) { //i < 9; i++  - 3
    for (int j = 0; j < 25; j++) { //j < 1; j++  - 3
      int total = j + i * 25; // j + 1 * 3;
      float ix = i * 25;
      float jy = j * 25;
      d[total] = new Body(ix, jy, ix + 25, jy + 25, (int) random(-2, 2), (int) random(-2, 2));
      println(total);
    }
  }
}

void draw() {
  background(255);
  //pushMatrix();
  for (int i = 0; i < d.length; i++) {
    d[i].display();
    d[i].move();
    d[i].edges();
  }
}
  //popMAtrix();
  //saveFrame("files/###.png");
  //if (frameCount > 870) {
  //exit();
  //}