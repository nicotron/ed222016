// Expresión Digital II - Diseño Digital - UDD - 2016
// Paulina Descouvieres
// seasonFinale_paly

// falta descripción general
// NIVEL 1 (4.0), + 1 set de variables: no existe más de una visualización entendible

Hawai [] h;

//Tabla para almacenar datos
Table tabla;

//Tipografía
PFont ciudad, datos;

//Navegación entre filas
int fila, i, j;

// int variables keypressed
int cambio;

int index;
int cd = 31;

void setup() {
  size(1200, 400);

  cambio = 1;
  ciudad = createFont("ArialNarrow-Bold", 15);
  datos = createFont("ArialNarrow", 15);

  tabla = loadTable("Hawai.csv", "header");
  h = new Hawai[tabla.getRowCount()];

  //Acceso a todas las filas de la tabla
  for (int i = 0; i < tabla.getRowCount(); i++) {
    TableRow fila = tabla.getRow(i);

    int index = i;

    //Acceso a cada columna de la tabla
    String dia = fila.getString("HST");

    //Temperatura
    int tmax = fila.getInt("Max TemperatureC");
    int tmean = fila.getInt("Mean TemperatureC");
    int tmin = fila.getInt("Min TemperatureC");

    //Visibilidad
    int vmax = fila.getInt(" Max VisibilityKm");
    int vmean = fila.getInt(" Mean VisibilityKm");
    int vmin = fila.getInt(" Min VisibilitykM");

    //Humedad
    int hmax = fila.getInt("Max Humidity");
    int hmean = fila.getInt(" Mean Humidity");
    int hmin = fila.getInt(" Min Humidity");

    //Nubes
    int clouds = fila.getInt(" CloudCover");


    h[i] = new Hawai(index, dia, tmax, tmean, tmin, vmax, vmean, vmin, hmax, hmean, hmin, clouds);
  }
}

void draw() {
  background(55);
  textFont(ciudad);
  fill(253);
  text("Hawai, 2015", 10, 20);

  if (cambio == 1) {
    textFont(datos);
    fill(253);
    text("MESES", 10, 40);
    text("- Todas las", 10, 60);
    text("variables", 10, 80);
  }

  if (cambio == 2) {
    textFont(datos);
    fill(253);
    text("ESTACIONES", 10, 40);
    text("- Temperatura", 10, 60);
    text("- Nubes", 10, 80);
  }

  if (cambio == 3) {
    textFont(datos);
    fill(253);
    text("SEMANAS", 10, 40);
    text("- Visibilidad", 10, 60);
    text("- Nubes", 10, 80);
  }

  if (cambio == 4) {
    textFont(datos);
    fill(253);
    text("DÍAS", 10, 40);
    text("- Humedad", 10, 60);
    text("- Nubes", 10, 80);
  }

  if (cambio == 5) {
    textFont(datos);
    fill(253);
    text("AÑO", 10, 40);
    text("- Máximas", 10, 60);
  }

  if (cambio == 6) {
    textFont(datos);
    fill(253);
    text("SEMESTRES", 10, 40);
    text("- Medias", 10, 60);
  }

  if (cambio == 7) {
    textFont(datos);
    fill(253);
    text("TRIMESTRES", 10, 40);
    text("- Mínimas", 10, 60);
  }

//Este código si no va, no va.
  //Todas las funciones
  //h[i].tMax();
  //h[i].tMean();
  //h[i].tMin();
  //h[i].vMax();
  //h[i].vMean();
  //h[i].vMin();
  //h[i].hMax();
  //h[i].hMean();
  //h[i].hMin();
  //h[i].Clouds();
  //h[i].dias(cd);

  for (int i = 0; i < h.length; i++) {
    //Falta descripción del cuadro de texto
    if (cambio == 1) {
      h[i].Clouds();// el nombre de la función no puede ser con Mayúscula ya que se refiere a una clase
      h[i].hMax();
      h[i].hMean();
      h[i].hMin();
      h[i].tMean();
      h[i].tMin();
      h[i].tMax();
      h[i].vMax();
      h[i].vMean();
      h[i].vMin();
      h[i].dias(cd);
    }
    //Falta descripción del cuadro de texto
    if (cambio == 2) {
      h[i].tMean();
      h[i].tMin();
      h[i].tMax();
      h[i].Clouds();// el nombre de la función no puede ser con Mayúscula ya que se refiere a una clase
      h[i].dias(cd);
    }
    /*
    Esta es la única visualización que es posible entender un poco, el resto de las 6 
    son completamente ilegibles, lo que deja la entrega con una sola visualización
    */
    //Falta descripción del cuadro de texto
    if (cambio == 3) {
      h[i].vMax();
      h[i].vMean();
      h[i].vMin();
      h[i].Clouds();// el nombre de la función no puede ser con Mayúscula ya que se refiere a una clase
      h[i].dias(cd);
    }

    //Falta descripción del cuadro de texto
    if (cambio == 4) {
      h[i].hMax();
      h[i].hMean();
      h[i].hMin();
      h[i].tMean();
      h[i].Clouds();// el nombre de la función no puede ser con Mayúscula ya que se refiere a una clase 
      h[i].dias(cd);
    }
    //Falta descripción del cuadro de texto
    if (cambio == 5) {
      h[i].tMax();
      h[i].vMax();
      h[i].hMax();
      h[i].dias(cd);
    }
    //Falta descripción del cuadro de texto
    if (cambio == 6) {
      h[i].tMean();
      h[i].vMean();
      h[i].hMean();
      h[i].dias(cd);
    }
    //Falta descripción del cuadro de texto
    if (cambio == 7) {
      h[i].tMin();
      h[i].vMin();
      h[i].hMin();
      h[i].dias(cd);
    }
  }
}

void keyPressed() {
  //Meses
  if (key == '1') {
    cambio = 1;
    cd = 31;
  }

  //Estaciones
  if (key == '2') {
    cambio = 2;
    cd = 92;
  }

  //Semanas
  if (key == '3') {
    cambio = 3;
    cd = 53;
  }

  //Días
  if (key == '4') {
    cambio = 4;
    cd = 7;
  }

  //Año
  if (key == '5') {
    cambio = 5;
    cd = 365;
  }

  //Semestres
  if (key == '6') {
    cambio = 6;
    cd = 183;
  }

  //Trimestres
  if (key == '7') {
    cambio = 7;
    cd = 123;
  }
}