class Objeto {
  //variables globales de la clase
  int x, velx, vely;
  float y, amt;
  color c, c1, c2, c3, c4, cc, ccc;
  boolean v, h;

  //constructor
  Objeto(int x) {
    //inicialización de variables globales de la clase
    this.x = x;
    y = 10.5;
    velx = 4;
    vely = 6;
    c = color(97, 209, 206);
    c1 = color(93, 255, 70);
    c2 = color(255);
    c3 = color(0);
    c4 = color(120);
    v = true;
    h = false;
  }

  //Muestra un triángulo sin borde de color turqueza
  void display() {
    stroke(c4);
    strokeWeight(2);
    fill(c);
    triangle(x + 30, y, x, y + 60, x + 60, y + 60);
    ellipse(x, x, y, y);
  }

  //Mover a través del canvas
  void mover() {

    x += velx;
    y += vely;
  
    if (x > width - 40 / 2 || x < 40 / 2) {
      velx *= -1;
      amt = map(x, 0, width, 0, 1);                                 
      cc = lerpColor(c, c1, amt);                              
      ccc = lerpColor(c2, c3, amt);
    }

    if (y > height - 40 / 2 || y < 40 /2) {                         
      vely *= -1;                                                   
      amt = map(x, 0, width, 0, 1);                                 
      cc = lerpColor(c, c1, amt);                              
      ccc = lerpColor(c2, c3, amt);
      x++; //x += random();
    }
  }
}

  //Si llega al ancho, parte de cero y nuevo tamaño de ancho
  void borde() {
    if (x > width) {
      x = 0;
      y = random(5, 30);
    }
  }
 