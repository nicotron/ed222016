//Expresión Digital II - Diseño Digital - UDD - 2016
// Ana María Ortiz
//seasonfinaleANAMARIA
/* Este código está hecho en base a los datos del clima de la ciudad de Praga, se enceuntran las visualizaciones de temperatura (máximo,
 media y mínima), nubes, humedad (máximo, media y mínima) y precipitaciones en semanas, mes, semestres y días respectivamente. 
 La visualización de temperatura en semanas se ve a través de columnas de círculos que de acuerdo a su tamaño y color muestran su valor. La 
 máxima fluctúa entre rojo y amarillo, la media entre morado y naranjo y la mínima entre verde y blanco. 
 La visualización de nubes en meses son círculos que de acuerdo a su tamaño y color muestran la cantidad de nubes, mientras más grande y 
 blanca es el círculo, más nubes hubo ese día y mientras más chicos y verdes, menos hubo.
 La visualización de humedad en semestre, son cuadrados que de acuerdo a su tamaño muestran los niveles de humedad.
 La visualización de precipitaciones en días se muestra en una circunferencia formada por líneas que de acuerdo a su largo muestran
 si hubo precipitaciones.
 */

 /*
NIVEL 4 visualizaciones (6.0) + 4 set de variables (7.5)
 */

Calu [] o;
Table tabla; //datos
PFont titulo, bajada, tecla; //texto
int fila, t, r, p;

void setup() {
  size(1150, 750);
  background(65);

  tabla = loadTable("Prague_Czech_Republic.csv", "header");
  titulo = createFont("Helvetica-Bold", 14);
  tecla = createFont("Helvetica", 10);
  bajada = createFont("Helvetica", 12);

  o = new Calu[tabla.getRowCount()]; 

  for (int i = 0; i < tabla.getRowCount(); i++) {
    int index = i;
    TableRow fila = tabla.getRow(i);

    //TEMPERATURA
    int maxte = fila.getInt("Max TemperatureC");
    int meante = fila.getInt("Mean TemperatureC");
    int minte = fila.getInt("Min TemperatureC");

    //HUMEDAD
    int maxhu = fila.getInt("Max Humidity");
    int meanhu = fila.getInt(" Mean Humidity");
    int minhu = fila.getInt(" Min Humidity");

    //PRECIPITACIONES
    float pre = fila.getFloat("Precipitationmm");

    //NUBES
    int nube = fila.getInt(" CloudCover");

    t = 30;
    o[i] = new Calu(index, maxte, meante, minte, maxhu, meanhu, minhu, pre, nube);
  }
}

void draw() {
  //título
  background(65);
  textFont(titulo);
  fill(255);
  text("PRAGA 2015", 15, 20);

  textFont(tecla);
  fill(255);
  text("Key Pressed 1, 2, 3, 4", 5, 740);

  //key press temperatura
  if (p == 1) { //tecla key press
    textFont(bajada);
    fill(255);
    text("Temperatura", 15, 35);
    text("Semanas", 15, 48);
  }

  //key press nubes
  if (p == 2) { 
    textFont(bajada);
    fill(255);
    text("Nubes", 15, 35);
    text("Meses", 15, 48);
  }

  //key press humedad
  if (p == 3) { 
    textFont(bajada);
    fill(255);
    text("Humedad", 15, 35);
    text("Semestre", 15, 48);
  }

  //key press precipitaciones
  if (p == 4) { 
    textFont(bajada);
    fill(255);
    text("Precipitaciones", 15, 35);
    text("Días", 15, 48); //se ve todo el año, al igual que en las otras visualizaciones. 
    // la palabra "Días" no describe lo que se visualiza
  }

  for (int i = 0; i < o.length; i++) {
    //temperatura
    if (p == 1) {
      o[i].dias(t);
      o[i].temp();
    }

    //nubes
    if (p == 2) {
      o[i].dias(t);
      o[i].nubes();
    }

    //humedad
    if (p == 3) {
      o[i].dias(t);
      o[i].humedad();
    }

    //precipitaciones
    if (p == 4) {
      o[i].dias(t);
      o[i].precipitacion();
    }
  }
}

void keyPressed() {

  if (key == '1') { //semanas
    p = 1;
    t = 7;
  }
  if (key == '2') { //dias por mes
    p = 2;
    t = 12;
  }

  if (key == '3') { //semestre 
    p = 3;
    t = 180;
  }

  if (key == '4') { //día
    p = 4;
    t = 30;
  }
}