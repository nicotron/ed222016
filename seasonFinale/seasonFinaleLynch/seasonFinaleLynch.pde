//no hay nombre
//no hay descripción

/*
NIVEL: 2 visualizaciones (5.0) + 3 set de variable (7.0)
*/


Table table;
int fila;
int days;
int select = 0;
Boolean BshowInfo = false;
String[] semana = {"Jueves", "Viernes", "Sábado", "Domingo", "Lunes", "Martes", "Miércoles"};
int semanaDay = 0;
PFont fuente;
int precipitation;
PImage info;
int pantalla = 0;
int weekS = 0;
int weekO = 7;
int visu = 0;

Dia[] dia;

Boton btInfo;
Boton btDay;
Boton btWeek;

void setup() {
  size(700, 700);
  table = loadTable("Reykjavik_Iceland.csv", "header");
  dia  = new Dia[table.getRowCount()]; 
  days = table.getRowCount();
  fuente = loadFont("PerpetuaTitlingMT-Light-48.vlw");
  info = loadImage("info.png");
  for (int i = 0; i < table.getRowCount(); i++) {

    TableRow fila = table.getRow(i);
    String titulo = fila.getString("GMT");
    String eventos = fila.getString("Events");
    int maxT = fila.getInt("maxT");
    int meanT = fila.getInt("meanT");
    int minT = fila.getInt("minT");
    int maxWSpeed = fila.getInt("MWS");
    int meanWSpeed = fila.getInt("meanWS");
    int wDir = fila.getInt("WindDirDegrees");
    precipitation = fila.getInt("Precipitationmm");
    dia[i] = new Dia(titulo, maxWSpeed, meanWSpeed, wDir, eventos, precipitation, i, minT, meanT, maxT, i);
  }
  btInfo = new Boton(width - 100, height - 100, 100, true, "info");
  btDay = new Boton(0, height - 100, 100, false, "day");
  btWeek = new Boton(0, height - 200, 100, false, "week");
}

void draw() {
  textFont(fuente);
  background(30);

  if (pantalla == 0) {
    dia[select].precip();
    dia[select].display();
    dia[select].eventos(70);
    dia[select].datos();
  }

  if (pantalla == 1) {
    for (int i = weekS; i < weekO; i++) {    
      if (visu == 0) {
        dia[i].display();
        dia[i].eventos((i - weekS) * 20);
      }
      if (visu == 1) dia[i].temps();

      dia[weekS].datos();
    }
  }

  btDay.display();
  btWeek.display();
  btInfo.display();
}
//Falta descripción del mousePressed
void mousePressed() {

  if (btInfo.mouseOver()) {
    btInfo.showInfo = !btInfo.showInfo;
  }
  if (btDay.mouseOver()) {
    pantalla = 0;
  }
  if (btWeek.mouseOver()) {
    pantalla = 1;
  }
}

//Falta descripción del keyPressed
void keyPressed() {

  if (key == CODED) {
    for (int i = 0; i < days; i++) {
      dia[i].transp = 0;
    }
    if (keyCode == UP) tecUp();
    if (keyCode == DOWN) tecDown();
    if (keyCode == LEFT) tecLeft();   
    if (keyCode == RIGHT)  tecRight(); 

    if (select < 0) select = 0;
    if (select > 364) select = 364;
    if (weekS < 0) weekS = 0;
    if (weekS > 357) weekS = 357;
  }
  if (key == 'a') visu = 0;
  if (key == 's') visu = 1;
}