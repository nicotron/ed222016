// Expresión Digital II - Diseño Digital - UDD - 2016
// Max Cordero
// seasonFinaleMax
/*Programa que muestra una visualización de datos de la cuidad de Miami durante el año 2005.
Se crearon 3 set de variables. Si se apreta 1 se Temperatura Máxima, Temperatura Media y Lluvia agrupados en días con el fin de visualizar el año completo.
Si se apreta 2 se muestra la relación entre humedad máxima y nubes agrupados en semestre.
Por último, si se apreta 3 se muestra la relación entre las ráfagas de viento, la humedad máxima y el viento. */

/*
NIVEL: 3 visualizaciones (solo 2 funcionan bien) + 5 set de variables (8.0)
*/

Miami2005 [] m;

//Llamar tabla
Table tabla;
PFont tipografia, light;



//Establecer relación de filas
int fila, i, j;

int index;
int cd = 30;
int variable;

void setup() {
  size(1200, 900);
  variable = 1;

  tipografia = createFont("HelveticaNeue-Bold", 16);
  light = createFont("HelveticaNeue", 16);

  tabla = loadTable("2005.csv", "header");
  m = new Miami2005[tabla.getRowCount()];


  for (int i = 0; i < tabla.getRowCount(); i++) {
    TableRow fila = tabla.getRow(i);

    int index = i; // esto no es necesario, porque i e index son los mismos valores

    //relacionar datos con columnas
    String dia = fila.getString("EST");
    int tmax = fila.getInt("Max TemperatureC");
    int tmean = fila.getInt("Mean TemperatureC");
    int tmin = fila.getInt("Min TemperatureC");
    int vmax = fila.getInt("Max VisibilityKm");
    int vmean = fila.getInt("Mean VisibilityKm");
    int vmin = fila.getInt("Min VisibilitykM");
    int hmax = fila.getInt("Max Humidity");
    int hmean = fila.getInt("Mean Humidity");
    int hmin = fila.getInt("Min Humidity");
    int clouds = fila.getInt("CloudCover");
    int rain = fila.getInt("Precipitationmm");
    int gust = fila.getInt("Max Gust SpeedKm/h");
    int wind = fila.getInt("Max Wind SpeedKm/h");


    m[i] = new Miami2005(index, dia, tmax, tmean, tmin, vmax, vmean, vmin, hmax, hmean, hmin, clouds, rain, gust, wind);
  }
}

void draw() {
  background(255);

  textFont(tipografia);
  fill(0, 0, 255);
  text("Miami, FL, 2005", 10, 20);
  textFont(light);
  fill(255, 0, 0);
  text("Temperatura y Lluvia anual : '1'", 250, 20);
  text("Humedad y Nubes : '2'", 600, 20);
  text("Vientos, Humedad y Lluvia : '3'", 930, 20);

//llamar funciones dentro del class
  for (int i = 0; i < m.length; i++) {
    if (variable  == 1) {
      m[i].tMax();
      m[i].leyenda1();
      m[i].meses(cd);
    }
    if (variable  == 2) {
      m[i].hMax();
      m[i].leyenda2();
      m[i].semestre(cd);
    }
    if (variable  == 3) {
      m[i].katrina();
      m[i].leyenda3();
      m[i].estacion(cd);
    }
  }
}

//crear voids para cambiar las visualizaciones
void keyPressed() {
  if (key == '1') {
    variable = 1;
    cd = 30;
  }
  if (key == '2') {
    variable = 2;
    cd = 180;
  }
  if (key == '3') {
    variable = 3;
    cd = 90;
  }
}