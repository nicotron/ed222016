//Expresión Digital - Diseño Digital - UDD - 2016
//Catalina Juez
//Seasonfinale

objeto [] e;
Table tabla;
int fila, d;

void setup() {

  textSize(35);
  fill (0, 0, 0);
  text("Ttaly", 100, 30); 

  textSize(16);
  text("a = año ", 100, 50);
  text("s = semestre ", 250, 50);
  text("w = semana ", 400, 50);
  text("m = meses ", 550, 50);
  text("e = salir ", 700, 50);

  fullScreen();
  background(255, 255, 255);
  tabla = loadTable("Firenze_Peretola_Italy.csv", "header");
  e = new objeto[tabla.getRowCount()];

  for (int i = 0; i < tabla.getRowCount(); i++) {
    int index = i;
    TableRow fila = tabla.getRow(i);
    int mint = fila.getInt("Min TemperatureC");
    int maxt = fila.getInt("Max TemperatureC");

    d = 30;
    e[i] = new objeto( index, mint, maxt, i);
  }
}

void draw() {
  background(230);
  for (int i = 0; i < e.length; i++) {

    e[i].dias(d);
    e[i].cuadrado();
    e[i].cuadradodos();
  }
}

void keyPressed() {
  if (key =='a') {
    d = 30; // año
  }
  if (key == 's') {
    d = 180; //semestre
  }
  if (key =='w') {
    d = 7; //semana
  }
  if (key == 'm') {
    d = 12; //meses
  }
  if ( key == 'e') {
    exit(); //salir
  }
}