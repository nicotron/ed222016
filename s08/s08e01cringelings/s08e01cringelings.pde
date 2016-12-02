Objeto[] c = new Objeto[625];

void setup() {
  size(1000, 1000);
  for (int i = 0; i < 25; i++) {
    for (int j = 0; j < 25; j++) {
      int total = j + i * 25;
      float ix = i * 25;
      float jy = j * 25;
      c[total] = new Objeto(ix, jy, ix + 25, jy + 25, (int)random(-2, 2), (int)random(-2, 2), random(-1, 1));
      println(total);
    }
  }
}

void draw() {
  background(253);
  translate(width * .15, height * .15);
  //pushMatrix();
  
  for (int i = 0; i < c.length; i++) {
    c[i].displayLine();
    c[i].display();
    c[i].move();
    c[i].edges();
  }
  //popMatrix();
  //saveFrame("files/####.png");
  //if (frameCount > 870) {
  //exit();
  //}
}