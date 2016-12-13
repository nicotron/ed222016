class Objeto {
  // Variables globales de la clase
  int x;
  float y;
  color b, bl, am, fc, ci;


  //Constructor
  Objeto (int x) {
    //Inicialización de
    //variables globales de la clase
    this.x = x;
    y = 10.5;
    bl = color (255, 0, 255);  //Blanco
    am = color (255, 255, 0); //Amarillo
    fc = color (255, 0, 255); //Fucsia
    ci = color (0, 255, 255); //Cian
  }

  //Muestra una elipse sin borde, de color magenta
  void lineas() {
    fill(b);
    stroke(b);
    strokeWeight(2);
    line( x, y, x + 4, y); //Línea(a)
    line( x, y, x, y - 4); //Línea(b)
    line( x - 4, y + 4, x - 4, y + 8);//Línea(c)
    line(x, y, x - 4, y + 4); //Línea(d)
    println("¡Funciona!");
  }


  //Mover a través del canvas
  void colores() {
    if (x < width/2) {
      b = am;
    } else if (x > width/2) {
      b = ci;
    }


    x++;
  }

  //Si llega al ancho, parte de cero y nuevo tamaño
  void borde() {
    if (x > width) {
      x = 0;
      y = random(5, 30);
    }
  }
}