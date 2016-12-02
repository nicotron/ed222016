class Objeto {
  //Variables globales de la calse
  int x, i;
  float y;
  color c;
  boolean b;
  
  //Constructor
  Objeto (int x) {
    //Inicialización de
    //Variables globales de la clase
    this.x = x;
    y = 10.5;
    c = color(255, 0, 255);
    b = true;
    
  }
  
  // Muestra una ellipse sin borde, de color magenta.
  void display() {
    noStroke();
    fill(c);
    ellipse(x, x, y, y);
  }
  
  //Mover a través del canvas
  void mover(){
    x++;
  }
  
  // Si llega al ancho, parte de cero y nuevo tamaño.
  void borde(){
    if (x > width) {
      x = 0;
      y = random (5, 30);
    }
  }
}