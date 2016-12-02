//Expresión Digital - Diseño Digital - UDD - 2016
//Benjamin Gutierrez 

Cuerpo[] c;
Table tabula;//una tabla para almacenar las datos
PFont titulo, bajada, instruc;
int cambio = 0;
//navegacion entre filas
int fila, index, i;
int u = 30;
boolean diaporanio;
int iteracion;


void setup() {
  size(1200, 700);
  titulo = createFont("Helvetica-Bold", 30);
  bajada = createFont("Helvetica", 12);
  instruc =createFont("Helvetica", 20);
  tabula = loadTable("RADUZHNYJ_Russia.csv", "header");
  c = new Cuerpo[tabula.getRowCount()]; // de esta forma la lista de objetos sera del tamaño de la tabla
  iteracion = 1;

  //Acceder a todos las filas de la tabla
  for (int i = 0; i < tabula.getRowCount(); i++) {
    //paso por cada fila del CSV
    TableRow fila = tabula.getRow(i); // cambia i, baja una fila del CSV
    int index = i;

    //para acceder a cada columna dentro de cada fila y crear una variable por cada columna con nombre del header
    String day = fila.getString("DAY");
    int maxt = fila.getInt("Max TemperatureC");
    int meant = fila.getInt("Mean TemperatureC");   
    int mint = fila.getInt("Min TemperatureC");
    int humx = fila.getInt("Max Humidity");
    int humean = fila.getInt(" Mean Humidity");
    int humn = fila.getInt(" Min Humidity");
    int wind = fila.getInt("WindDirDegrees");
    int wndspm = fila.getInt(" Mean Wind SpeedKm/h");
    int wndspx = fila.getInt(" Max Wind SpeedKm/h");

    // hago un objeto con la informacion de cada fila
    c[i] = new Cuerpo(index, day, maxt, meant, mint, humx, humean, humn, wind, wndspm, wndspx, i);
  }
} 
void draw() {
  background(120); 
  if (!diaporanio) {
    pushMatrix();
    translate(width * .60, height * .60);
    textFont(titulo);
    fill(255);
    text("RADUZHNYJ Russia 2015", 0, 0);
    popMatrix();
    textFont(bajada);
    fill(255);
    text("Examen Expreción Digital II", 15, 25);
    text("Benjamin Gutierrez", 30, 45);
    text("1 de diciembre 2016", 27, 65);
  }

  if (diaporanio) {

    if ( iteracion == 1) {
      pushMatrix();
      translate(width *.80, height * .90);

      textFont(bajada);
      fill(255);
      text("Mensual", 25, 25);
      text("Temperatura Maxima", 15, 45);
      popMatrix();
    }
    if ( iteracion == 2) {
      pushMatrix();
      translate(width *.80, height * .90);

      textFont(bajada);
      fill(255);
      text("Semanal", 25, 25);
      text("temperatura Minima", 15, 45);
      popMatrix();
    }
    if ( iteracion == 3) {
      pushMatrix();
      translate(width *.80, height * .90);

      textFont(bajada);
      fill(255);
      text("Semestral", 25, 25);
      text("Temperatura Media", 15, 45);
      popMatrix();
    }
    if ( iteracion == 4) {
      pushMatrix();
      translate(width *.80, height * .90);

      textFont(bajada);
      fill(255);
      text("Anual", 25, 25);
      text("Dirección del Viento", 15, 45);
      popMatrix();
    }
    if ( iteracion == 5) {
      pushMatrix();
      translate(width *.80, height * .90);

      textFont(bajada);
      fill(255);
      text("Semanal", 35, 25);
      text("Velociadad Maxima del viento", 15, 45);
      text("Velociadad Media del viento", 16, 65);
      popMatrix();
    }
    for (int i = 0; i < c.length; i++) {

      if (iteracion == 1) {
        c[i].dias(u);
        c[i].tempx();
      }

      if (iteracion == 2) {
        c[i].dias(u);
        c[i].tempn();
      }

      if (iteracion == 3) {
        c[i].dias(u);
        c[i].meant();
      }


      if (iteracion == 4) {
        c[i].dias(u);
        c[i].viento();
      }


      if (iteracion == 5) {
        c[i].dias(u);
        c[i].wndrec();
        c[i].windsdp();
      }
    }
  }
}



void keyPressed() {
  if (key == 'q') {
    iteracion = 1;
    u = 30;
  }
  if (key == 'w') {
    iteracion = 2;
    u = 52;
  }
  if (key == 'e') {
    iteracion = 3;
    u = 182;
  }
  if (key == 'r') {
    iteracion = 4;
    u = 365;
  }
  if (key == 't') {
    iteracion = 5;
    u = 52;
  }
  if (key == ' ') {
    diaporanio = !diaporanio;
  }
}