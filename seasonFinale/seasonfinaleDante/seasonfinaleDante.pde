// Expresión Digital II - Diseño Digital - UDD - 2016
// Dante Crovetto
// seasonfinaleDante

/*
Se crean tres visualizaciones de datos, la primera, abriéndola presionando la tecla 'a', muestra una visualización con líneas en el contorno de un círculo. Las líneas que van hacia
afuera son la temperatura máxima, las líneas que van hacia dentro son la temperatura mínima, el color de cada línea muestra en un rango entre azul y amarillo la temperatura media. 
Además se dibujan líneas grises indicando la duración de cada mes, siendo enero la primera visualización en sentido horario.
La segunda, abriéndola presionando la tecla 's', muestra una visualización con líneas en el contorno de dos círculos. Las líneas que van hacia
afuera con un grosor mas grande son el punto de rocío máximo, la continuación de estas líneas es el punto de rocío mínimo, el color de cada línea muestra en un rango entre azul 
y amarillo el punto de rocío medio. Además se dibujan líneas grises indicando la duración de cada mes, siendo enero la primera visualización en sentido horario de la figura izquierda
y julio de la derecha.
La tercera, abriéndola presionando la tecla 'e', muestra cuatro visualizaciones con líneas desde el centro de cada círculo. Las líneas que van hacia afuera muestran la dirección del
viento en ángulos. La primera visualización correspondiente a verano inicia a las 12 en sentido horario, la segunda, a su derecha otoño, la tercera a mano izquierda abajo invierno y
por último, a mano derecha abajo primavera.
 */

// Se crean las variables y el class.
Objects [] objetos;
Table tabla;
PFont texto, texto2;
int datos, n_objetos, visualiza;

// Se crea el void setup, con el tamaño del canvas, las tipografías a usar. Se llama la tabla, se crean los objetos.
void setup() {
  size(1200, 600);
  texto = createFont("Arial", 30);
  texto2 = createFont("Arial", 17);
  tabla = loadTable("Agadez_Niger.csv", "header");
  objetos = new Objects[tabla.getRowCount()];

// Se crean las variables, se igualan a las variables provenientes de la tabla, y son enviados a la clase.
  for (int i = 0; i < tabla.getRowCount(); i++) {
    TableRow datos = tabla.getRow(i);

    int index = i; 
    int temperatura_max = datos.getInt("Max TemperatureC");
    int temperatura_mean = datos.getInt("Mean TemperatureC");
    int temperatura_min = datos.getInt("Min TemperatureC");
    int wind_direction = datos.getInt("WindDirDegrees");
    int dewpoint_max = datos.getInt("Dew PointC");
    int dewpoint_min = datos.getInt("Min DewpointC");
    int dewpoint_mean = datos.getInt("MeanDew PointC");


    objetos[i] = new Objects(index, temperatura_max, temperatura_mean, temperatura_min, dewpoint_max, dewpoint_mean, dewpoint_min, wind_direction);
  }
  visualiza = 0;
}

// Se crea el void draw, donde se crea un fondo, se ajustan los colores, se escriben los textos y se dibuja un rectángulo que estará debajo de la leyenda.
void draw() {
  background(#FFFCF7);
  stroke(#FFC66A);
  fill(#FFE3B7, 30);
  rect(880, 50, 315, 500);
  textFont(texto);
  fill(100);
  text("Agadez Niger 2015", 900, 90);
  textFont(texto2);
  text("a = Año", 900, 130);
  text("s = Semestre", 900, 160);
  text("e = Estación", 900, 190);

// Se escriben los datos dependiendo del número de visualización que esté activado.
  if (visualiza == 0) {
    text("Las líneas que van hacia afuera", 900, 220);
    text(" son la temperatura máxima.", 895, 250);
    text("Las líneas que van hacia dentro", 900, 280);
    text(" son la temperatura mínima.", 895, 310);
    text("El color es la temperatura media", 900, 340);
    text("Las líneas grises son los meses,", 900, 370);
    text("la línea que apunta a las 12 es Enero", 900, 400);
    text("y así continúa en sentido horario", 900, 430);
  }
  if (visualiza == 1) {
    text("Las líneas que van hacia afuera", 900, 220);
    text("con un grosor mas grueso", 895, 250);
    text("son el punto de rocío máximo.", 900, 280);
    text("Las líneas que continúan", 895, 310);
    text("son el punto de rocío mínimo", 900, 340);
    text("Las líneas grises son los meses,", 900, 370);
    text("la línea que apunta a las 12 es Enero", 900, 400);
    text("y así continúa en sentido horario,", 900, 430);
    text("El mes de julio comienza a las 12", 900, 460);
    text("En la figura derecha.", 900, 490);
  }
  if (visualiza == 3) {
    text("Las líneas que van hacia afuera", 900, 220);
    text("son la dirección del viento en ángulos.", 895, 250);
    text("Verano es la figura superior izquierda.", 900, 280);
    text("Otoño es la figura superior derecha", 895, 310);
    text("Invierno es la figura inferior izquierda", 900, 340);
    text("Primavera es la figura inferior derecha.", 900, 370);
    text("Cada estación del año comienza", 900, 400);
    text("a las 12.", 900, 430);
  }
// Se dibujan las visualizaciones provenientes de la clase a través de un for loop
  for (int i = 0; i < tabla.getRowCount(); i++) { 
    if (visualiza == 0) {
      objetos[i].year();
    }
    if (visualiza == 1) {
      objetos[i].semestre();
    }
    if (visualiza == 3) {
      objetos[i].mes();
    }
  }
}
// Se crean distintos void keyPressed para cambiar el dato de "visualiza" para así dibujar las diferentes visualizaciones.
void keyPressed() {
  if (key == 'a') {  
    visualiza = 0; 
  } 
  if (key == 's') { 
    visualiza = 1; 
  }
  if (key == 'e') { 
    visualiza = 3;  
  }
}