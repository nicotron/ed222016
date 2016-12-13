// Expresión Digital - Diseño Digital - UDD - 2016
// Max Cordero
// s01t01max

/*Crear una composicion usando figuras basicas de Processing 
e incluyendo variables de color, relleno y borde*/
int orange;//declarar variable color naranjo
int green;//declarar variable color verde
int black;//declarar variable color black
int white;//declarar variable color white
int borde;//declarar variable para definir stroke
float x;//declarar variable x

void setup () {
  size (500, 500);//definir tamano canvas
  background (white);//definir color de fondo
  orange = color (255, 160, 0);//definir tonalidad de naranjo
  green  = color (20, 200, 20);//definir tonalidad de verde
  black = color (0);//definir color negro
  white = color (255);//definir color blanco
  borde = 10;//definir tamano default de stroke
  x = 218.5;//definir valor de x
}
void draw () {
  //Cuadrado principal
  fill (black);//relleno negro
  stroke (white);//borde blanco
  rect (width/20, width/20, 450, 450);//coordenadas y tamano cuadrado

  //divisiones cuadrado principal
  fill (white);//relleno blanco
  stroke (white);//borde blanco
  rect (width/2, width/20, x, x);//rectangulo 1
  rect (width/20, width/2, x, x);//rectangulo 2

  //Dibujar circulo superior izquierdo
  fill (orange);//relleno naranjo
  strokeWeight(borde/2);//definir tamano borde
  stroke (white);//color borde
  ellipse (137.5, 137.5, 100, 100);//tamano y posicion circulo
  
  //Dibujar cuadrado inferior derecho 
  fill (white);//relleno blanco
  strokeWeight(borde);//grosor borde
  stroke (green);//color borde
  rect (312.5, 312.5, 100, 100);
  
///Linea superior derecha
  strokeWeight (borde);//grosor
  stroke (green);//color
  line (325, 137.5, 400, 137.5);//posicion y tamano linea

  //Triangulo
  stroke (orange);//color borde 
  strokeWeight (borde-3);//grosor borde
  fill (black);//relleno negro
  triangle(135, 315, 80, 410, 180, 410);//posicion y tamano triangulo
}