int count = 10;
Object[] o = new Object[2];

void setup() {
background(0);
  size(800, 600);
  for (int i = 0; i < o.length; i++) {
    o[i] = new Object((int)random(0, width));
  }
}

void draw() {
  //background(150);
  for (int i = 0; i < o.length; i++) {
    o[i].display();
    o[i].rebote();
  }

  if (count == 30) {
    background(10, 0, 10, 40);
    count = 0;
  }
  count++;
}