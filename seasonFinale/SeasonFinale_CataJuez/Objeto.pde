class Objeto {
  int i, index, paso, mint, maxt;
  float x, y, meanv, maxv, angulo, angulodos, radius;
  String titulo;
  boolean Speed;

  Objeto(int t_index, int t_maxt, int t_mint, int t_i) {

    x = 0;
    y = 0;
    this.angulo = angulo;   // no se usa
    this.angulodos = angulodos; // no se usa
    rectMode(CENTER);
    mint = t_mint;
    maxt = t_maxt;
    i = t_i;
    index = t_index;
  }
//Falta descripción del cuadro de texto
  void cuadrado() {
    float cuadrado = map(mint, -5, 23, 0, 10 );
    noStroke();
    fill (105, 150, 207);
    pushMatrix();
    translate(x, y);
    rotate(angulo);
    rect(radius, radius, cuadrado, cuadrado);
    popMatrix();
  }
//Falta descripción del cuadro de texto
  void cuadradodos() {
    float cuadradodos = map(maxt, 5, 39, 10, 30);
    stroke(206, 106, 106);
    strokeWeight(5);
    fill (255, 255, 255, 0);
    pushMatrix();
    translate(x, y);
    rotate(angulodos);
    rect(radius, radius, cuadradodos, cuadradodos);
    popMatrix();
  }
/*
Funciones en desuso

//Falta descripción del cuadro de texto
  void mover() {
    float mover = map(mint, 2, 40, 0, 0.2 );
    angulo += mover;
    ty++;
  }
//Falta descripción del cuadro de texto
  void moverdos() {
    float moverdos = map(maxt, 3, 47, 0, 0.3 );
    angulodos += moverdos;
    ty++;
  }
*/

//Falta descripción del cuadro de texto
  void dias(int paso) {
    //angulo = -PI/2;
    for (int i = 0; i < e.length; i++) {
      if (index >= i * paso && index < i * paso + paso) {
        float factor = map(paso, 7, 182, .03, .4);  
        float factor1 = map(paso, 7, 182, 1, .6); 
        float factor2 = map(paso, 7, 182, .09, .1); 
        float factor3 = map(paso, 7, 182, .9, .9); 

        float x1 = map(index % paso, 0, paso-1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365 / paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }
}