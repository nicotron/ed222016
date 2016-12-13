class Objeto {
  //Variables globales de la clasee
  int x, velx, vely, t, i;
  float y, amt;
  color c1, c2, c3, c4;
  color bl;
  boolean a;

  //Constructor
  Objeto (int x) {
    //Inicialización de
    //Variables globales de la clase
    this.x = x;
    y = 10.5;
    //x1 = (int)random(width);
    //y1 = height / 2;

    velx = 4;
    vely = 6;

    t = 10;

    c1 = color (80, 149, 100);
    c2 = color (255, 0, 0);
    c3 = color (#7C3148);

    bl = color (255);

    a = true;
  }

  // Muestra una ellipse sin borde, de color magenta.
  void display() {
    noStroke();
    fill(c1);
    ellipse(x, x, y, y);
  }

  //Mover a través del canvas
  void mover() {
    x++;
    y++;

    x += velx;
    y += vely;

    if (a == true) {                             // Si la variable es verdadera, pasará o siguiente.
      ellipse(x, y, t * 2, t * 2);
    } else {
      a = false;
    }
    if (x > width - t / 2 || x < t / 2) {
      velx *= -1;
    }

    if (y > height - t / 2 || y < t / 2) {
      vely *= -1;
    }
  }
}

// Si llega al ancho, parte de cero y nuevo tamaño.
void borde() {
  if (x > width) {
    x = 0;
    y = random (5, 30);
  }
}