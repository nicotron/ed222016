class Cata2 {

  // Creamos nuestros float y int que usaremos en nuestro código
  float y, x;
  float r = random(5, 30);
  float g = random(50, 100);
  float b = random(100, 200);
  color color4;

  // Mencionamos nuestros float o int que usaremos en este class, además de  definir el color a usar.
  Cata2 (float x) {
    this.x = x;
    color4 = color(r, g, b + r, 7);
  }

  // Creamos un void específicos para nuestros círculos.
  void dibujarCirculo() {
    pushMatrix();
    noStroke();
    fill(color4);
    ellipse(x * 5, y + r, r, r);
    ellipse(x * 5, y + r * 5, r, r);
    ellipse(x * 5, y + r * 10, r, r);
    ellipse(x * 5, y + r * 20, r, r);
    popMatrix();
  }

  // Definimos nuestro valor de x, que será el responsable de darle velocidad a nuestros objetos.
  void mover() {
    x++;
  }

  // Acá hacemos posible que nuestra línea de círculos se repita como un bucle, (cuando x * 5 sea mayor al ancho, entonces x  vuelve a ser 0 ). 
  void borde() {
    if (x * 5 > width) {
      x = 0;
    }
  }
}