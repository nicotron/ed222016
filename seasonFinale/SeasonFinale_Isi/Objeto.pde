class Objeto {

  // Declaración de variables:

  float Visibility, MaxPressure, MinPressure, x, y, t, y3, Cloud;
  int maxTemperature, minTemperature, meanTemperature, dewPointC, minDewPointC, gustSpeed, maxWspeed, meanWspeed;
  int index, i, div;
  boolean bol;
  
  // Inicialización de variables:
  Objeto(int i, int index, int gustSpeed, int maxTemperature, int minTemperature, int meanTemperature, int dewPointC, int minDewPointC, float visibility, float maxPressure, float minPressure, int maxWspeed, int meanWspeed, float cloud) {
    this.i = i;
    this.index = index;
    this.MaxTemperature = MaxTemperature;
    this.MinTemperature = MinTemperature;
    this.MeanTemperature = MeanTemperature;
    this.MinDewPointC = MinDewPointC;
    this.DewPointC = DewPointC;
    this.GustSpeed = GustSpeed;
    this.Visibility = Visibility;
    this.MaxPressure = MaxPressure;
    this.MinPressure = MinPressure;
    this.MaxWspeed = MaxWspeed;
    this.MeanWspeed = MeanWspeed;
    this.Cloud = Cloud;
    x = 0;
    y = 0;
    t = 0;
    bol = true;
  }

  // Void que dibuja elipses según la temperatura, punto de rocío y visibilidad.  
  void elipse() {

    //Cambio de tamaño:
    float MaxdP = map(DewPointC, -34, 12, 5, 20);
    float MindP = map(MinDewPointC, -96, 7, 5, 20);
    if (frameCount % 200 == 0) {
      bol= !bol;
    }
    // no está desrito en la visualización, cuando esto ocurre.
    if (bol == true) {
      t = MaxdP;
    } else {
      t = MindP;
    }
    //Creación del Objeto:
    ellipseMode(CENTER);
    float c1 = map(MaxTemperature, -33, 20, 50, 255);  // Dato para color. 
    float c2 = map(MinTemperature, -40, 11, 50, 255);  // Dato para color.  
    float trans = map(Visibility, 1, 16, 50, 255);  

    noStroke();
    fill (c1, 0, c2, trans);
    ellipse(x, y, t, t);
  }

// Void que dibuja líneas que cambian según el viento y la nubosidad:
  void linea() {
    // Mapeo de datos:
    ellipseMode(CENTER);
    float c1 = map(MaxWspeed, 10, 58, 50, 255);  // Dato para color.
    float c2 = map(MeanWspeed, 5, 50, 50, 255);  // Dato para color.  
    float tam = map(Cloud, 0, 8, 3, 30); 
    //Creación del Objeto:
    stroke(0, c1, c2);
    strokeWeight(4);
    line(x, y, x, y + tam);
  }

//Void que dibuja líneas a partir de una grilla circular e interpreta datos de presión del agua y ráfaga:
  void circular(int linea) {
    //Reubico el punto de origen:
    pushMatrix();
    translate((width / 2 - 350), height + 250 );
    rotate(TWO_PI * 3 / 4);
    // Mapeo de datos:
    float rot = map(i, 0, linea, 0, TWO_PI);           // map para crear un círculo de 360º con la cantidad de datos de una variable.
    float c1 = map(MaxPressure, 991, 1049, 50, 255);   //dato para colores.
    float c2 = map(MinPressure, 990, 1043, 50, 255);   //dato para colores. 
    float tam = map(GustSpeed, 13, 79, 0.9, 1.2);      //dato para tamaño. 
    float x2 = (width / 2) + 200 * tam * cos(rot);
    float y2 = (height / 2) + 200 * tam * sin(rot);

    x = (width / 2) + 200 * cos(rot);
    y = (height / 2) + 200 * sin(rot);
    
    //Creación de Objeto:
    stroke(c1, c2, 0);
    strokeWeight(1);
    line(x, y, x2, y2);
    popMatrix();
  }

// Void que trabaja con la temperatura, mínima y máxima en colores y media según vértice:
  void triangulo() {
    // Mapeo de datos:
    float c1 = map(MaxTemperature, -33, 20, 50, 255);   //dato para colores.
    float c2 = map(MinTemperature, -40, 11, 50, 255);   //dato para colores.
    float y2 = map(MeanTemperature, -34, 13, -30, 20);  //dato para posición del vértice.
    //Creación de Objetos:
    noStroke();
    fill(c1, c2, 0);
    triangle(x, y, x + 20, y, x + 10, y + y2);
  }

// Void que lee los datos de la tabla y los posiciona en el canvas según columnas predefinidas por la variable "dia":
  void dias(int dia) {
    for (int i = 0; i < o.length; i++) {
      if (index >= i * dia && index < i * dia + dia) {
        float dy1 = map(dia, 7, 182, .03, .4);          //distancia de la y
        float dy2 = map(dia, 7, 182, 1, .6);            // distancia de y
        float dx1 = map(dia, 7, 182, .07, .1);          //distancia x
        float dx2 = map(dia, 7, 182, .7, .9);           //distancia x

        float x1 = map(index % dia, 0, dia - 1, width * dx1, width * dx2);
        x = x1;

        float y1 = map((i), 0, 365 / dia, height * dy1, height * dy2);
        y = y1;
      }
    }
  }
}