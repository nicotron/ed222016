//Crea clase Gabi
class Gabi {
  boolean on;
  float x, y, x1, y1, velx, vely, angulo;
  float ang = 95;
// Conección entre las variables del código principal s10c01gabi con las de la clase Gabi
  Gabi (float x, float y, float x1, float y1, float velx, float vely, float angulo) {
    this.x = x;
    this.y = y;
    this.x1 = x1;
    this.y1 = y1;
    //Velocidad con la que se moverán
    this.velx = velx * 2;
    this.vely = vely * 2;
    // this.angulo = angulo;
    angulo = 0.08;
  }

  void dibujo() {
    pushMatrix();
    noStroke();
    //Color Turqueza
    fill(97, 209, 206);  
    // ellipse(x, y, 4, 4); // si no se va a mostrar, no se escribe
    popMatrix();
  }

//Crean las figuras 
  void linea(float angulo) { // este argumento no se usa nunca
    pushMatrix();
    translate(x, y);
    rotate(ang);
    stroke(120);
    line(0, 0, 10, 10);
    popMatrix();
  }

  //cambiar estados del boolean
  void contra() {
    if (frameCount % 150 == 0) {
      on = !on;
    }

    if (on == true) {
      pushMatrix();
      translate(x + 15, y + 15);
      rotate(angulo - 180);
      stroke(120);
      line(0, 0, 10, 10);
      noStroke();
      fill(97, 209, 206);

      popMatrix();
    } else if (on == false) {
        pushMatrix();
        translate(x - 15, y - 15);
        rotate(angulo);
        stroke(120);
        strokeWeight(1.5);
        fill(97, 209, 206);
        rect(10, 10, 20, 20);
        popMatrix();
    } 
  }
  
  // Genera movimiento
  void mover() {
    x += velx;
    y += vely;
    // angulo = 0.08; // esta variable si es estática para todo el programa, debe ser inicializada en el Constructor
  }

// Grilla en el canvas
  void bordes() {
    if (x > x1 || x < x1 - 50) {
      velx *= -1;
    }
    if (y > y1 || y < y1 - 50) {
      vely *= -1;
    }
  }
}