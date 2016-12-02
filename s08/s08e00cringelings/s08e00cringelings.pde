float x, y, vx, angulo;

void setup() {
  size(500, 500);
  x = 0;
  y = 0;
  vx = .5;  // velocidad en x
}

void draw() {
  background(253);
  ruler();
  
  //noStroke();
  //fill(51);
  translate(width / 2, height / 2);
  //ellipse(x, y, 20, 20);
  pushMatrix();
     rotate(angulo);
     ellipse(x + 120, y, 20, 20);
     popMatrix();
  pushMatrix();
     rotate(-angulo);
     strokeWeight(10);
     line(x, y, x + 100, y);
  popMatrix();
  
  //translate(30, 0);
  //ellipse(x, y, 10, 10);
  
  //avanza
  //x += vx
  angulo += 0.005;
  
  //rebota
  if (x > 6 || x < -5) {
    vx *= -1;
  }
}

void ruler() {
  stroke(155);
  strokeWeight(1);
 // line
 
}