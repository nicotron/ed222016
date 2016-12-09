class Maite {
  int index, paso, mint, maxt, meant, maxV, meanV, minV, nube, maxH, meanH, minH;
  float x, y, numero, an, t, prec;
  color rojo, blanco, celeste, verde, amarillo, d, f, g;
  String titulo;


  Maite(int index, int maxt, int mint, int meant, int maxV, int meanV, int minV, float prec, int nube, int maxH, int meanH, int minH) {


    x = 0;
    y = 0;
    rectMode(CENTER);

    //set de variables humedad.
    this.maxH = maxH;
    this.meanH = meanH;
    this.minH = minH;

    //variable precipitación.
    this.prec = prec;
    //variable nube.
    this.nube = nube;

    this.index = index;

    //set de variables temperatura.
    this.mint = mint;
    this.meant = meant;
    this.maxt = maxt;

    //set de variables viento.
    this.minV = minV;
    this.meanV = meanV;
    this.maxV = maxV;

    this.amarillo = color(255, 255, 0);
    this.verde = color(0, 255, 0);
    this.blanco = color(255);
    this.celeste = color(0, 255, 255);
    this.rojo = color(255, 0, 0);
  }

  /*
  Círculos blancos que representan humedad, los datos son representados
   por su opacidad y tamaño.
   */
  void humedad() {
    float locura = map(minH, 6, 31, 0, 30);
    float locura2 = map(minH, 6, 31, 1, 5); //el map esta fuera de rango en el set de variable
    fill(blanco, locura);
    noStroke();
    ellipse(x, y - 16, locura2, locura2); //arriba

    float loca = map(meanH, 6, 31, 31, 70);
    float loca2 = map(meanH, 6, 31, 5, 8);//el map esta fuera de rango en el set de variable
    fill(blanco, loca);
    noStroke();
    ellipse(x, y, loca2, loca2); //centro

    float loco = map(maxH, 6, 31, 71, 100);
    float loco2 = map(maxH, 6, 31, 8, 10);//el map esta fuera de rango en el set de variable
    fill(blanco, loco);
    noStroke();
    ellipse(x, y + 16, loco2, loco2); //abajo
  }
  /*
  Puntos que representan lluvia, los datos son 
   representados a través de su stroke, mayor mm mayor stroke. 
   */
  void lluvia() {
    float loco = map(prec, 0.0, 12.95, 0, 22);
    stroke(blanco);
    strokeWeight(loco);
    point(x, y);
  }

  /*
  Círculos que representan temperatura, los datos son 
   representados a través de su color, 
   temperatura mínima, entre celeste y blanco
   temperatura media, entre verde y amarillo
   temperatura máxima, entre amarillo y rojo.
   */
  void temperatura() {
    float loco = map(mint, 23, 28, 0, 1);  //temperatura mínima ..
    d = lerpColor(blanco, celeste, loco);

    float locura = map(meant, 26, 32, 0, 1);  //temperatura media ..
    f = lerpColor(verde, amarillo, locura);

    float loca = map(maxt, 29, 35, 0, 1);  //temperatura máxima ..
    g = lerpColor(amarillo, rojo, loca);

    fill(d); // mínima ..
    strokeWeight(1);  // todo valor que el map bacan de inferior a 2, no se verá por que este strokeWeight es muy grande.  
    stroke(celeste);
    float funciona = map(mint, 23, 28, 0, 5); // que es el 40% de valores posibles
    ellipse(x - 8, y - 8, funciona, funciona);

    fill(f); // media ..
    strokeWeight(2);  
    stroke(amarillo); // todo valor que el map bacan de inferior a 4, no se verá por que este strokeWeight es muy grande.
    float funciono = map(meant, 26, 32, 0, 10);// que es el 40% de valores posibles
    ellipse(x, y, funciono, funciono);

    fill(g); // máxima ..
    strokeWeight(3);  // todo valor que el map bacan de inferior a 6, no se verá por que este strokeWeight es muy grande.
    stroke(rojo);
    float bacan = map(maxt, 29, 35, 0, 15); // que es el 33% de valores posibles
    ellipse(x + 8, y + 8, bacan, bacan);
  }

  /*
  Cuadrado que representan las nubes, cambian en la variable Y de su tamaño,
   y en su opacidad.
   */
  void nube() {
    float itu = map(nube, 1, 3, 10, 100);
    fill(celeste, itu);
    noStroke();
    rect(x, y, itu, 5);
  }

  /*
  Líneas que representan la visibilidad, los datos se 
   muestran a través de su posición en x
   */
  void visibilidad() {

    /* 
    cuando se trabaja con map en grupos de variables, deben ser igual
    porque sin importar el valor que entre en cada una de las variables,
    no podrá ser comparado con el resto, 
    1, 10 - 6, 17 - 6, 31 deben ser iguales.
    */
    float maitex = map(minV, 1, 10, 35, 300);  //visibilidad mínima ..
    float maiturri = map(meanV, 6, 17, 35, 300);  //visibilidad media ..
    float maitela = map(maxV, 6, 31, 35, 300);  //visibilidad máxima ..

    /*
    Si las lineas se sobreponen y además inician en radios distintos,
    no podemos saber cuando termina una que está en el fondo,
    y tampoco comparar esos valores con el resto
    */
    //visibilidad mínima
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(radians(index * 360 / 365));
    strokeWeight(2);
    stroke(celeste, 150);
    line(50, 0, maitex, 0);
    popMatrix();

    //visibilidad media
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(radians(index * 360 / 365));
    strokeWeight(2);
    stroke(blanco, 150);
    line(40, 0, maiturri, 0);
    popMatrix();

   //visibilidad máxima
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(radians(index * 360 / 365));
    strokeWeight(2);
    stroke(amarillo, 10);
    line(30, 0, maitela, 0);
    popMatrix();
  } 

  /*
  El uso de esta función es irrelevante porque es una copia de la función dias
  con la diferencia de 
  an = -PI/2; 
  qué además no se usa. 
  */
  //Usado en viento, se usa an = PI/2.
  void diasprincipe(int paso) {
    an = -PI / 2;
    for (int i = 0; i < e.length; i++) {
      if (index >= i * paso && index < i * paso + paso) {
        float factor = map(paso, 7, 182, .04, .4);  //distancia Y
        float factor1 = map(paso, 7, 182, 2, .6); //distancia Y
        float factor2 = map(paso, 7, 182, .1, .1); // distancia x
        float factor3 = map(paso, 7, 182, .10, .9); //distancia x

        float x1 = map(index % paso, 0, paso - 1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365 / paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }

  /*Usado en todos los set de variables menos viento, 
   lluvia, nube, temperatura y humedad.
   */

  void dias(int paso) {
    for (int i = 0; i < e.length; i++) {
      if (index >= i * paso && index < i * paso + paso) {
        float factor = map(paso, 7, 182, .03, .4);  //distancia Y
        float factor1 = map(paso, 7, 182, 1, .6); //distancia Y
        float factor2 = map(paso, 7, 182, .09, .1); // distancia x
        float factor3 = map(paso, 7, 182, .9, .9); //distancia x

        float x1 = map(index % paso, 0, paso - 1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365 / paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }
}