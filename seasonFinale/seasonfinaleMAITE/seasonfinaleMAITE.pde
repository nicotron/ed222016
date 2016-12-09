/* Expresión Digital II - Diseño Digital - UDD - 2016
 Maite Iturriaga Batlle
 seasonfinale_MAITE
 
 Examen processing, mi código lee los datos meteorológicos de Aruba 2015.
 es necesario el uso del teclado para ver el proyecto, teclas: 1, 2, 3, 4.
 1. Muestra en una circunferencia gracias a líneas, la visibilidad mínima, media y máxima. 
 2. Muestra la humedad presente en el trimestre, consiste en mínima, media y máxima, se representa en opacidad y tamaño de elipses
 3. Muestra la temperatura que presentó Aruba en el año 2015, a través de un map y lerp de colores, las elipses cambian de tamaño y color dependiendo la mínima, media y máxima.
 4. Muestra la lluvia y nubes que se presentaron, todo esto visto mes a mes, los rectángulos varian en su eje x y opacidad (nubes), precipitaciones representados en puntos y grosor del punto define cantidad de mm.
 Este código cuenta con 5 set de variables y 4 visualizaciones distintas, correspondientes a: año, semestre, trimestre, mes y día. 
 */

/*
NIVEL: 6.0 (4 visualizaciones) + 7.0 más de 2 set de variables: 5 sets (8.5).
*/
Maite [] e;
Table tabla;
//Tipografía
PFont titulo, cuerpo;
int fila, k, manitos;

void setup() {

  size(1200, 740);
  background(51);

  //variable para if de variables
  manitos = 1;

  tabla = loadTable("data_Aruba.csv", "header");

  //Elección de tipografía
  titulo = createFont("HelveticaNeue-Bold", 12);
  cuerpo = createFont("HelveticaNeue-Light ", 10);

  e = new Maite[tabla.getRowCount()];

  for (int i = 0; i < tabla.getRowCount(); i++) {
    int index = i; // esto no es necesario, porque i e index son los mismos valores
    TableRow fila = tabla.getRow(i);

    //humedad
    int maxH = fila.getInt("Max Humidity");
    int meanH = fila.getInt(" Mean Humidity");
    int minH = fila.getInt(" Min Humidity");
    //temperatura
    int mint = fila.getInt("Min TemperatureC");
    int meant = fila.getInt("Mean TemperatureC");
    int maxt = fila.getInt("Max TemperatureC");
    //visibilidad
    int maxV = fila.getInt(" Max VisibilityKm");
    int meanV = fila.getInt(" Mean VisibilityKm");
    int minV = fila.getInt(" Min VisibilitykM");
    //precipitaciones
    int prec = fila.getInt("Precipitationmm");
    //nubes
    int nube = fila.getInt(" CloudCover");

    k = 30;

    e[i] = new Maite(index, maxt, meant, mint, maxV, meanV, minV, prec, nube, maxH, meanH, minH);
  }
}
void draw() {
  background(51);
  textFont(titulo);
  fill(255);
  text("Aruba, 2015", 20, 20);
  text("KeyPressed 1, 2, 3, 4", 535, 20);


  //descripción general del bloque de texto
  if (manitos == 1) {
    textFont(cuerpo);
    fill(255);
    text("Año", 20, 40);
    text("Visibilidad", 20, 60);
    text("Líneas Amarilla: Visibilidad Máxima - Líneas Blancas: Visibilidad Media - Líneas Celestes: Visibilidad Mínima", 330, 720);
  }

  if (manitos == 2) {
    textFont(cuerpo);
    fill(255);
    text("Trimestre", 20, 40);
    text("Humedad", 20, 60);
    text("Elipses tienen Opacidad y Tamaño representan: Humedad Máxima, Humedad Media, Humedad Mínima", 350, 720);
  }
  if (manitos == 3) {
    textFont(cuerpo);
    fill(255);
    text("Semestre", 20, 40);
    text("Temperatura", 20, 60);
    text("Elipses entre Naranjo y Rojo: Tº Máxima - Elipses entre Amarillo y Verde: Tº Media - Elipses entre Blanco y Celestes: Tº Mínima", 300, 700);
    text("Cambio de Tamaño y Contorno", 520, 720);
  }
  if (manitos == 4) {
    textFont(cuerpo);
    fill(255);
    text("Mes", 20, 40);
    text("Nubes - Lluvia", 20, 60);
    text("Puntos: Precipitaciones (mm) - Rectángulos: Nubes", 500, 700);
    text("Puntos: Stroke representa los mm - Rectángulos: eje x y su opacidad representan", 400, 720);
  }


  for (int i = 0; i < e.length; i++) {
    //descripción general del bloque de texto
    if (manitos == 1) {
      e[i].dias(k);
      e[i].visibilidad();
    }
    //descripción general del bloque de texto
    if (manitos == 2) {
      e[i].dias(k);
      e[i].humedad();
    }

    //descripción general del bloque de texto
    if (manitos == 3) {
      e[i].dias(k);
      e[i].temperatura();
    }
    //descripción general del bloque de texto
    if (manitos == 4) {

      e[i].dias(k);
      e[i].lluvia();
      e[i].nube();
    }
  }
}

void keyPressed() {

  if (key == '1') {
    manitos = 1;
    k = 51; //Año
  }

  if (key == '2') {
    manitos = 2;
    k = 120; //Trimestre
  }

  if (key == '3') {
    manitos = 3;
    k = 180; //Semestre
  }

  if (key == '4') {
    manitos = 4;
    k = 30; //Mes
  }
}