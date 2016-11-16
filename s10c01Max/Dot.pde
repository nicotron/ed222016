class Dot {
  //Llamar variables.
  float x, x2, y, y2, tx, ty, vx, vy, vx2, vy2;

  float grillax, grillay, finalx, finaly;
  
  float rotAngle;

  color c, c1;

  Dot (float x, float x2, float y, float y2, float tx, float ty, float vx, float vy, float vx2, float vy2, color c, color c1) {

    this.x = x;
    this.x2 = x2;
    this.y = y;
    this.y2 = y2;
    this.tx = tx;
    this.ty = ty;
    this.vx = vx * 0.1;
    this.vy = vy * 0.1;
    this.vx2 = vx2 * 0.1;
    this.vy2 = vy2 * 0.1;
    this.c = c;
    this.c1 = c1;

  }
  
//Definir formas y posición para los distintos estados 
  void display(int f) {
    if (f == 0) {
      pushMatrix();
      translate(width * .1, height * .1);
      noStroke();
      fill(c);
      ellipse(grillax, grillay, 20, 20);
      popMatrix();
    } else if (f == 1) {
      pushMatrix();
      translate(width * .02, height * .02);
      noStroke();
      fill(c1);
      rectMode(CENTER);
      rect(grillax, grillay, 15, 15);
      popMatrix();
    }
  }

//Generar el cambio de grilla
  void grilla(int f) {
    grillax = lerp(grillax, finalx, 0.1);
    grillay= lerp(grillay, finaly, 0.1);

    if (f == 0) {
      finalx = x;
      finaly = y;
    } else if (f == 1) {
      finalx = x2;
      finaly = y2;
    }
  }
//Movimiento instancia 1
  void move() {
    x += vx;
    y += vy;
    x2 = width / 2;
    y2 = y2;
  }
  
//Movimiento instancia 2
  void move2() {
   rotAngle++;
   rotate(radians(rotAngle / 50));
    x2 += vx / 10;
    y2 += vy / 20;
    x -= vx;
    y -= vy;
  }
}