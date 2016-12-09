class Cuerpo {
  // variables globales de la clase 
  float v, x, y, tm, velx, vely, a, tx, ty, maxh, meanh, minh, humx, humn, humean, mean, wndspm, wndspx;
  float amt, wind, wndsm, wndsx;
  color azul, rojo, morado, verde, blanco, celeste, midnightblue, p, celeste2, morado2;
  String dia;
  int index, i;
  float mtx, mtmn, mtn, mhx, mhmn, mhn, mw, mw2, wndx;


  Cuerpo(int index, String dia, float maxt, float meant, float mint, float humx, float humean, float humn, float wind, float wndspm, float wndspx, int i) {
    // inicializar varialbles con valores desde el constructor
    this.dia = dia; // no se usa
    this.tx = maxt;
    this.ty = meant;
    this.tm = mint;
    this.maxh = humx;
    this.meanh = humean;
    this.minh = humn; // no se usa
    this.wind = wind;
    this.index = index;
    this.wndsm = wndspm;
    this.wndsx = wndspx; // no se usa
    velx = 1; // no se usa
    vely = 1; // no se usa

    this.azul = color(39, 90, 252); // no se usa
    this.celeste = color(100, 149, 237);
    this.midnightblue = color(25, 25, 112);
    this.rojo = color(252, 68, 39);
    this.morado = color(152, 39, 252);
    this.verde = color(146, 224, 63);
    this.blanco = color(255, 255, 255); // no se usa
  }

  // temperatura maxima
  void tempx() {

    pushMatrix();
    mtn = map(tm, 20, -40, 10, 50);
    float col = map(tx, -35, 25, 0, 1);
    p = lerpColor(morado, rojo, col);
    fill(p);
    noStroke();
    ellipse(x, y, mtn, mtn);
    popMatrix();
  }
  // temperatura minima
  void tempn() {

    pushMatrix();
    mtx = map(tx, 28, -36, 10, 50);
    float col = map(ty, -35, 25, 0, 1);
    p = lerpColor(midnightblue, celeste, col);
    fill(p);
    noStroke();
    ellipse(x, y, mtx, mtx);
    popMatrix();
  }
  // velocidad media del viento
  void windsdp() {

    pushMatrix();
    mhx = map(maxh, 100, 60, 5, 100);
    wndsm = map(wndspm, 29, 0, 50, 25);
    float col = map(meanh, 43, 98, 0, .99);
    p = lerpColor(celeste, morado, col);
    noStroke();
    fill(p);
    rect(x, y, wndsm * .5, wndsm);  
    popMatrix();
  }

  // direccion del viento
  void viento() {

    pushMatrix();
    mw = map(wind, 359, 5, 100, 300);
    mw2 = map(wind, 359, 5, 7, 3);
    translate(width / 2, height / 2);
    float col = map(mw, 100, 300, 0, 1); // esto contradice la linea 78
    p = lerpColor(celeste, verde, col);
    strokeWeight(mw2);
    stroke(p);
    rotate(radians(TWO_PI / 365 * index * 100));
    line(100, 0, mw, 0);
    popMatrix();
  }


  // velocidad maxima viento
  void wndrec() {

    pushMatrix();
    wndx = map(wndspx, 29, 0, 10, 3);
    mw = map(wind, 359, 5, 1, 100);
    float col = map(mw, 5, 359, 0, 1);
    p = lerpColor(rojo, verde, col);
    stroke(p);
    strokeWeight(wndx);
    line(x, y, x + 15, y);
    popMatrix();
  }

  // temperatura media
  void meant() {

    pushMatrix();
    mtmn = map(ty, 25, -37, 10, 50);
    float col = map(ty, -35, 25, 0, .9);
    p = lerpColor(celeste, verde, col);
    fill(p);
    noStroke();
    rect(x + 10, y +10, mtmn * .15, mtmn); 
    popMatrix();
  }

  // todos los dias columnas

  void dias(int paso) {

    for (int i = 0; i < c.length; i++) {
      if (index >= i * paso && index < i * paso + paso) {
        float factor = map(paso, 7, 182, .1, .001);
        float factor1 = map(paso, 7, 182, .9, .9);
        float factor2 = map(paso, 7, 182, .1, .001);
        float factor3 = map(paso, 7, 182, .9, .9);

        float x1 = map(index % paso, 0, paso-1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365/paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }

  void dia(int paso) {

    for (int i = 0; i < c.length; i++) {
      if (index >= i * paso && index < i * paso + paso) {
        float factor = map(paso, 7, 182, .8, .15);
        float factor1 = map(paso, 7, 182, .9, .9);
        float factor2 = map(paso, 7, 182, .5, .05);
        float factor3 = map(paso, 7, 182, .9, .9);

        float x1 = map(index % paso, 0, paso - 1, width * factor2, width * factor3);
        x = x1;

        float y1 = map(i, 0, 365 / paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }
}


//si el código no va y está comentado, no debe ir escrito

// variables y maps listado

//  mtx = map(tx, 28, -36, 10, 50);
//  mtmn = map(ty, 25, -37, 30, 50);
//  mtn = map(tm, 20, -40, 10, 50);
//  mhx = map(maxh, 100, 60, 5, 100);
//  mhmn = map(meanh, 98, 43, 15, 50);
//  mhn = map(minh, 89, 14, 20, 60);
//  mw = map(wind, 359, 5, 1, 100);
//  wnds = map(wndspm. 29, 0, 1, 0);
//  wndx = map(wndspx. 29, 0, 1, 0);