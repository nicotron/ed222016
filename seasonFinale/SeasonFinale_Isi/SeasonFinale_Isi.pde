// Expresión Digital II - Diseño Digital - UDD - 2016
//Isidora Ordoñez.
//seasonfinaleisi

/*
En este código se visualizan los datos climáticos de la ciudad Barrow en Alaska, el código
cuenta con cuatro tipos de visualizaciones que enseñan distintos datos. En primer lugar, 
tenemos la visualización del void elipses (tecla '1'), la cual a través del color muestra
las temperaturas máxima y mínima graficadas con el color rojo y azul respectivamente, generando
una gama de rosas y morados por las frías temperaturas del lugar. También a través de un frameCount
vemos cómo cambia el tamaño de las elipses según los datos entregados del punto de rocío, y por último,
vemos cómo la opacidad es alterada por los datos de Visibilidad en kilómetros de Barrow.
En la segunda visualización llamada void lineas (tecla '2'), vemos cómo los colores son alterados nuevamente,
pero esta vez gracias a la velocidad del viento, creando gamas entre verdes y azules, y cómo también
el tamaño de estas líneas se ve alterado por la cantidad de nubes que hubo ese día.
La tercera visualización es el void triángulo (tecla '3'), la cual estudia la temperatura
según color y hacia dónde se direcciona el vértice, ocupando el punto 'y' de las otras dos aristas
como punto 0.
Por último el void circular (tecla '4'), este último void estudia el mar, los colores de las líneas
están dados por la presión del mar en tonos rojos y verdes para máxima y mínima respectivamente
y la ráfaga define el tamaño de la línea.
Para poder usar de una mejor manera los datos, estos tuvieron que mapear sus valores a través de la función
"map", además al código se le agregaron una serie de teclas para la reorganización de un año, pudiéndolo
ver en semestre ('f'), estaciones ('d'), meses ('s') y semanas ('s').
*/
/*
NIVEL: 4 visualizaciones (6.0) + 4.5 set de variables (8.0)
*/
// Creación de variables y Objeto:
Objeto[] o;
Table table;
int fila, a, c, objeto;
boolean b, b2, b3;
PFont titulo, bajada, texto;

// Inicialización de variables:
void setup() {
  size(1200, 700);

  table = loadTable("Barrow_Alaska.csv", "header");  //llama a la tabla de datos.
  o = new Objeto[table.getRowCount()];
 // Variables:  
  b = true;
  a = 360;
  c = 30;

 // Texto:
  titulo = createFont("Helvetica-Bold", 20);
  bajada = createFont("Helvetica", 12); 
  texto = createFont("Helvetica", 15);

//Creación de variable a datos a trabajar:
  for (int i = 0; i < table.getRowCount(); i++) {
    TableRow fila = table.getRow(i);

    int index = i; // esto no es necesario, porque i e index son los mismos valores
    int maxTemperature = fila.getInt("Max TemperatureC");
    int minTemperature = fila.getInt("Min TemperatureC");
    int meanTemperature = fila.getInt("Mean TemperatureC");
    int dewPointC = fila.getInt("Dew PointC");
    int minDewPointC = fila.getInt("Min DewpointC");
    int visibility = fila.getInt(" Mean VisibilityKm");
    int gustSpeed = fila.getInt(" Max Gust SpeedKm/h");
    int maxWspeed = fila.getInt("Max Wind SpeedKm/h");
    int meanWspeed = fila.getInt(" Mean Wind SpeedKm/h");
    float maxPressure = fila.getFloat(" Max Sea Level PressurehPa");
    float minPressure = fila.getFloat(" Min Sea Level PressurehPa");
    float cloud = fila.getFloat(" CloudCover");


    o[i] = new Objeto (i, index, gustSpeed, maxTemperature, minTemperature, meanTemperature, dewPointC, minDewPointC, visibility, maxPressure, minPressure, maxWspeed, meanWspeed, cloud);
  }
}

//Ejecución de programa:
void draw() {
  background(0);

 //Texto:
  noStroke();
  fill(50);
  rect(920, 00, 280, 130);

  textFont(titulo);
  fill(90, 149, 255);
  text("BARROW ALASKA 2015", 930, 20);

  textFont(bajada);
  fill(70, 232, 167);
  text(" 1 = elipses", 930, 60);
  text(" 2 = líneas", 930, 80);
  text(" 3 = triángulo", 930, 100);
  text(" 4 = circular", 930, 120);
  text(" a = semana", 1090, 60);
  text(" s = mes", 1090, 80);
  text(" d = estación", 1090, 100);
  text(" f = semestre", 1090, 120);


  if (objeto == 0) {
    textFont(texto);
    fill(70, 232, 167);
    text("El color está representado por la", 900, 550);
    text("temperatura, mientras más azul mas fría", 900, 570);
    text("el cambio del punto de rocío afecta en ", 900, 590);
    text("el tamaño y la visibilidad la opacidad.", 900, 610);
  }

  if (objeto == 1) {
    textFont(texto);
    text("El color está representado por la", 900, 550);
    text("velocidad del viento, mientras más", 900, 570);
    text("verde mas viento el tamaño de la ", 900, 590);
    text("línea está dado por la cantidad de nubes.", 900, 610);
  }

  if (objeto == 2) {
    textFont(texto);
    text("Los triángulos nos muestran la", 900, 550);
    text("temperatura. Mínima y máxima en el color,", 900, 570);
    text("y la media está dada por la punta del", 900, 590);
    text("triángulo, siendo la base de este los 0ºc.", 900, 610);
  }

  if (objeto == 3) {
    textFont(texto);
    text("El color de las líneas está dado por ", 900, 550);
    text("la presión del mar, siendo las máximas rojas", 900, 570);
    text("la longitud de la línea, está dada por la ", 900, 590);
    text("ráfaga de cada día.", 900, 610);
  }

 //Objetos:
  for (int i = 0; i < o.length; i++) {
    if (objeto == 0) {
      o[i].elipse();
    }

    if (objeto == 1) {
      o[i].linea();
    }

    if (objeto == 2) {
      o[i].triangulo();
    }

    if (objeto == 3) {
      // función legible solo en distribución anual
      o[i].circular(a);
    }


    o[i].dias(c);
  }
}

//Ejecución con teclado:
void keyPressed() {

  if (key == '1') {
    objeto = 0;
  }

  if (key == '2') {
    objeto = 1;
  }

  if (key == '3') {
    objeto = 2;
  }

  if (key == '4') {
    objeto = 3;
  }

  if (key == 'a') {
    a = 7;
    c = 7;
  }

  if (key == 's') {

    a = 365;
    c = 30;
  }

  if (key == 'd') {
    a = 91;
    c = 91;
  }

  if (key == 'f') {
    a = 180;
    c = 180;
  }
}