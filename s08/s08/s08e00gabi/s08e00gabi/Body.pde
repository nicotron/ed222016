class Body {
  //Variables 
  float x, y, tx, ty, vx, vy; 
  Body (float x, float y, float tx, float ty, float vx, float vy) {
    //int color = color(255);
    //boolean z, h;

    //inicialización 
    this.x = x;
    this.y = y;
    this.tx = tx;
    this.ty = ty;
    this.vx = vx * .5;
    this.vy = vy * .5;
  }

  void display() {
    pushMatrix();
    translate(width * .2, height * .2);
    //rotate();
    stroke(123);
    strokeWeight(1);
    fill(97, 209, 206);
    ellipse(x, y, 10, 10);
    popMatrix();
  }

  void move() {
    x += vx;
    y += vy;
  }

  void edges() {
    if (x > tx || x < tx - 50) {
      vx *= -1;
    }
    if (y > ty || y < ty - 20) {
      vy *= -1;
    }
  }
}