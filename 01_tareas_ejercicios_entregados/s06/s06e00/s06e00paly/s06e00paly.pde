int x, y, velX, velY, d, cr, ca;
color c1;

int a, r, w, b;


void setup() {
  size(400, 400);
  d = 40;
  x = d;
  y = height / 2;
  velX = 2;
  velY = 3;

  c1 = color(255);

  a = color(0, 0, 44);
  r = color(190, 42, 89);
  w = color(255);
  b = color(0);
}

void draw() {
  background(123);
  fill(c1);
  noStroke();
  ellipse(x, y, d, d);

  x += velX;      //esto reemplaza el x+=2
  y += velY;

  if (x > width - d / 2 || x < d / 2) {
    velX *= -1;

    int rdm = (int)random(4);
    if (rdm == 0) {
      c1 = a;
    }
    if (rdm == 1) {
      c1 = r;
    }
    if (rdm == 2) {
      c1 = w;
    }
    if (rdm == 3) {
      c1 = b;
    }
  }

  if (y > width - d / 2 || y < d / 2) {
    velY *= -1;

    int rdm = (int)random(4);
    if (rdm == 0) {
      c1 = a;
    }
    if (rdm == 1) {
      c1 = r;
    }
    if (rdm == 2) {
      c1 = w;
    }
    if (rdm == 3) {
      c1 = b;
    }
  }
}