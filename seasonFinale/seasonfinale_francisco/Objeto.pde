class Objeto {
  int  x, y, z, w, wind_max, wind_mean, h, j, k;                              // Estos corresponden a los valores de la T°(c°), el número del valor en la tabla, humedad y los valores del viento.
  float posX, posY_1, posY_2, posY_3, posY_Wmean, posY_Wmax, t1, t2, e1, e2;  // Las coordenadas, horizontales y verticales, tanto para temperatura y viento.
  float posH_1, posH_2, posH_3;
  color c0_5, c1, c1_5, c2, c2_5, c3, c3_5;                                   // Colores del azul al rojo, promediándose y cambiando. Los enteros estan en las formas, los decimales en las líneas.
  
  Objeto(int x, int y, int z, int w, int wind_max, int wind_mean, int h, int j, int k) {
    // Inicializar variables con valores desde el constructor
    this.x = x;
    this.y = y;
    this.w = w;
    this.z = z;
    this.h = h;
    this.j = j;
    this.k = k;
    this.wind_max = wind_max;
    this.wind_mean = wind_mean;
  }

  // sus funciones
  void display() {

    posX = map(w, weekMin - 1, weekMax, 0, width);                                        // Posiciones de la data en el canvas.
    posY_1 = map(y, -15, 13, 0, height);                                                // Para temperatura.
    posY_2 = map(z, -15, 13, 0, height);
    posY_3 = map(x, -15, 13, 0, height);

    posY_Wmean = map(wind_mean, 3, 95, 0, height);                                      // Para el viento máximo y su mediana.
    posY_Wmax = map(wind_max, 3, 95, 0, height);

    c0_5 = color(map(posY_1 / 2, 0, height, 240, 360), 360, 360);                        // Mapeo de colores, según sus elementos cercanos y el tamaño del canvas.
    c1 =   color(map(posY_1, 0, height, 240, 360), 360, 360);
    c1_5 = color(map((posY_1 + posY_2) / 2, 0, height, 240, 360), 360, 360);
    c2 =   color(map(posY_2, 0, height, 240, 360), 360, 360);
    c2_5 = color(map((posY_2 + posY_3) / 2, 0, height, 240, 360), 360, 360);
    c3 =   color(map(posY_3, 0, height, 240, 360), 360, 360);    
    c3_5 = color(map((posY_3 + height) / 2, 0, height, 240, 360), 360, 360);

    if (flip == true){

    strokeWeight(4);

    stroke(c0_5);                                                                       // Cada línea conectando un elemento comienza donde la otra termina, o desde el margen del canvas.
    line(posX, 0, posX, posY_1);                                                        // Cada una con su color específico.
    stroke(c1_5);
    line(posX, posY_1, posX, posY_2);
    stroke(c2_5);    
    line(posX, posY_2, posX, posY_3);
    stroke(c3_5);
    line(posX, posY_3, posX, height);

    noStroke();

    pushMatrix();
    fill(c1);
    translate(posX, posY_1);
    rotate(PI);
    triangle(0, 10 * sqrt(3), 
      10 * sqrt(3), -10 * sqrt(3), 
      -10 * sqrt(3), -10 * sqrt(3));  
    popMatrix();         

    pushMatrix();
    fill(c2);
    translate(posX, posY_2);             
    rect(0, 0, 15, 15);
    popMatrix();    

    pushMatrix();
    fill(c3);
    translate(posX, posY_3);
    ellipse(0, 0, 30, 30);
    popMatrix();

    pushMatrix();
    stroke(0, 0, 360);
    translate(posX, posY_Wmean);
    line(-7, 0, 7, 0);
    popMatrix();

    pushMatrix();
    stroke(0, 0, 360);
    translate(posX, posY_Wmax);
    line(-7, 0, 7, 0);
    popMatrix();
    }
    
   if (flip == false){                                // Función correspondiente a los cuadrados de la humedad máxima, mediana y mínima. "Cuadrados azules"
    posH_1 = map(k, 21, 100, 0, height);                                              
    posH_2 = map(j, 21, 100, 0, height);
    posH_3 = map(h, 21, 100, 0, height);

    stroke(360);
    line(posX, posH_1, posX, posH_3);
    
    noStroke();
    fill(180, 360, 360);
    rect(posX, posH_1, 10, 20);
    fill(202, 360, 360); 
    rect(posX, posH_2, 10, 20);
    fill(225, 360, 360);
    rect(posX, posH_3, 10, 20);
  }
  }

  void texto() {                                        // Texto para ayudar a personalizar la visualización de los datos.
    fill(0, 0, 360, a);
    textSize(22);
    text("Datos en pantalla =", 40, 40);
    text(weekMax - weekMin, 260, 40);
    textSize(18);
    text("Custom data", 40, 90);
    text(minDate, 180, 120);
    text("MinLimit", 40, 120);
    text(minDate, 180, 120);
    text("MaxLimit", 40, 150);
    text(maxDate, 180, 150);
  }
}