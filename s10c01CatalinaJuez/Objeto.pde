class Cata {

  // Creamos nuestros float y int que usaremos en nuestro código

  float  x, y, tx, ty, velx, vely, angulo, radius;
  float r = random(10, 30);
  float g = random(50, 100);
  float b = random(100, 200);
  color color1; 
  color color2; 
  color color3;
  color color4;

// Mencionamos nuestros float o int que usaremos en este class, que se comunica con nuestro total que se encuentra en la página principal luego del for (e[total] = new Cata (x, y, z) ).
  Cata (float x, float y,  int angulo) {
    this.x = x;        
    this.y = y;
    this.angulo = angulo;

    color1 = color(r + g, g, b + g, 70); 
    color3 = color(r, g, b + r, 45);
    color4 = color(r, g, b + r, 45);
  }

// Creamos un void específicos para nuestra línea.
  void dibujarLinea() {
    pushMatrix();
    translate(x, y);
    rotate(-angulo);
    strokeWeight(4);
    stroke(color3);
    line(0, 0, r, 0);
    popMatrix();
  }

// Creamos un void específicos para nuestro triángulo.
  void dibujarTriangulo() {

    fill(color1);
    noStroke();
    pushMatrix();
    translate(x, y);
    rotate(angulo * 2);
    triangle(radius, 0, 40, 0, 2, 15);
    popMatrix();
  }

// Definimos nuestro valor para los elementos que usaremos para dar velocidad a nuestros objetos.
  void mover() {
    angulo += 0.02;
    ty++;
  }
}