// Se crea la clase Objects, se inicializan las variables int y float, y se importan los valores de las variables provenientes de la otra ventana con su respectiva variable.

class Objects {
  int index, temperatura_max, temperatura_mean, temperatura_min, dewpoint_max, dewpoint_mean, dewpoint_min, wind_direction;
  float x, y, x2, y2, x_max, y_max, x_min, y_min;


  Objects(int index, int temperatura_max, int temperatura_mean, int temperatura_min, int dewpoint_max, int dewpoint_mean, int dewpoint_min, int wind_direction) {


    this.index = index;
    this.temperatura_max = temperatura_max;
    this.temperatura_mean = temperatura_mean;
    this.temperatura_min = temperatura_min;
    this.dewpoint_max = dewpoint_max;
    this.dewpoint_mean = dewpoint_mean;
    this.dewpoint_min = dewpoint_min;
    this.wind_direction = wind_direction;
  }

/* Se realiza un pushMatrix donde ocurre un cambio de origen, una rotación para que los datos aparezcan desde la parte superior, y se realizan diferentes map de los datos provenientes
 de la tabla.*/
  void year() { 
    pushMatrix();
    translate((width / 2 - 270), (height / 2)); 
    rotate(TWO_PI * 3 / 4);
    // translate((X * 2), (Y * 2));
    float deI = map(index, 0, 364, 0, TWO_PI);
    float c1 = map(temperatura_max, 16, 40, 200, 250); //el map esta fuera de rango en el set de variable  
    float c2 = map(temperatura_min, 4, 33, 200, 150); //el map esta fuera de rango en el set de variable  
    color desde = color (#49B4AE);
    color hasta = color (#D8BB11);
    float amt = map(temperatura_mean, 17, 40, 0, 0.99);
    color color_linea = lerpColor (desde, hasta, amt);

// Se dibujan líneas marcando los meses del año y se modifica el valor de las variables para así lograr que roten
    if (index == 0 || index == 31 || index == 59 || index == 90 || index == 120 || index == 151 || index == 181 || index == 212 || index == 243 || index == 274 || index == 304 || index == 335 || index == 365) {

      stroke(190, 100);
      line(x, y, 290 * cos(deI), 290 * sin(deI));
      line(x2, y2, 130 * cos(deI), 130 * sin(deI));
    }
    stroke(color_linea);
    x = 203 * cos(deI);
    x2 = 197 * cos(deI);
    x_max = c1 * cos(deI);
    x_min = c2 * cos(deI);
    y = 203 * sin(deI);
    y2 = 197 * sin(deI);
    y_max = c1 * sin(deI);
    y_min = c2 * sin(deI);
// Se dibujan las líneas correspondientes a cada día y se cierra con un popMatrix
    line(x, y, x_max, y_max);
    line(x2, y2, x_min, y_min);
    popMatrix();
  }
  
/* Se realiza un pushMatrix donde ocurre un cambio de origen, una rotación para que los datos aparezcan desde la parte superior, y se realizan diferentes map de los datos provenientes
 de la tabla.*/
  void semestre() { 
    pushMatrix();
    translate((width / 2 - 360), (height / 2)); 
    rotate(TWO_PI * 3 / 4);
    // translate((X * 2), (Y * 2));

    float deI = map(index, 0, 180, 0, TWO_PI);
    float c1 = map(dewpoint_max, -23, 29, 100, 150); //el map esta fuera de rango en el set de variable
    float c2 = map(dewpoint_min, -30, 21, 0, 50); //el map esta fuera de rango en el set de variable   
    color desde = color (#49B4AE);
    color hasta = color (#D8BB11);
    float amt = map(dewpoint_mean, -20, 23, 0, 0.99);
    color color_linea = lerpColor (desde, hasta, amt);


// Se modifica el valor de las variables para así lograr que roten.
    x = 113 * cos(deI);
    x_max = (c1) * cos(deI);
    x_min = (c1 + c2) * cos(deI);
    y = 113 * sin(deI);
    y_max = (c1) * sin(deI);
    y_min = (c1 + c2) * sin(deI);


// Se crea una condición para lograr así dibujar dos figuras en vez de una, y se dibujan las líneas correspondientes a los meses y días de ambas visualizaciones.
    if (index >= 182) {
      translate(0, 430);
    }
    if (index == 0 || index == 31 || index == 59 || index == 90 || index == 120 || index == 151 || index == 182 || index == 212 || index == 243 || index == 274 || index == 304 || index == 335 || index == 365) {
      strokeWeight(3);
      stroke(190, 100);
      line(x, y, 170 * cos(deI), 170 * sin(deI));
      line(170 * cos(deI), 170 * sin(deI), (170 + 50) * cos(deI), (170 + 50) * sin(deI));
    }
    stroke(color_linea);
    strokeWeight(3);
    line(x, y, x_max, y_max);

    strokeWeight(2);
    line(x_max, y_max, x_min, y_min);
    popMatrix();
  }

/* Se realiza un pushMatrix donde ocurre un cambio de origen, una rotación para que los datos aparezcan desde la parte superior, y se realizan diferentes map de los datos provenientes
 de la tabla.*/
  void mes() {
    pushMatrix();
    translate((width / 2 - 270), (height / 2 - 150)); 
    rotate(TWO_PI * 3 / 4);
    // translate((X * 2), (Y * 2));
// Se modifica el valor de las variables para así lograr que roten.
    float deI = map(index, 0, 91, 0, TWO_PI);
    float wind_direct = map(wind_direction, 9, 351, 0, 140);
    float x = wind_direct * cos(deI);
    float y = wind_direct * sin(deI);
// Se crean varias condiciones para lograr así dibujar cuatro figuras en vez de una, y se dibujan las líneas correspondientes a los días de estas visualizaciones.
    if (index >= 91 && index < 182) {
      translate(0, 430);
    }
    if (index >= 182 && index < 272) {
      translate(-300, 0);
    }
    if (index >= 272 && index < 365) {
      translate(-300, 430);
    }

    line(0, 0, x, y);
    popMatrix();
  }
}