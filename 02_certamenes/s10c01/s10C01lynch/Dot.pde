class Dot {

  float x, y, tx, ty, vx, vy, angulo, rot, dir;

  Dot (float x, float y, float vx, float vy, float angulo, int dir) {  // Constructor de Dot.
    this.x = x;
    this.y = y;
    this.vx = vx * 0.1;
    this.vy = vy * 0.1;
    this.angulo = angulo;
    this.dir = dir;
  }

/*  Mostrar figuras, estas son elipses que giran en su propio eje,
además de girar en torno a la grilla.
*/

  void displayRect() {  // Mostrar figuras, estas son elipses que giran en su
    pushMatrix();  
      translate(width / 3, height / 3);
      rotate(dir);
      dir += .02;  
      pushMatrix();
        translate(x, y);
        rotate(rot);
        rot += .2;
        noStroke();
        fill(y / 2, 0, y / 2);
        ellipse(0, 0, angulo * .75, angulo);
        pushMatrix();
          translate(10, 10);
          fill(70 + (y / 1.1), 0, 70 + (y / 1.1));
          ellipse(0, 0, angulo, angulo * .75);
        popMatrix();
      popMatrix();
    popMatrix();
  }

  void move() { // Esta función hace que las elipses roten, y crezcan de acuerdo al valor de angulo. 
    x += vx;
    y += vy;

    angulo += chng;
    if (angulo > 80) {
      chng = -chng;
    }
    if (angulo <10) {
      chng = -chng;
    }
  }

  void entropy() { // Con esta función se puede controlar el nivel de desorden de los ellipses.
    vx = -vx; //también puede ser *= -1
    vy = -vy;
  }
  
}