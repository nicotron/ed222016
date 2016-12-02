class Objeto {
  //variables as things
  float x, y, tx, ty, vx, vy, angulo;
  Objeto (float x, float y, float tx, float ty, float vx, float vy, float angulo) {
    //Inicialize the things
    this.x = x;
    this.y = y;
    //this.tx = tx;
    //this.ty = ty;
    //this.vx = .1;
    this.vy = .1;
    this.angulo = angulo;
  }

  void display() {
    pushMatrix();
    translate(x * 5, y * 5);
    rotate (angulo);
    fill(51);
    ellipse(20, 20, 5, 5);
    popMatrix();
  }

  void displayLine() {
    pushMatrix();
    translate(x * 5, y * 5);
    rotate (-angulo);
    stroke(51);
    line(4, 4, 18, 18);
    popMatrix();
  }

  void move() {
    //x += 1;
    //y += 1;
    angulo += .07;
  }

  void edges() {
    if (x > tx || x < tx -10) {
      vx *= -1;
    }
    if ( y < ty || y < ty -10) {
      vy *= -1;
    }
  }
}