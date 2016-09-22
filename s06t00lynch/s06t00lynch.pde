int x, y;
float velX = 3.687;
int velY = 6;
int diam = 50;
int count = 0;
color c1 = color(0);
color c, m, yl, k;

void setup() {
  size(400, 400);
  x = diam;
  y = height/2;
  c = color(0, 255, 255);
  m = color(255, 0, 255);
  yl = color(255, 255, 0);
  k = color(0);
}

void draw() {
  background(110);
  noStroke();
  fill(c1);
  ellipse(x, y, diam * 2, diam * 2);
  y += velY;
  x += velX;

  if (count == 4) {
    count = 0;
  }
  if (x > width - diam || x < diam) { 
    velX *= -1;
    count += 1;
    if (count == 1) {
      c1 = c;
    } else if (count == 2) {
      c1 = m;
    } else if ( count == 3) {
      c1 = yl;
    } else if(count == 4){
      c1 = k;
    }
  }
  if (y > height - diam || y < diam) { 
    velY *= -1;
    count += 1;
    if (count == 1) {
      c1 = c;
    } else if (count == 2) {
      c1 = m;
    } else if ( count == 3) {
      c1 = yl;
    } else if(count == 4){
      c1 = k;
    }
  }
  println(count);
}