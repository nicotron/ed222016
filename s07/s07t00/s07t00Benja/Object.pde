class Object {
  //variables globales de la clase
  float y, velx, vely, amt, amt2;
  color c1, c2, c3, c4, c5, c6;
  int diam = 100;
  int N = 0;
  int x;

  //constructor
  Object (int x) {

    this.x = x;
    y = random(height);
    velx = 5;
    vely = 5;
    c1 = color(70, 0, 255);
    c2 = color(35, 255, 25);
    c4 = color(255, 0, 0);
    c5 = color(60, 100, 90);
  }

  void display() {
    noStroke();
    fill(c3);
    ellipse(x, y, diam, diam);
  }

  void rebote() {
    c3 = lerpColor(c1, c2, amt);
    amt = map(x, 0, width, 0, 1);
    x -= velx;
    y -= vely;
    if (x > width - diam/2 || x <= diam/2) {
      velx *= -1;
    }
    if (y > height - diam/2 || y <= diam/2) {
      vely *= -1;
    }
  }
}