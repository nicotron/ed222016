class Objeto {      //se crea la clase
  int a;      //se crean las variables enteras
  float x, y, i, tx, ty, velx, vely, angulo, xr, yr;      //se crean las variables
  color[] c1 = new int [2];
  color ao, gc, go, t;      //declaración de colores

  //inicializar las variables
  Objeto (float x, float y, float tx, float ty, float velx, float vely, float angulo) {
    this.x = x;
    this.y = y;
    this.tx = tx;
    this.ty = ty;
    this.velx = velx * 0.2; //velocidad para que se muevan
    this.vely = vely * 1;
    this.angulo = angulo;
    // this.ao = color(57, 98, 83);      //amarillo oscuro
    this.gc = color(314, 1, 94);      //gris claro
    // this.go = color(49, 4, 54);      //gris oscuro
    c1[0] = color(57, 98, 83); // igual al ao
    c1[1] = color(49, 4, 54); // igual al go
    xr = 32;      //x del rombo
    yr = 32;      //y del rombo
  }

  void dibujarRombo() {
    pushMatrix();      //cambiar el estado de las coordenadas
    noFill();      //sin relleno
    strokeWeight(3);      //grosor de la línea 
    stroke(c1[1]);      //color gris oscuro

    quad(x + xr / 2, y, x + xr, y + yr / 2, x + xr / 2, y + yr, x, y + yr / 2);      //se dibuja el rombo
    popMatrix();      //volver al estado original de las coordenadas
  }

  void dibujarLinea() {
    pushMatrix();      //cambiar el estado de las coordenadas
    translate(x + 16, y + 16);      //posición
    angulo += 0.04;      //rotación
    rotate(angulo);      //rotación
    strokeWeight(3);      //grosor de la línea
    stroke(c1[0]);      //color línea amarillo oscuro

    line(-3, 3, 3, -3);      //se dibuja la línea
    popMatrix();      //volver al estado original de las coordenadas
  }

  //movimiento de la línea
  void movimiento() {      
    a = 1;
    a++;
  }

  void dibujarFlecha() {
    pushMatrix();      //cambiar el estado de las coordenadas   
    if (a >= frameCount % 30) {      //velocidad de cambio de color
      a = 1;
    }
    a++;
    t = c1[(int) random(2)];      //array para cambio de color
    frameRate(10);      //tiempo para cambio de color - el uso de esta función modifica todo el programa, debe ir en setup o no ir
    strokeWeight(2);      //ancho de la línea
    stroke(t);       //color de la línea

    line(x - 10 + a, y - 10 + a, x + 5 + a, y + 5 + a);      //se dibuja la línea
    fill(t);      //color relleno triángulo
    triangle(x + 10 + a, y + a, x + 10 + a, y + 10 + a, x + a, y + 10 + a);      //se dibuja el triángulo
    popMatrix();      //volver al estado original de las coordenadas
  }

  //función velocidad de movimiento
  void mover() {
    // pushMatrix();      //cambiar el estado de las coordenadas   
    x += velx;
    y += vely;
    // popMatrix();      //volver al estado original de las coordenadas
  }

  //función grilla de movimiento
  void bordes() {
    // pushMatrix();      //cambiar el estado de las coordenadas   
    if (x > tx || x < tx - 2) {
      velx *= -1;
    }
    if (y > ty || y < ty - 1) {
      vely *= -1;
    }
    // popMatrix();      //volver al estado original de las coordenadas
  }
}