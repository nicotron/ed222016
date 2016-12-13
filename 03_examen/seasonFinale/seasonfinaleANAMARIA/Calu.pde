class Calu {
  int index, paso, maxte, meante, minte, maxhu, meanhu, minhu, nube;
  float x, y, numero, an, t, pre;
  color blanco, verdeo, rojo, naranjo, amarillo, morado, d, f, g, h;
  String titulo;

  Calu(int index, int maxte, int meante, int minte, int maxhu, int meanhu, int minhu, float pre, int nube) {

    x = 0;
    y = 0;
    rectMode(CENTER);

    this.index = index;
    this.maxte = maxte;
    this.meante = meante;
    this.minte = minte;
    this.maxhu = maxhu;
    this.meanhu = meanhu;
    this.minhu = minhu;
    this.pre = pre;
    this.nube = nube;

    //colores
    this.blanco = color(228, 219, 215);
    this.verdeo = color(15, 114, 108);
    this.rojo = color(194, 56, 59);
    this.naranjo = color(206, 110, 35);
    this.amarillo = color(236, 221, 40);
    this.morado = color(96, 42, 105);
  }

  //TEMPERATURA
  void temp() {
    pushMatrix();
    //máxima
    float ma = map(maxte, -1, 36, 0, 1);
    d = lerpColor(rojo, amarillo, ma);

    noStroke();
    fill(d);
    float max = map(maxte, -1, 36, 0, 50);
    ellipse(x + 16, y + 8, max, max);

    //mean
    float me = map(meante, -4, 28, 0, 1);
    f = lerpColor(morado, naranjo, me);

    noStroke();
    fill(f);
    float mea = map(meante, -4, 28, 0, 35);
    ellipse(x + 8, y + 8, mea, mea);


    //mínima
    float mi = map(minte, -9, 19, 0, 1);
    g = lerpColor(verdeo, blanco, mi);

    noStroke();
    fill(g);
    float min = map(meante, -4, 28, 0, 20);
    ellipse(x, y, min, min);
    popMatrix();
  }

  //HUMEDAD
  void humedad() {
    pushMatrix();
    //máxima
    float ma = map(maxhu, 49, 100, 0, 30); //el map es diferente para el set de variable
    noStroke();
    fill(blanco, 160);
    rect(x, y + 40, ma, ma);

    //mean
    float me = map(meanhu, 32, 97, 0, 30); //el map es diferente para el set de variable

    fill(verdeo, 160);
    rect(x, y + 20, me, me);

    //mínimo
    float mi = map(minhu, 10, 93, 0, 30); //el map es diferente para el set de variable

    fill(amarillo, 160);
    rect(x, y, mi, mi);
    popMatrix();
  }

  //PRECIPITACIONES
  void precipitacion() {
    float precipit = map(pre, 0.00, 9.91, 210, 300); // si no hubieron lluvias igual se ve una línea de 10px, lo que dificulta el entendimiento de los datos
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(radians(270));
    rotate(radians(index * 360 / 365));
    stroke(verdeo);
    strokeWeight(2);
    line(200, 0, precipit, 0);
    popMatrix();
  }

  //NUBES
  void nubes() {
    pushMatrix();
    float nu = map(nube, 1, 8, 0, 10);
    h = lerpColor(verdeo, blanco, nu);
    noStroke();
    fill(h);
    float nub = map(nube, 1, 8, 0, 30);
    ellipse(x + 10, y, nub, nub);
    popMatrix();
  }

  //El titulo debe describir mejor la función
  void dias(int paso) {
    for (int i = 0; i < o.length; i++) {
      if (index >= i * paso && index < i * paso + paso) {
        float factor = map(paso, 7, 182, .03, .4);  
        float factor1 = map(paso, 7, 182, 1, .6); 
        float factor2 = map(paso, 7, 182, .09, .1); 
        float factor3 = map(paso, 7, 182, .9, .9); 

        float x1 = map(index % paso, 0, paso - 1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365 / paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }

  //circulo
  void circulo(int paso) {
    an = -PI / 2;
    for (int i = 0; i < o.length; i++) {
      if (index >= i * paso && index < i * paso + paso) {
        float factor = map(paso, 7, 182, .03, .4);  
        float factor1 = map(paso, 7, 182, 1, .6); 
        float factor2 = map(paso, 7, 182, .09, .1); 
        float factor3 = map(paso, 7, 182, .9, .9); 

        float x1 = map(index % paso, 0, paso - 1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365 / paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }
}