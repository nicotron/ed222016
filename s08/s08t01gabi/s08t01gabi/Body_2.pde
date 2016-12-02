class body {
  float x, y, xx, yy, velx, vely, angulo;
  body (float x, float y, float xx, float yy, float velx, float vely, float angulo) {

    //inicialización
    this.x = x;
    this.y = y;
    this.xx = xx;
    this.yy = yy;
    this.velx = velx * .3;
    this.vely = vely * .3;
    this.angulo = angulo;
  }

  void display() {
    pushMatrix();
    translate(width * .2, height * .2);
    //rotate();
    stroke(255);
    strokeWeight(.4);
    fill(97, 209, 206);
    rect(x, y, 10, 10);
    translate(x + 55, y - 55);
    rotate(angulo);
    fill(255);
    ellipse(0, 0, 6, 6);
    popMatrix();
  }
  void mover() {
    x += velx;
    y += vely;
  }

  void bordes() {
    if (x > xx || x <xx - 30) {
      velx *= -1;
    }
    if (y > yy || y < yy - 50) {
      vely *= -1;
    }
  }
}