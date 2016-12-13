class Body {
  float x, y, x1, y1, velx, vely, angulo; 
  Body (float x, float y, float x1, float y1, float velx, float vely, float angulo) {



    //inicialización 
    this.x = x;
    this.y = y;
    this.x1 = x1;
    this.y1 = y1;
    this.velx = velx * 2;
    this.vely = vely * 2;
    this.angulo = angulo;
  }

  void display() {
    pushMatrix();
    //translate(width * .2, height * .2)
    stroke(0);
    strokeWeight(.4);
    fill(97, 209, 206);
    rect(x, y, 10, 10);
    popMatrix();
  }

  void lineas () {
    pushMatrix();
    translate(x, y);
    strokeWeight(1);
    stroke(0);
    rotate(angulo);
    line(0, 0, 12, 0);
    popMatrix();
  }


  void mover() {
    x += velx;
    y += vely;
  }

  void rotar() {
    angulo += .08;
  }

  void bordes() {
    if (x > x1 || x < x1 - 10) {
      velx *= -1;
    }
    if (y > y1 || y < y1 - 10) {
      vely *= -1;
    }
  }
}