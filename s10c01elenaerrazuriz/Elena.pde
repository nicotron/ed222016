/*
Creación del class 'Elena', en el cual se escribirán todos los elementos necesarios para usar en el void draw y pestaña principal del documento, ya sean
 las funciones y declarar/inicializar variables.
 Se inicia con la declaración de todas las varables necesarias para la construcción de los elementos. 
 */
class Elena {
  float aDes, ra, x, y, tx, ty, velx, vely, angulo, amt, st;
  color mo, am, tu, na;

  /*
Espacio determinado como 'constructor' del código. En él se inicializan las variables, se construyen las funciones y es de donde la pestaña
   principal del código llama a los elementos a ser usados.
   */
  Elena (float x, float y, float tx, float ty, float velx, float vely, float angulo) {
    this.x = x;
    this.y = y;
    this.tx = tx;
    this.ty = ty;
    this.velx = velx * .5; //velocidad para que se mueva x por 0.5
    this.vely = vely * .5; //velocidad para que se mueva y por 0.5
    this.angulo = angulo;
    this.ra = 10;
    rectMode(CENTER); //dibujar cuadrados desde el centro
    ellipseMode(CENTER); //dibujar elipses desde el centro
    this.mo = color(156, 78, 133); //parámetros de color 
    this.am = color(252, 227, 0);
    this.tu = color(45, 204, 211);
    this.na = color(252, 76, 2);
  }

  /*
 Función que dibuja cuadrados de un tamaño variable, que se trasladan, rotan sobre sí mismos y rota la grilla completa en sí.
   */
  void dibujar(float t) { //variable a ser definida en el void draw
    rotate(angulo * .01); //rotar la grilla completa en sentido horario
    pushMatrix();//no dejar que la rotación anterior afecte a los elementos individualmente.
    translate(x / 2, y / 2);
    rotate(angulo);//rotar cada cuadrado sobre sí mismo
    fill(mo, (int)random(50, 90));
    noStroke();
    rect(0, 0, t, t);
    popMatrix();
  }

  /*
  Función que dibuja círculos de 5px de diámetro, que rotan dependiendo de un ángulo de desplazamiento y un radio de distancia, que va
   variando, haciendo que se aleje de las coordenadas de inicio o cambie el sentido del giro.
   */
  void circulos(color co) { //variable a ser definida en el void draw
    fill(co);
    noStroke();
    ellipse(x, y, 5, 5);
    x = ra * cos(aDes);
    y = ra * sin(aDes);
  }

  /*
Función que dibuja líneas diagonales, que se trasladan, cambiando su posición, tanto en x como en y. 
   */
  void linea(float st) { //variable a ser definida en el void draw
    pushMatrix();
    translate(x / 2, y / 2);
    stroke(na, 5);
    strokeWeight(st);
    line(0, 0, 20, -20);
    popMatrix();
  }

  /*
Función que mueve los elementos de sus posiciones originales en función a velx y vely, sumando de tanto en tanto.
   */
  void mover() {
    x += velx;
    y += vely;
  }

  /*
Función que rota los elementos de sus posiciones originales en función a un ángulo que se va sumando de tanto en tanto, en este caso de .03 en .03.
   */
  void rotar() {
    angulo += .03;
  }

  /*
Función para usar en seno y coseno. Construcción de cómo avanza la rotación en espiral de un elemento.
   */
  void espiralRotar(float di) {
    aDes -= di; //ángulo que avance
    ra += .35;  //radio, distancia, que se mueve
  }
}