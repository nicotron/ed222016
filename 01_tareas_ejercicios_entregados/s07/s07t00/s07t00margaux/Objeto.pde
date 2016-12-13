class Objeto {
  // Variables globales de la clase
  int x, t;
  float y, amt, tam;
  color c, c1, c2, c3;
  boolean b;
  
  // Constructor
  Objeto (int x) {
   // Inicializacion de 
   // variables globales de la clase
     c1 = color(34, 12, 211);
     c1 = color(200, 0, 50);
     c3 = color(5, 155, 200);
     t = 50;
     this.x = x;
     y = 10;
     c = color(255, 0, 255);
     b = true;
  }

  // Muestra una elipse sin borde, de color magenta
  void display() {
    amt = map(mouseX, 0, width, 0 , 1);
    c3 = lerpColor(c1, c2, amt);
    fill(c3);
    noStroke();
    ellipse(x, y, t, t);    
  }
  
  //
  void mover() {
    x++;
  }
  
  void borde() {
    if (x > width){
      x = 0;
      y = random(5, 30);
    }
  }
  
}