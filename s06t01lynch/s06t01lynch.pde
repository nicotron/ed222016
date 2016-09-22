float x, y, amt;
color c1, c2, c3;
int diam = 5;

void setup() {
  size(400, 400);
  x = 0;
  y = random(height);

  c1 = color (255, 0, 255);
  c2 = color (0, 255, 255);
  
}

void draw() {
  amt = map(x, 0, width, 0, 1);
  background(0);
  c3 = lerpColor(c1,c2, amt);
  fill(c3);
  noStroke();
  ellipse(x, y, diam, diam);
  x++;
}