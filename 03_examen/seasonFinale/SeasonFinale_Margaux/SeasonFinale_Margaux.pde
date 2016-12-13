//Expresión Digital - Diseño Digital - UDD - 2016
//Margaux Leroy
//seasonfinalemargaux

/*
Este código representa la temperatura máxima, mínima y media 
de la ciudad de Jakarta en Indonesia. 
La temperatura máxima se representa como el círculo más grande que amplia o reduce
en función del día. Es lo mismo para el círculo más pequeño que representa la temperatura mínima.
Para la mediana, es la línea en el medio que crece o decrece.
No tuve éxito con mi programa. Vale un 1, pero lo subo de todas formas.
*/

/*
NIVEL: 1 una visualización (4.0) + sin set de variables a visualizar
*/

//Declaración de variables
Temperatura[] e;
Table t;
int fila, d, n;

void setup() {  
  background(#151927);  // color del fundo
  size(800, 800);       // tamaño del canvas
  
  //Inicialización table 
  t = loadTable("Jakarta_Indonesia.csv", "header");
  e = new Temperatura[t.getRowCount()];
  
  for (int i = 0; i < t.getRowCount(); i++) {
    int index = i;
    TableRow fila = t.getRow(i);
    //Importación de los datos de temperatura
    int tmax = fila.getInt("Max TemperatureC");
    int tmin = fila.getInt("Min TemperatureC");
    int tmean = fila.getInt("Mean TemperatureC");

    d = 30;      
    
    //Objeto con datos
    e[i] = new Temperatura(index, tmax, tmin, tmean);
   }
   n = 1;
 }
  
void draw() {
    for (int i = 0; i < e.length; i++) { 
      if (n == 1) {
        e[i].dias(d);
        e[i].TempMax();
        e[i].TempMin();
        e[i].TempMean();
      }
   }
}

void keyPressed() {
  if(key == 'a') {
    n = 1;
    d = 1; //día
  }
  if(key == 'b') {
    n = 2;
    d = 7; //semana
  }
  if(key == 'c') {
    n = 3;
    d = 30; //mes
  }
  if(key == 'd') {
    n = 4;
    d = 365; //año
  }
}