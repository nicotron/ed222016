class Gabi {
  float x, y, x1, y1, vx, vy, angulo;

  Gabi (float x, float y, float x1, float y1, float vx, float vy, float angulo) {
    this.x = x;
    this.y = y;
    this.x1 = x1;
    this.y1 = y1;
    this.vx = vx * 2;
    this.vy = vy * 2;
    this.angulo = angulo;
  }

  void dibujar() {
    pushMatrix();
    //translate(width * .03, height * .03);
    stroke(0);
    strokeWeight (1);
    fill(97, 209, 206);
    ellipse(x, y, 8, 8);
    popMatrix();
  }
  void lineas() {
    pushMatrix();

    translate(x, y);
    rotate(angulo);
    //fill(97, 209, 206);
    strokeWeight(.5);
    stroke(255);
    line(0, 0, 25, 0);
    popMatrix();
  }
  void mover() {
    x += vx;
    y += vy;
  }
  
  void rotar() {
    angulo += .08;
  }

  void bordes() {
    if ( x > x1 || x > x1 - 10) {
      vx *= -1;
    }
    if ( y > y1 || y > y1 - 10) {
      vy *= -1;
    }
  }
}