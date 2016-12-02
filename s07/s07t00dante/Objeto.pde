class Objeto {  // Se crea una clase llamada Objeto
  int x;  //Se crea la variable entera x
  int y;  //Se crea la variable entera y
  Objeto (int x, int y) {  // El constructor Objeto incorpora las variables enteras x e y
    this.x = x;  // La variable x de la clase es igual a la variable x declarada en el momento de llamar la clase
    this.y = y;  // La variable y de la clase es igual a la variable y declarada en el momento de llamar la clase
  }

  void triangulos_exteriores(int x, int y) {  //se crea la función triangulos_exteriores, agregándole los valores x e y
    int a= 6;  //la variable entera a es 6

    //Los triángulos que se dibujarán a continuación (4 triángulos), irán en la parte superior de cada módulo, dibujándose de izquierda a derecha. Cada triángulo será de igual tamaño y mirarán hacia abajo 

    triangle(x, y, x + (width / 48), y, x + (width / 96), y + a);
    triangle(x + (width / 48), y, x + (width / 24), y, x + (width / 32), y + a);
    triangle(x + (width / 24), y, x + (width / 16), y, x + (5 * width / 96), y + a);
    triangle(x + (width / 16), y, x + (width / 12), y, x + (7 * width / 96), y + a);



    //Los triángulos que se dibujarán a continuación (4 triángulos), irán en la parte inferior de cada módulo, dibujándose de izquierda a derecha. Cada triángulo será de igual tamaño y mirarán hacia arriba  

    triangle(x, y + (height / 9), x + (width / 48), y + (height / 9), x + (width / 96), y - a + (height / 9));
    triangle(x + (width / 48), y + (height / 9), x + (2 * width / 48), y + (height / 9), x + (3 * width / 96), y - a + (height / 9));
    triangle(x + (width / 24), y + (height / 9), x+(3 * width / 48), y + (height / 9), x + (5 * width / 96), y - a + (height / 9));
    triangle(x + (width / 16), y + (height / 9), x + (4 * width / 48), y + (height / 9), x + (7 * width / 96), y - a + (height / 9));   


    //   Los triángulos que se dibujarán a continuación (4 triángulos), irán en el costado izquierdo de cada módulo, dibujándose de arriba hacia abajo. Cada triángulo será de igual tamaño y mirarán hacia la derecha 
    triangle(x + (width / 12), y, x + (width / 12), y + (height / 36), x - a + (width / 12), y + (height / 72));
    triangle(x + (width / 12), y + (height / 36), x + (width / 12), y + (height / 18), x - a + (width / 12), y + (height / 24));
    triangle(x + (width / 12), y + (height / 18), x + (width / 12), y + (height / 12), x - a + (width / 12), y + (7 * height / 96));
    triangle(x + (width / 12), y + (height / 12), x + (width / 12), y + (height / 9), x - a + (width / 12), y + (9 * height / 96));


    //   Los triángulos que se dibujarán a continuación (4 triángulos), irán en el costado derecho de cada módulo, dibujándose de arriba hacia abajo. Cada triángulo será de igual tamaño y mirarán hacia la izquierda
    triangle(x, y, x, y + (height / 36), x + a, y + (height / 72));
    triangle(x, y + (height / 36), x, y + (height / 18), x + a, y + (height / 24));
    triangle(x, y + (height / 18), x, y + (height / 12), x + a, y + (7 * height / 96));
    triangle(x, y + (height / 12), x, y + (height / 9), x + a, y + (9 * height / 96));


    //   Los triángulos que se dibujarán a continuación (2 triángulos), irán en el costado derecho, en el centro de cada módulo, dibujándose uno hacia arriba y otro hacia abajo. Cada triángulo será de igual tamaño 
    triangle(x, y + (height / 18), x + (width / 48), y + (height / 18), x + (width / 96), y + a + (height / 18));
    triangle(x, y + (height / 18), x + (width / 48), y + (height / 18), x + (width / 96), y - a + (height / 18));


    //   Los triángulos que se dibujarán a continuación (2 triángulos), irán en el costado inferior, en el centro de cada módulo, dibujándose uno hacia la izquierda y otro hacia la derecha. Cada triángulo será de igual tamaño 
    triangle(x + (width / 24), y + (height / 12), x + (width / 24), y + (height / 9), x + a + (width / 24), y + (9 * height / 96));
    triangle(x + (width / 24), y + (height / 12), x + (width / 24), y + (height / 9), x - a + (width / 24), y + (9 * height / 96));

    //   Los triángulos que se dibujarán a continuación (2 triángulos), irán en el costado izquierdo, en el centro de cada módulo, dibujándose uno hacia arriba y otro hacia abajo. Cada triángulo será de igual tamaño 
    triangle(x + (width / 16), y + (height / 18), x + (width / 12), y + (height / 18), x + (7 * width / 96), y + a + (height / 18));
    triangle(x + (width / 16), y + (height / 18), x + (width / 12), y + (height / 18), x + (7 * width / 96), y - a + (height / 18));


    //   Los triángulos que se dibujarán a continuación (2 triángulos), irán en el costado superior, en el centro de cada módulo, dibujándose uno hacia la izquierda y otro hacia la derecha. Cada triángulo será de igual tamaño 
    triangle(x + (width / 24), y, x + (width / 24), y + (height / 36), x + a + (width / 24), y + (height / 72));
    triangle(x + (width / 24), y, x + (width / 24), y + (height / 36), x - a + (width / 24), y + (height / 72));
  }

  void elipse_central(int x, int y, float r) {  //se crea la función elipse_central, agregándole los valores x, y, r
    float color_strokeweight = map(mouseX, 0, width, 0, 2); // la variable decimal color_strokeweight tomará los valores ingresados por el mouse en el eje X, dándole valores entre o y 2
    strokeWeight(color_strokeweight);  //el valor del strokeweight desde ahora será igual a la variable recién mencionada.
    ellipse(x + (width / 24), y + (height / 18), r / 2, r / 2); // se dibuja una elipse en el centro de la figura con diámetro igual al valor asignado por el random dentro de la variable r
  }
}