class Javi { // Se crea la clase
  float x, y, tx, ty, velx, vely, angulo;

  Javi(float x, float y, float tx, float ty, float velx, float vely, float angulo) {
    /*Se conectan las variables del código principal con las de la clase*/
    this.x = x;
    this.y = y;
    this.tx = tx;
    this.ty = ty;
    this.velx = velx * 0; //velocidad para que se muevan
    this.vely = vely * 0;
    this.angulo = angulo;
    
    c1 = color (#FFA7DB); // Rosado 
    c2 = color (#FFFCAA); // Amarillo
  }

  void linea(float nuevovalor, float grosor) { // se crean las figuras
    pushMatrix();
    translate(x, y);
    rotate(angulo);
    amt = map(x, 0, width, 0, 1.5);
    c3 = lerpColor(c1, c2, amt);
    strokeWeight(grosor);
    stroke(c3, 150); // Colores en degradé
    line(nuevovalor, -3, nuevovalor, 3);
    popMatrix();
  }

  void cap() {
    strokeCap(SQUARE);
  }

  void mover() { // Se genera el movimiento
    x += velx;
    y += vely;
 // angulo += 0.09; // las líneas de código que no se dibujen, no deben ir
    angulo -= 0.09; // Se determina la velocidad con la que giran los objetos y el sentido (cambia según si el número es positivo o nogativo)
  }

 void bordes() { // cada elemento tiene un espacio por donde rebotar
    if (x > tx || x < tx) {
      velx *= -1;
    }
    if (y > ty || y < ty) {
      vely *= -1;
    }
  } 
}