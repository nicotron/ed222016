/* la clase esta declarada, junto con sus varialbes*/
class Body {
  float x, y, rx, ry, angle;
  Body (float x, float y, float rx, float ry, float mx, float my, float angle) {

    this.x = x;
    this.y = y;
    this.rx = rx;
    this.ry = ry;
    // this.mx = mx * .5;
    // this.my = my * .5;
    this.angle = angle;
  }

/* en este primer void se generan lineas de color morado que giran sobre su origen
en sentido contrario al horario por la funcion rotate*/
  void lmor() {

    pushMatrix();
    translate(x, y);
    rotate(angle * -1);
    stroke(96, 59, 133);
    line(0, 0, 10, 0);
    popMatrix();
  }
/*genera lineas verdes que rotan sobre su origen en sentido contrario*/
  void lver() {
    pushMatrix();
    translate(x, y);
    rotate(angle * -1);
    stroke(174, 236, 65);
    line(0, 0, 0, 10);
    popMatrix();
  }
/* se generan lineas moradas pero estas giran en sentido del horario*/
  void lmor2() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    stroke(96, 59, 133);
    line(0, 0, 10, 0);
    popMatrix();
  }
/*esta corresponde a la segunda linea verde que gira contrario de la otra linea verde*/
  void lver2() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    stroke(174, 236, 65);
    line(0, 0, 0, 10);
    popMatrix();
  }
  
  /*este void genera la velocidad de la rotacion de las lineas*/
  void rotar() {
    angle += 0.05;
  }
}