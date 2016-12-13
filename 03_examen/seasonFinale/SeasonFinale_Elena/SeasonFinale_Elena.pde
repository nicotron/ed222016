//Expresión Digital II - Diseño Digital - UDD - 2016
// M. Elena Errázuriz
//seasonfinaleELENAERRAZURIZ

/*
Se ha recolectado la data climática de Seefeld, Austria, del año 2015. De ésta se han elegido cuatro set de variables 
 (nivel de la marea, temperatura, visibilidad y vientos) junto con cuatro sistemas métricos de tiempo (año, mes, semana, días).
 Se ha organizado cada variable con una respectiva medida de tiempo, las cuales se pueden ver presionando las teclas 'a', 's',
 'd' y 'f', obedeciendo un orden de mayor a menor respectivamente.
 En la esquina superior izquierda se puede observar la ciudad, país y año. Inmediatamente abajo está la leyenda general con las
 indicaciones de las variables climáticas junto con sus respectivas teclas.
 En la esquina superior derecha, por otro lado, muestra la información particular de cada visualización, cambiando con ellas al
 apretar las teclas.
 El nivel del mar se ve representado por círculos y cuadrados variantes de tamaño y/o color dependiendo de los datos
 (máxima, mínima y media).
 La temperatura se ve mediante tres círculos concéntricos, de los cuales cada nivel representa la mínima, máxima y media
 respectivamente.
 La visibilidad está graficada como seis columnas, de las cuales tres son círculos que representan la máxima y la otra mitad la
 mínima mediante líneas. La media está representada por el color en degradé de los círculos.
 Por último, los vientos están representados por líneas. Éstas están divididas en dos grupos, moradas y rosadas. Las moradas
 representan el mínimo y las rosadas el máximo. Esto se logra por su fluctuación en el eje y, haciéndolas de distintos tamaños.
 La media se logra por el grosor estas mismas.
 */

/*
NIVEL: 4-1 visualizaciones (5.5), 4 set de variables (8.0)
*/

/*
Declaración de variables globales y del class.
 */
Elena [] e;
Table tabla;
PFont tipografia, light;
int datos, i;
char uno;

boolean anio;                                                      
boolean mes;                                                       
boolean semanas;                                                   
boolean dias;
boolean uno1;                                                      
boolean dos;                                                       
boolean tres;                                                   
boolean cuatro;

/*
Inicialización de las variables, determinar características para los textos, estado de los boolean y establecer
 el link con la carpeta de datos para poder emplearlos en el código.
 */
void setup() {
  size(1200, 750);                                                  //Tamaño del canvas

  anio = true;                                                     
  mes = false;                                                                                 
  semanas = false;                                                 
  dias = false;
  uno1 = true;                                                     
  dos = false;                                                                                 
  tres = false;                                                 
  cuatro = false;


  tipografia = createFont("HelveticaNeue-Bold", 12);               //Determinar tipografía y tamaño de letra
  light = createFont("HelveticaNeue", 12);

  tabla = loadTable("Seefeld_Austria.csv", "header");
  e = new Elena[tabla.getRowCount()];

  for (int i = 0; i < tabla.getRowCount(); i++) {                  //Inicializar la lectura ordenada de los datos
    TableRow datos = tabla.getRow(i);

    /*
Darle a cada columna de datos una variable, la cual, cada vez que se use, recorrerá los valores y los emplementará según lo deseado.
     */
    int index = i;
    String CET = datos.getString("CET");
    //set 1
    int temperatura = datos.getInt("Mean TemperatureC");
    int tem1 = datos.getInt("Min TemperatureC");
    int tem2 = datos.getInt("Max TemperatureC");
    //set 2
    int sea1 = datos.getInt(" Min Sea Level PressurehPa");
    int sea2 = datos.getInt(" Max Sea Level PressurehPa");
    int sea3 = datos.getInt(" Mean Sea Level PressurehPa");
    //set 3
    int vientomax = datos.getInt(" Max Wind SpeedKm/h");
    int vientomin = datos.getInt(" Mean Wind SpeedKm/h");
    int gust = datos.getInt(" Max Gust SpeedKm/h");
    //set 4
    int ver = datos.getInt(" Max VisibilityKm");
    int ver2 = datos.getInt(" Mean VisibilityKm");
    int ver3 = datos.getInt(" Min VisibilitykM");

    /*
Crear el nuevo objeto del class, llamándolo de la otra pestaña.
     */

    e[i] = new Elena(index, CET, temperatura, tem1, tem2, sea1, sea2, sea3, vientomax, vientomin, gust, ver, ver2, ver3);
  }
}

