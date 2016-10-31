// Expresión Digital II - Diseño Digital - Facultad de Diseño - Universidad del Desarrollo - 2016
// Catalina Ringeling Selman
// s10c01cringelings

/* Al correr el Programa, se verán figuras que rotan en cierto ángulo (círculos y líneas), otras 
 figuras que rotan y van cambiando de forma (rectángulos) y todas las figuras se van moviendo en el canvas.
 Se crea un fondo blanco donde se dibujan dos círculos que giran con una linea cada uno y van girando en su 
 propio eje y se van moviendo con respecto al eje x e y. A igual que un rectángulo que se dibuja que va 
 cambiando de forma y tamaño mediante va girando en su propio eje mientras se mueve en el eje x e y.
 */
 // La descripción de la rotación de los objetos no es en sus ángulos, sino que en su eje inferior, los ángulos permiten rotación, no la generan.
 // NIVEL 1
//Estas variables son globales en la clase, deben estar escritas en ella. 
int a;              //Se crea una variable entera para usar en uno de los objetos.
color c1, c2, c3;   //Se señalan las Variables a usar en los colores
float amt;          //Se señala un valor decimal a usar en los colores
//Estas variables son globales en la clase, deben estar escritas en ella. 

boolean cambio;     //Se crea un boolean llamado cambio.

Catalina[] c = new Catalina[25];  // Se crea la clase Catalina

void setup() {                            //Se ejecuta al iniciar el programa.
  size(600, 600);                         //Tamaño del Canvas
  cambio = true;                         //Se indica si el boolean es verdadero o falso para cuando se inicie el programa.
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      int total = j + i * 5;
      float ix = i * 25;
      float jy = j * 25;
      c[total] = new Catalina(ix, jy, ix + 5, jy + 5, (int)random(0), (int)random(0), random(0));  //se mencionan las variables j, i, ix y ji
      // ¿qué significa el comentario anterio?
      println(total); // arrastre de ejercicios en clase, se enseño para debuggin, con proposito específico no necesario para certamen  
    }
  }
}

void draw() {                              //Se ejecuta cada vez que se inicia el programa. 
  background(253);                         //Color de fondo - Blanco.
  translate(width * .05, height * .05);    //El origen de cada variable se cambia. El alto x .05 y el ancho x .05.
  a++;                                     //El a va aumentando 1 en 1.

/*Cada cierto tiempo, el boolean con nombre cambio, cambia de ser verdadero a ser falso y nuevamente verdadero, así sucesivamente. 
En el caso que sea falso, se hacen rectángulos.*/
  if (frameCount % 200 == 0) {  // Se ocupa para cambiar estados del boolean. "Refresca" cada void draw.
    cambio = !cambio;
  }
  if (cambio == true) {
    for (int i = 0; i < c.length; i++) {
      c[i].lineaCirculo1();
      c[i].lineaCirculo2();
      c[i].mover();
    }
  }   
  if (cambio == false) {
    for (int i = 0; i < c.length; i++) { // cuando la boolean cambia de estado, no es necesario escribir un for loop para cada estado, todo debe pasar dentro de el primer for loop si es que los objetos son los de la lista a usar.
      c[i].rectangulo();
      c[i].mover1();
    }
  }
}