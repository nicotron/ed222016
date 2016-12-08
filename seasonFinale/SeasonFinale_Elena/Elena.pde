/*
Inicio de el objeto llamado Elena del class.
 */
class Elena {

  /*
Declaración de las variables usadas, como enteros, float, textos y colores.
   */
  int temperatura, tem1, tem2, sea1, sea2, sea3, vientomax, vientomin, gust, ver, ver2, ver3, tam, index;
  float velx, vely, x, y, angulo;
  String CET;
  color celb, az, c, verd, mo, mo2, veram, cal, d, ro, na;
  
  /*
Constructor del class, variables que se escriben al crearlo
en la página principal de código, mas la equivalencia de estas mismas.
*/
  Elena(int index, String CET, int temperatura, int tem1, int tem2, int sea1, int sea2, int sea3, int vientomax, int vientomin, int gust, int ver, int ver2, int ver3) {

    this.CET = CET; // no se usa
    this.index = index;
    this.temperatura = temperatura;
    this.tem1 = tem1;
    this.tem2 = tem2;
    this.sea1 = sea1;
    this.sea2 = sea2;
    this.sea3 = sea3;
    this.ver = ver;
    this.ver2 = ver2;
    this.ver3 = ver3;
    this.vientomax = vientomax;
    this.vientomin = vientomin;
    this.gust = gust;
    this.x = 0;
    this.y = 0;
    this.velx = 1; // no se usa
    this.vely = 1; // no se usa
    this.celb = color(204, 251, 255);
    this.az = color(37, 52, 87);
    this.verd = color(204, 204, 109);
    this.mo = color(81, 24, 73);
    this.mo2 = color(64, 40, 56);
    this.veram = color(237, 221, 83);
    this.cal = color(101, 175, 187);
    this.ro = color(199, 0, 57);
    this.na = color(255, 87, 51);
    ellipseMode(CENTER);
    rectMode(CENTER);
  }

/*
Funciones para dibujar objetos en particular que serán
llamados posteriormente en la página principal del código en el void draw()
*/
  void sealevel() {                                              //Construcción de los niveles de la marea
    float amt = map(sea1, 970, 1030, 0, 1);                      //Cambiar los min y max de una variable a un nuevo rango.
    c = lerpColor(celb, az, amt);                                //Crear una degradación entre dos colores

    float relleno = map(sea3, 975, 1040, 150, 250);              //El cambio de rango se puede usar tanto para coordenadas, color, tamaños.
    fill(c, relleno);
    noStroke();

    float ee = map(sea1, 970, 1030, 0, 50);                      
    ellipse(x, y, ee, ee); 
    noStroke();
    fill(verd);

    float rr = map(sea2, 980, 1040, 0, 15);                      
    rect(x, y, rr, rr);
  }

  // Esta función tiene problemas de diseño gráfico ya que no se logra entender la información que hay en la cuarta columna
  void vientos() {                                               //Construcción de los vientos.

    float grosor = map(gust, 0, 100, 1, 15);                     
    strokeWeight(grosor);

    float vMax = map(vientomax, 10, 60, 200, 1150);              

    stroke(ro, 50);
    line(x, vMax, width / 2 + 20, height);                       //Fijar dos coordenadas de la línea para crear un abanico.
  }

  // el nombre de la función no describe de buena manera lo que hace
  void vientos2() {                                              

    float grosor = map(gust, 0, 100, 1, 15);                     
    strokeWeight(grosor);

    float vMin = map(vientomin, 0, 25, 50, 800);

    stroke(mo2, 50);
    line(x, vMin, width / 2 + 20, height);
  }

  // el nombre de la función no describe de buena manera lo que hace
  void dias(int paso) {                                         //Función que permite dividir los elementos del largo de la lista de datos en columnas, creando las medidas de tiempo
    for (int i = 0; i < e.length; i++) {
      if (index >= i * paso && index < i * paso + paso) { 
        float factor = map(paso, 7, 182, .001, .8);             //Modifica Y
        float factor1 = map(paso, 7, 182, 1, .1);               //Modifica Y
        float factor2 = map(paso, 7, 182, .15, .25);            //Modifica X
        float factor3 = map(paso, 7, 182, .7, 4);               //Modifica X

        float x1 = map(index % paso, 0, paso - 1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365 / paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }

  // el nombre de la función no describe de buena manera lo que hace
  void dias2(int paso) {
    for (int i = 0; i < e.length; i++) {
      if (index >= i * paso && index < i * paso + paso) { 
        float factor = map(paso, 7, 182, .02, .4);
        float factor1 = map(paso, 7, 182, .95, .001);
        float factor2 = map(paso, 7, 182, .55, .01);
        float factor3 = map(paso, 7, 182, .5, 4);

        float x1 = map(index % paso, 0, paso - 1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365 / paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }

  // el nombre de la función no describe de buena manera lo que hace
  void dias3(int paso) {
    for (int i = 0; i < e.length; i++) {
      if (index >= i * paso && index < i * paso + paso) { 
        float factor = map(paso, 7, 182, .001, .8);
        float factor1 = map(paso, 7, 182, 1, .1);
        float factor2 = map(paso, 7, 182, .04, .25);
        float factor3 = map(paso, 7, 182, .95, 4);

        float x1 = map(index % paso, 0, paso - 1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365 / paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }

  void visible() {                                            //Construcción de la visibilidad
    float amt = map(ver2, 0, 20, 0, 1);
    c = lerpColor(az, veram, amt);
    fill(c, 180);
    noStroke();
    float port = map(ver, 11, 64, 0, 30);
    ellipse(x, y, port, port);

    pushMatrix();                                            //Limitar las traslaciones y rotaciones a un grupo determinado de elementos
    translate(20, 0);                                        //Mover en el eje X una figura
    stroke(az);
    strokeWeight(1);
    /* 
    este map nn si fuera de 0, 10, 0, 10 no tendrías que crear x2 y y2
    con x2 y y2 estás diciendo que aunque ver3 sea 0, se verá como 5
    lo que dificulta la lectura.
    */
    float nn = map(ver3, 0, 10, 0, 5);
    float x2 = x + 5;
    float y2 = y + 5;
    line(x, y, x2 + nn, y2 + nn);
    popMatrix();                                             //Cerrar el grupo delimitado
  }

  // el nombre de la función no describe de buena manera lo que hace
  // esta función tiene buenas intenciones pero se fue de control completamente, no es posible entender nada
  void temp2() {                                             //Construcción de la temperatura
    float amt = map(temperatura, - 7.5, 30, 0, 1);
    c = lerpColor(mo, veram, amt);
    float col = map(tem2, - 10, 40, 0, 1);
    d = lerpColor(az, cal, col);

    float x1 = map(temperatura, - 7.5, 30, 0, 210);
    float y1 = map(tem1, - 10, 20, 0, 250);
    float z = map(tem2, - 10, 40, 0, 250);

    pushMatrix();
    translate(width / 2, height / 2);                       //Trasladar centro de elipses a la mitad del canvas
    rotate(radians(index * 360 / 30));                      //Disponer circularmente los elementos de la lista y dividirlos en 30
    stroke(ro);
    strokeWeight(2);
    line(8, y1, 0, 200);
    popMatrix();

    pushMatrix();
    translate(width / 2, height / 2);
    rotate(radians(index * 360 / 30));
    stroke(d, 80);
    strokeWeight(5);
    line(310, z, 290, 20);
    popMatrix();

    pushMatrix();
    translate(width / 2, height / 2);
    rotate(radians(index * 360 / 30));
    fill(c, x1);
    noStroke();
    ellipse(210, x1, 13, 13);
    popMatrix();
  }
}