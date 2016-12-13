Objeto[] o = new Objeto[20];

  void setup() {
  size(600, 600);
  for (int i = 0; i < o.length; i++) {
    o[i] = new Objeto((int)random(0, width));
  }
}

void draw() {
  background(200);
  for (int i = 0; i < o.length; i++) {
    o[i].display();
    o[i].mover();
    o[i].borde();
  }
}