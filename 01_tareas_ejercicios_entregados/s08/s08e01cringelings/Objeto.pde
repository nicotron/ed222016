class Objeto {
  //variables as things
  float x, y, tx, ty, vx, vy, angulo;
  Objeto (float x, float y, float tx, float ty, float vx, float vy, float angulo) {
  //Inicialize the things
    this.x = x;
    this.y = y;
    this.tx = tx;
    this.ty = ty;
    this.vx = vx * 0.1;
    this.vy = vy * 0.1;
    this.angulo = angulo;
    
  }
  
  void display() {
    pushMatrix();
    //translate(width * .15, height * .15);
    //rotate (aqui);
    noStroke();
    fill(51);
    ellipse(x, y, 3, 3);
    popMatrix();
  }
  
    void displayLine() {
    pushMatrix();
      translate(x, y);
      rotate (angulo);
      stroke(51);
      line(0, 0, -angulo, 0);
    popMatrix();
  }
  
  void move() {
   // x += vx;
   // y += vy;
    angulo += 0.02;
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