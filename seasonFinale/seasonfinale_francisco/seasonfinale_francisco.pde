// Expresión Digital - Diseño Digital - UDD - 2016
// Francisco Barría
// seasonfinale_francisco

/*
Visualización de data, mostrando las características del clima en Tromso, Noruega. Cada elemento vertical corresponde a un día, siendo la característica principal,
 la temperatura que va del mas mínimo registrado (azul), al más cálido registrado (rojo). Además se agregó el viento en un formato homólogo a la temperatura.
 */

Objeto[] o; 
Table table; 

int fila, weekMax, weekMin, minDate, maxDate, a;
boolean flip;


void setup() {
  size(1200, 800);

  rectMode(RADIUS);
  colorMode(HSB, 360);

  noStroke();
  table = loadTable("Tromso_Norway.csv", "header");
  o = new Objeto [table.getRowCount()]; 
  // de esta forma la lista de objetos será del tamano de la tabla

  // Acceder a todas las filas de la tabla
  for (int i = 0; i < table.getRowCount(); i++) {
    
    TableRow fila = table.getRow(i); 

    int x = fila.getInt("Max TemperatureC");
    int y = fila.getInt("Min TemperatureC");
    int z = fila.getInt("Mean TemperatureC");

    int h = fila.getInt("Max Humidity");
    int j = fila.getInt(" Mean Humidity");
    int k = fila.getInt(" Min Humidity");

    int wind_max = fila.getInt(" Max Wind SpeedKm/h");
    int wind_mean = fila.getInt(" Mean Wind SpeedKm/h");

    int w = i;

    o[i] = new Objeto(x, y, z, w, wind_max, wind_mean, h, j, k);

    weekMin = 0;
    weekMax = 7;
  }
  maxDate = 7;
  a = 360;
}

void draw() {
  background(100);

  // todos juntos
  for (int i = weekMin; i < weekMax; i++) {
    o[i].display();
    o[i].texto();
  }
}
void keyPressed() {                                        // Botones para controlar los datos.
  if (key == 'p') {
    weekMin = 0;
    weekMax = 365;
  }
  if (key == 'o') {
    weekMin = 0;
    weekMax = 183;
  }
  if (key == 'i') {
    weekMin = 0;
    weekMax = 30;
  }
  if (key == 'u') {
    weekMin = 0;
    weekMax = 7;
  }
  if (key == 'y') {
    weekMin = 0;
    weekMax = 1;
  }
  if (key == 'r') {
    weekMin = 0;
    weekMax = 7;
    minDate = 0;
    maxDate = 7;
  }

  if (minDate>0) {
    if (key == 'v') {
      minDate --;
    }
  }
  if (minDate<maxDate) {
    if (key == 'b') {
      minDate ++;
    }
  }
  if (maxDate > minDate) {
    if (key == 'n') {
      maxDate --;
    }
  }
  if (maxDate < 365) {
    if (key == 'm') {
      maxDate ++;
    }
  }
  if (key == 'g') {
    weekMin = minDate;
    weekMax = maxDate;
  }
  if (weekMax != 365) {
    if (key == 'k') {
      weekMax ++;
    }
  }
  if (key == 'a') {
    a *= -1;
  }
  if (key == 's') {
    flip =! flip;
  }
}