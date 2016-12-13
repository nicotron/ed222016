class Objeto {
  int x;
  float y, diam, amt;
  color c1, c2, c3;
  boolean b;
  int vel= 5;
  int vel2= 6;

  Objeto(int x) {
    this.x = x;
    y = 10.5;
    c1 = color(255, 106, 0, 190);// naranjo
    //c2 = color(255, 200);
    c2 = color(4, 175, 146, 180); // calipso
    b = true;
  }

  void display() {
    c3 = lerpColor(c1, c2, amt);
    amt = map(x, 0, width, 0, 1);
    noStroke();
    fill(c3);
    ellipse(x, x, y, y);
  }

  void mover() {
    x += vel;
    y += vel2;

    if (x > width - diam/2 || x < diam/2) {
      vel*= -1;
    }

    if (y > height - diam/2 || y < diam/2) {
      vel2*= -1;
    }
  }

  void borde() {
    if (x > width) {
      x = 0;
      y = random(5, 30);
    }
  }
}