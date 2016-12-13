class Miami2005 {

  //Declarar las variables del class
  String dia;

  int index;
  float x, y;

  int tmax, tmean, tmin, vmax, vmean, vmin, hmax, hmean, hmin, clouds, rain, gust, wind;
  color red = color(255, 0, 0);
  color green = color(0, 255, 0);
  color blue = color(0, 0, 255);

  Miami2005(int index, String dia, int tmax, int tmean, int tmin, int vmax, int vmean, int vmin, int hmax, int hmean, int hmin, int clouds, int rain, int gust, int wind) {

    //Iniciar variables
    this.index = index;
    this.dia = dia; // sin uso
    this.tmax = tmax;
    this.tmean = tmean;
    this.tmin = tmin;
    this.vmax = vmax;
    this.vmean = vmean;
    this.vmin = vmin;
    this.hmax = hmax;
    this.hmean = hmean;
    this.hmin = hmin;
    this.clouds = clouds;
    this.rain = rain;
    this.gust = gust;
    this.wind = wind;
  }

  //Funciones dentro de la clase
  void meses(int paso) {
    for (int i = 0; i < m.length; i++) {
      if (index >= i * paso && index < i * paso + paso) {
        float factor = map(paso, 7, 182, .03, .4);
        float factor1 = map(paso, 7, 182, 1, .6);
        float factor2 = map(paso, 7, 182, .01, .3);
        float factor3 = map(paso, 7, 182, .9, 1.3);

        float x1 = map(index % paso, 0, paso - 1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365 / paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }

  void semestre(int paso) {
    for (int i = 0; i < m.length; i++) {
      if (index >= i * paso && index < i * paso + paso) {
        float factor = map(paso, 7, 182, .03, .4);
        float factor1 = map(paso, 7, 182, 7, .6);
        float factor2 = map(paso, 7, 182, .08, .03);
        float factor3 = map(paso, 7, 182, 1.9, .96);

        float x1 = map(index % paso, 0, paso-1, width * factor2, width * factor3);
        x = x1;

        float y1 = map(i, 0, 365/paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }

  void estacion(int paso) {
    //an = -PI/2;
    for (int i = 0; i < m.length; i++) {
      if (index >= i * paso && index < i * paso + paso) {
        float factor = map(paso, 7, 182, .08, .2);
        float factor1 = map(paso, 7, 182, 1, .9);
        float factor2 = map(paso, 7, 182, .06, .05);
        float factor3 = map(paso, 7, 182, .51, 1.5);

        float x1 = map(index % paso, 0, paso - 1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365 / paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }


  // falta descripción del bloque de código
  void tMax() {

    float d = map(tmax, 21, 34, 5, 25); //el map esta fuera de rango en el set de variable
    float mapmedTemp = map(tmean, 13, 31, 0, 255); //el map esta fuera de rango en el set de variable
    float maprain = map(rain, 0, 116, 0, 25);

    fill(red, mapmedTemp);
    noStroke();
    ellipse(x, y, d, d);
    fill(blue);
    ellipse(x, y, maprain, maprain);
  }

  // falta descripción del bloque de código
  void hMax() {

    float maphmax = map(hmax, 68, 100, 0, 255); // sin uso
    float maphmaxcolor = map(hmax, 68, 100, 0, 50);
    float mapclouds = map(clouds, 0, 8, 10, 255);


    fill(0, mapclouds, 0);
    noStroke();
    ellipse(x, y, maphmaxcolor, maphmaxcolor);

  }

  // falta descripción del bloque de código
  void katrina() {

    float maphmax = map(hmax, 68, 100, 255, 100);
    float mapgust = map(gust, 0, 148, 10, 30);
    float mapwind = map(wind, 14, 111, 100, 255); // sin uso
    float maprain = map(rain, 0, 116, 5, 155);


    fill(blue);
    rect(x - 6, y, maprain / 10, maprain);
    fill(maphmax, 0, 0);
    noStroke();
    ellipse(x, y, mapgust, mapgust);
  }

  // falta descripción del bloque de código
  void leyenda1() {

    fill(255);
    strokeWeight(2);
    stroke(0);
    rect(335, 820, 1200, 900);
    noStroke();
    fill(255, 0, 0);
    ellipse(380, 860, 10, 10);
    ellipse(410, 860, 20, 20);
    textFont(tipografia);
    fill(0);
    text("Temperatura Máxima", 430, 865);
    textFont(light);
    fill(255, 0, 0, 100);
    ellipse(660, 860, 20, 20);
    fill(255, 0, 0);
    ellipse(690, 860, 20, 20);
    fill(0);
    text("Temperatura Media", 730, 865);
    fill(0, 0, 255);
    ellipse(970, 860, 10, 10);
    ellipse(1000, 860, 20, 20);
    fill(0);
    text("Lluvia", 1020, 865);
  }


  // falta descripción del bloque de código
  void leyenda2() {

    fill(255);
    strokeWeight(2);
    stroke(0);
    rect(335, 820, 1200, 900);
    noStroke();
    rect(335, 820, 1200, 900);
    fill(0, 255, 0);
    ellipse(380, 860, 10, 10);
    ellipse(410, 860, 20, 20);
    textFont(tipografia);
    fill(0);
    text("Humedad Máxima", 430, 865);
    textFont(light);
    fill(0, 255, 0);
    ellipse(660, 860, 20, 20);
    fill(32, 51, 12);
    ellipse(690, 860, 20, 20);
    fill(0);
    text("Nubes", 730, 865);
  }
  
  
  // falta descripción del bloque de código
  void leyenda3() {

    fill(255);
    strokeWeight(2);
    stroke(0);
    rect(335, 820, 1200, 900);
    noStroke();
    rect(335, 820, 1200, 900);
    fill(255, 0, 0);
    ellipse(380, 860, 10, 10);
    ellipse(410, 860, 20, 20);
    textFont(tipografia);
    fill(0);
    text("Gust (ráfagas)", 430, 865);
    textFont(light);
    fill(255, 0, 0);
    ellipse(660, 860, 20, 20);
    fill(40, 0, 0);
    ellipse(690, 860, 20, 20);
    fill(0);
    text("Humedad Máxima", 730, 865);
    fill(0, 0, 255);
    rect(980, 850, 10, 20);
    rect(1000, 850, 10, 40);
    fill(0);
    text("Lluvia", 1020, 865);
  }
  
}