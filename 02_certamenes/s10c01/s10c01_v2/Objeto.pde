class Objeto {
  int f;                                           
  float a, b, e, k, x1, y1, y2;                                                                    
  color c1, c2;

  Objeto() {
    x = 0;  
    y = 0;    
    a = 0;     
    b = 0;   
    c2 = color (0, 0, 100);
  }
  void aumen() {                    // a y b son variables que crean el movimiento y cambian el color.
    a++;                                                            
    b++;
    x1= -e;                         // Variacion en las lineas blancas (leve diagonalidad).
    y1 = 50+ e;                     // Cima grilla lineas blancas, con variacion periodica.                                             
    y2 = 550- e;                    // Sima grilla lineas blancas, con variacion periodica.
    if (b>200) {                    // Necesitaba que b siguiera un ciclo de (0-200) para cambiar el color.
      b*=0;
    }
  }
  void grilla() {                   // Doble for de elipses creciendo en tamaño y cambiando de color.
    strokeWeight(8);
    for (i = 0; i <= width; i += 120) {
      for (j = 0; j <= height; j += 120) {
        c1 = color(b/2, 100, 70);   
        stroke(c1);
        ellipse(i, j, 40 + 14 * sin(a / 30), 40 + 14 * sin(a / 30));
      }
    }
  }


  void lineas() {           /* Malla de lineas blancas en una grilla, con dos funciones,
                               con sus parametros invertidos para formar una cruz.*/
    stroke(c2);
    strokeWeight(5);
    for (x = 0; x < width; x += 50) {
      line(y1, (width / 2) - 260 * sin(((a / 20) + x)), 
        y2, (width / 2) - 260 * sin(((a + x1) / 20) + x));
    }

    for (x = 0; x < width; x += 50) {
      line((width / 2) - 260 * sin(((a / 20) + x) * k), y1, // La variable (k) logra el cono.
        (width / 2) - 260 * sin(((a + x1) / 20) + x), y2);
    }
  }

  void timer1() {                // Movimiento suave del cambio de grilla.
    if (d == true) {
      f = 0;
      e = lerp(e, f, .05);
    }
    if (d == false) {
      f = 150;
      e = lerp(e, f, .05);
    }
  }
  void timer2() {                // Cambio a cono.
    if (h == true) {
      k = 0;
    }
    if (h == false) {
      k = 1;
    }
  }
}