/*
Función que dibujará los textos (con su ubicación espacial y color) y las funciones creadas en el class.
 Estas últimas están dentro de un for que llama a todos los
 elementos encontrados dentro de la lista, repitiéndolos ordenadamente, creando una grilla.
 */
void draw() {
  background(230);

  textFont(tipografia);
  fill(0);
  text("Seefeld, Austria, 2015", 10, 20);
  textFont(light);
  fill(0);
  text("Leyenda:", 10, 40);
  text("Nivel del mar, año, tecla 'a'", 10, 60);
  text("Temperatura, mes, tecla 's'", 10, 80);
  text("Visibilidad, semana, tecla 'd'", 10, 100);
  text("Vientos, días, tecla 'f'", 10, 120);

  /*
Determinar qué se dibujará en cada estado de los boolean.
   */
  for (int i = 0; i < e.length; i++) {

    if (anio == true) {                                       
      e[i].dias(15);
      e[i].sealevel();
    } 

    if (mes == true) { 
      e[i].temp2();
    } 

    if (semanas == true) { 
      e[i].dias2(4);
      e[i].visible();
    } 

    if (dias == true) {
      e[i].dias3(7);
      e[i].vientos();
      e[i].vientos2();
    }
  }
  /*
Este boolean se encuentra fuera del for para que no se repita por el largo de la lista.
   Se muestra una sola vez.
   */
  if (uno1 == true) {                                       
    mar();
  } 

  if (dos == true) { 
    calor();
  } 

  if (tres == true) { 
    visibilidad();
  } 

  if (cuatro == true) {
    viento();
  }
}

/*
Las funciones para las descripciones individuales de las visualizaciones, usadas en el último set de booleans.
 */
void calor() {
  fill(0);
  text("Mínimo,", 1030, 20);
  text("tamaño líneas centrales", 1030, 40);
  text("de menor a mayor.", 1030, 60);
  text("Máximo,", 1030, 80);
  text("tamaño y color", 1030, 100);
  text("líneas periféricas", 1030, 120);
  text("tamaño de menor a mayor", 1030, 140);
  text("opacidad de mayor a menor.", 1030, 160);
  text("Media,", 1030, 180);
  text("color,", 1030, 200);
  text("morado menor, amarillo mayor", 1030, 220);
  text("transparencia,", 1030, 240);
  text("de mayor a menor", 1030, 260);
}

void mar() {
  fill(0);
  text("Mínimo,", 1060, 20);
  text("color y tamaño círculos", 1060, 40);
  text("de menor a mayor", 1060, 60);
  text("según recta numérica.", 1060, 80);
  text("Máximo,", 1060, 100);
  text("tamaño cuadrados", 1060, 120);
  text("de menor a mayor.", 1060, 140);
  text("Media,", 1060, 160);
  text("opacidad círculos", 1060, 180);
  text("de menor a mayor.", 1060, 200);
}

void visibilidad() {
  fill(0);
  text("Mínimo,", 1060, 20);
  text("longitud líneas.", 1060, 40);
  text("de menor a mayor.", 1060, 60);
  text("Máximo,", 1060, 80);
  text("tamaño círculos.", 1060, 100);
  text("de menor a mayor.", 1060, 120);
  text("Media,", 1060, 140);
  text("color círculos.", 1060, 160);
  text("amarillo mayor.", 1060, 180);
  text("azul menor", 1060, 200);
}

void viento() {
  fill(0);
  text("Mínimo,", 1060, 20);
  text("longitud líneas moradas.", 1060, 40);
  text("de menor a mayor.", 1060, 60);
  text("Máximo,", 1060, 80);
  text("longitus líneas rosadas.", 1060, 100);
  text("de menor a mayor.", 1060, 120);
  text("Media,", 1060, 140);
  text("opacidad líneas.", 1060, 160);
  text("de menor a mayor.", 1060, 180);
}

/*
Función que determina cada presión de una tecla como un estado de un boolean, dibujando los true y borrando los false.  
 */
void keyPressed() {

  if (key == 'a') {                                            
    anio = !anio;
    uno1 = !uno1;
  } 
  if (key == 's') {                                            
    mes = !mes;
    dos = !dos;
  }
  if (key == 'd') {                                            
    semanas = !semanas;
    tres = !tres;
  }
  if (key == 'f') {                                            
    dias = !dias;
    cuatro = !cuatro;
  }
}