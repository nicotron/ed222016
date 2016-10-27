class Hola {
  /*Se declaran las variables globales de la clase*/
  float x, y, a, r, e, tx, ty, vx, vy, angulo;
  color carmesi, amarillo, blanco;

  Hola (float x, float y, float tx, float ty, float vx, float vy, float angulo) {
    this.x = x;
    this.y = y;
    this.r = 10;
    this.tx = tx;
    this.ty = ty;
    this.angulo = angulo;
    this.vx = vx * 0.2;
    this.vy = vy * 0.2;
    this.carmesi = color(220, 20, 60);
    this.amarillo = color(255, 255, 0);
    this.blanco = color(255);
  }
  /*pushMatrix(); sirve para cambiar el estado de las coordenaras y 
   popMatrix(); para devolver el estado actual de las coordenadas,
   encerrando todas las funciones que están dentro de ellos*/

  void margarita() {
    pushMatrix();               
    translate(x, y); 
    e += vy;
    stroke(blanco);
    strokeWeight(10);
    point (x, y + 4 + e);
    point (x + 4, y + e);
    point (x + 8, y + 4 + e);
    point (x + 4, y + 8 + e);
    fill(amarillo);
    noStroke();
    rect(x + 4, y + 4 + e, 10, 10);
    popMatrix();
  } 

  /*Flor, dibujo 4 círculos*/
  void flor() {
    pushMatrix();                                                                          
    translate(x, y);     
    noStroke(); 
    fill(carmesi);
    point(x - 5, y - 5); // para qué? cual es el proposito de la vida? ah?
    ellipse(x, y, 6, 6);
    ellipse(x + 10, y + 10, 6, 6);
    ellipse(x, y + 10, 6, 6);
    ellipse(x + 10, y, 6, 6);
    popMatrix();
  }
  
  /* Movimiento, en base a (x, y)*/
  void mover() {
    x += vx;
    y += vy;
  }

/*Movimiento líneas en base a cada punto (x, y)*/
  void moverlo() {
    x += vx;
    y += vy;
    angulo += 0.02;
  }


  void linea() {
    pushMatrix();
    translate(x, y);
    rotate(angulo);
    strokeWeight(5);
    stroke(blanco);
    line(0, 0, 10, 0);
    popMatrix();
  }

  void dibujar() {
    pushMatrix();
    translate(width * .15, height * .15);
    noFill();
    strokeWeight(1);
    popMatrix();
  }

  void borde() {
    if (x > tx || x < tx - 10) {
      vx *= -1;
    }
    if (y > ty || y < ty - 10) {
      vy *= -1;
    }
  }
}