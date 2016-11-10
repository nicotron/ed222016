class Objects {  // Se crea la clase Objetos
  int i;  // Se crea la variable entera i
  float ix, inicio, inicio2, inicioM, fin, fin2;  // Se crean la variables decimales ix, inicio, inicio2, inicioM, fin, fin2

  Objects (int i, float ix, float inicio, float inicio2, float fin, float fin2) {  //Se ingresan los valores de las variables i, ix, inicio, inicio2, fin, fin2 provenientes de la otra ventana y se le asignan a las nuevas variables creadas anteriormente
    this.i = i;
    this.ix = ix;
    this.inicio = inicio;
    this.inicioM = inicio;
    this.inicio2 = inicio2;
    this.fin = fin;
    this.fin2 = fin2;
  }

// Se crea la función fondo, en que cada un cuarto de segundo la boolean t pasa de positivo a negativo afectando haciendo que la variable NUM_C vaya sumando o restando 1 y la variable e pase entre 200 y 300
  void fondo() {   
    if (frameCount % 15 == 0) {
      t = !t;
    } 
    if (t == false) {
      e = 200;
      NUM_C += 1;
    }
    if (t == true) {
      e = 300;
      NUM_C -= 1;
    }

// Se crean 3 for loop, en el primero se modifica el valor que va sumando q entre 200 y 300, en el segundo el valor que va sumando es  100, y en el tercero se dibujan el valor ingresado en la variable NUM_C veces i que es igual a su número correspondiente
    for (q = 0; q <= width; q += e) {
      for (w = 0; w <= height; w += 100) {
        for (int i = 0; i < NUM_C; i++) {

// Se modifica el tamaño de la elipse variando según el valor de NUM_C e i
          float sizeX = (100 - (i * (100 / NUM_C)));
          float sizeY = (100 - (i * (100 / NUM_C)));

          fill(160, 190, 110, 60);
          ellipse(q, w, sizeX, sizeY);
        }
      }
    }
  }

// Varía el valor de inicioM con un frameCount para los desplazamientos en el eje Y
  void configuracion() {
    inicioM = inicio;
    if (i % 2 == 0) {
      inicioM = inicio2;
    }
    inicio = lerp(inicio, fin, .2);
    inicio2 = lerp(inicio2, fin2, .2);

    if (frameCount % 60 == 0) {
      b = !b;
    } 
    if (b == true) {
      fin = height / 4;
      fin2 = 3 * (height / 4);
    }
    if (b == false) {
      fin = 3 * (height / 4);
      fin2 = height / 4;
    }
  }

//Se crea una función que hace un cambio de colores según la altura en el eje Y
  void colormap() {

    color partida = color(#6EAF6E);
    color termino = color(#4B674B);
    amt = map(inicioM, height / 4, 3 * height / 4, 0, 1); 
    partida = lerpColor(partida, termino, amt);
    fill(partida);
  }
  
  // Varía el valor de inicio M con un movimiento lineal para los desplazamientos en el eje Y
  void configuracion2() {
    inicioM = inicio;
    if (i % 2 == 0) {
      inicio = inicio2;
    }


    if (frameCount % 60 == 0) {
      b = !b;
    } 
    if (b == false) {
      inicio += 5;
      inicio2 -= 5;
    }
    if (b == true) {
      inicio -= 5;
      inicio2 += 5;
    }
  }

// Se dibujan líneas desde la mitad del alto hasta el valor de inicioM modificado en la configuración
  void dibujarlineas() {

    line(ix - width / 20, height / 2, ix, inicioM);
    line(ix, inicioM, ix +  width / 20, height / 2);
  }
  
// Se dibujan rectángulos desde la mitad del alto hasta el valor de inicioM modificado en la configuración


  void dibujarrectangulos() {

    quad(ix - width / 20, inicioM, ix + width / 20, inicioM, ix + width / 20, height / 2, ix - width / 20, height / 2);
  }

// Se dibujan círculos desde la mitad del alto hasta el valor de inicioM modificado en la configuración


  void dibujarcirculos() {

    ellipse(ix, inicioM, 8, 8);
  }

// Se dibujan triángulos desde la mitad del alto hasta el valor de inicioM modificado en la configuración

  void dibujartriangulos() {

    triangle(ix, inicioM, ix + width / 20, height / 2, ix - width / 20, height / 2);
  }
}