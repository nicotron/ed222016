Objects[] objetos = new Objects[400];

void setup() {
  size (1000, 1000);
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 20; j++) {
      int total = i + j * 20;
      float ix = i * 20;
      float iy = j * 20; 
      objetos[total] = new Objects (ix, iy, ix + 5, iy + 5, (int)random (-2, 2), (int) random (-2, 2), total * 0.1);
    }
  }
}

void draw() { 
  //  objects
  background(253);
  translate(width * .15, height
  .
  .
  .
}