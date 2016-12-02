class Objects {
  float x, y, tx, ty, vx, vy, total;
  Objects (float x, float y, float tx, float ty, float vx, float vy, float total){
  this.x = x;
  this.y = y;
  this.tx = tx;
  this.ty = ty;
  this.vx = vx;
  this.vy = vy;
  this.total = total;
}

void display() {
  pushMatrix();
  noStroke(); 
  fill(51);
  ellipse(x, y, 3, 3);
  popMatrix();
}

void displayLine() {
 pushMatrix();
 translate(x, y);
 rotate(angulo);
 stroke(51);
 line(0, 0, -angulo,0);
 popMatrix();
 
}

void move() {
 angulo +) 0.02; 
}

void edges(){
  if (x > tx || x < tx-10) {
    vx *= -1;
  }
  if (y > ty  || y < ty-10) {
    vy *= -1;
  }
}
}