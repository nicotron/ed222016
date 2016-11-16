class Plan {

  float px, px2, py, py2, cc, posX, posY, a, a2, velX, velY;
  float r = 30;

  Plan(float px, float py, float cc, float posX, float posY) { // Constructor de Plan.
    this.px = px;
    this.py = py;
    this.cc = cc;
    this.posX = posX;
    this.posY = posY;
  }

  void displayPlan() { // Acá se dibujan los Plan, son varios ellipses de colores distintos.
    px2 = px;
    py2 = py;
    noStroke();
    fill(cc, cc, 100);
    ellipse(px, py, 8, 8);
    fill(100, cc, cc);
    ellipse(px * 2, py * 1.5, 6, 6);
    fill(cc, 100, cc);
    ellipse(px2 * 1.5, py2 * 2, 10, 10);
    fill(22, 0, 22);
    ellipse(posX, posY, 22, 22);
  }

  void movePlan() { // Esta función mueve los Plan en órbitas alrededor del ellipse mas grande.
    velX = .05;
    velY = .06;
    px = r * cos(a) + (posX);  
    py = r * sin(a) + (posY); 
    px2 = r * cos(a2) + (posX);  
    py2 = r * sin(a2) + (posY); 
    a += velX; 
    a2 -= velX;
  }

  void spir() { // Esta función permite controlar la amplitud de la órbita.
    if (spire == true) {
      r += velY;
      println(r);
    } else if (spire == false) {
      r -= velY;
      println(r);
    }
  }
}