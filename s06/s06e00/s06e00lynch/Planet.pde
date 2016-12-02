class Planet {
  float x, y;
  float amt;
  int lim1, lim2;
  int velX, velY;

  Planet (float _x, float _y, int _lim1, int _lim2) {
    x = _x;
    y = _y;
    lim1 = _lim1;
    lim2 = _lim2;
    velX = 6;
    velY = 3;
  }

  void mov() {
    noStroke();
    if ( x > lim2  || x < lim1) {
      velX = -velX; // Rebote de la nave horizontal.
    }
    amt = map ( x, lim1, lim2, 0, 1);
    newC = lerpColor ( red, blue, amt); 
    fill(newC);
    ellipse ( x, y + random(10), 10, 10);
    x += velX;
  }

  void movH() {
    noStroke();
    if ( y > lim2  || y < lim1) {
      velY = -velY; // Rebote de la nave vertical.
    }
    amt = map ( y, lim1, lim2, 0, 1);
    newC = lerpColor ( red, blue, amt); 
    fill(newC);
    ellipse ( x  + random(10), y, 10, 10);
    y += velY;
  }
}