class Hawai {

  //Variables globales de la clase
  String dia;

  int index;
  float x, y;

  int tmax, tmean, tmin, vmax, vmean, vmin, hmax, hmean, hmin, clouds;
  color red = color(#FF4F46);
  color green = color(#65E879);
  color blue = color(#34CAFF);
  color yellow = color(#F9FC47);
  color white = color(#E6E6E6);

  Hawai(int index, String dia, int tmax, int tmean, int tmin, int vmax, int vmean, int vmin, int hmax, int hmean, int hmin, int clouds) {

    //Inicializar variables desde el contructor
    this.index = index;
    this.dia = dia;
    
    //Temperatura
    this.tmax = tmax;
    this.tmean = tmean;
    this.tmin = tmin;
    
    //Visibilidad
    this.vmax = vmax;
    this.vmean = vmean;
    this.vmin = vmin;
    
    //Humedad
    this.hmax = hmax;
    this.hmean = hmean;
    this.hmin = hmin;
    
    //Nubes
    this.clouds = clouds;
  }

  //Funciones de la clase

  //Días
  void dias(int paso) {
    //float an = -PI/2;
    for (int i = 0; i < h.length; i++) {
      if (index >= i * paso && index < i * paso + paso) {
        float factor = map(paso, 7, 182, .03, .4);
        float factor1 = map(paso, 7, 182, 1, .6);
        float factor2 = map(paso, 7, 182, .09, .1);
        float factor3 = map(paso, 7, 182, .9, .9);

        float x1 = map(index % paso, 0, paso-1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365/paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }

  //Temperatura
  void tMax() {

    float d = map(tmax, 21, 34, 5, 20);

    noStroke();
    fill(red, 80);
    ellipse(x, y, d, d);
  }
  //Falta descripción del cuadro de texto  
  void tMean() {

    float d = map(tmean, 20, 29, 5, 20);

    noStroke();
    fill(green, 80);
    ellipse(x, y, d, d);
  }

  //Falta descripción del cuadro de texto  
  void tMin() {

    float d = map(tmean, 15, 25, 5, 20);

    noStroke();
    fill(blue, 80);
    ellipse(x, y, d, d);
  }

  //Visibilidad
  void vMax() {

    float m = map(vmax, 0, 16, 10, 100);

    pushMatrix();
    noStroke();
    fill(blue, m);
    rectMode(CENTER);
    rect(x, y, 8, 8);
    popMatrix();
  }

  //Falta descripción del cuadro de texto  
  void vMean() {

    float m = map(vmean, 4, 16, 10, 100);

    pushMatrix();
    noStroke();
    fill(red, m);
    rectMode(CENTER);
    rect(x, y, 8, 8);
    popMatrix();
  }

  //Falta descripción del cuadro de texto  
  void vMin() {

    float m = map(vmin, 0, 16, 10, 100);

    pushMatrix();
    noStroke();
    fill(green, m);
    rectMode(CENTER);
    rect(x, y, 8, 8);
    popMatrix();
  }

  ////Humedad
  void hMax() {

    float h = map(hmax, 55, 100, 10, 100);

    pushMatrix();
    stroke(white, h);
    strokeWeight(3);
    line(x, y, x, y - (h / 5));
    popMatrix();
  }

  //Falta descripción del cuadro de texto  
  void hMean() {

    float h = map(hmean, 45, 97, 10, 100);

    pushMatrix();
    stroke(white, h);
    strokeWeight(3);
    line(x, y, x + (h/5), y);
    popMatrix();
  }

  //Falta descripción del cuadro de texto  
  void hMin() {

    float h = map(hmin, 0, 90, 10, 100);

    pushMatrix();
    stroke(white, h);
    strokeWeight(3);
    line(x, y, x, y + (h/5));
    popMatrix();
  }

  //Nubes
  // el nombre de la función no puede ser con Mayúscula ya que se refiere a una clase
  void Clouds() {

    float c = map(clouds, 1, 8, i - 1, 40);

    pushMatrix();
    stroke(white, 80);
    strokeWeight(1);
    noFill();
    rectMode(CENTER);
    rect(x, y, c, c);
    popMatrix();
  }
}