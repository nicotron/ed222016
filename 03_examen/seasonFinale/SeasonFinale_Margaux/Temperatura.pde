class Temperatura {
  float x, y, an, i;
  int tmax, tmin, tmean, d, paso, index;
  
  Temperatura (int index, int tmax, int tmin, int tmean) {
    x = 0;
    y = 0;
    this.index = index;
    this.tmax = tmax;
    this.tmin = tmin;
    this.tmean = tmean;
  }
  
  void TempMax() { // las funciones deben ser con minúsculas, porque sino, hacen referencia a una posible clase
    //Maxima
    pushMatrix();
    fill(#D6B9B8);
    ellipse(400, 440, 400, 400); 
    ellipse(400, 440, index, tmax);
    popMatrix();
  }
  
  void TempMin() { // las funciones deben ser con minúsculas, porque sino, hacen referencia a una posible clase
    //Minima
    noStroke();
    fill(#FA5C5F);
    ellipse(400, 440, 200, 200);
    ellipse(400, 440, index, tmin);
  }
  
  void TempMean() { // las funciones deben ser con minúsculas, porque sino, hacen referencia a una posible clase
    //Mediana
    strokeWeight(5);
    stroke(#151927);
    line(200, 440, 600, 440); 
  }
  
   void dias(int paso) {
    an = -PI/2;
    for (int i = 0; i < e.length; i++) {
      if (index >= i * paso && index < i * paso + paso) {
        float factor = map(paso, 7, 182, .03, .4);  //distancia Y
        float factor1 = map(paso, 7, 182, 1, .6); //distancia Y
        float factor2 = map(paso, 7, 182, .09, .1); // distancia x
        float factor3 = map(paso, 7, 182, .9, .9); //distancia x

        float x1 = map(index % paso, 0, paso-1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365/paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }
  
}