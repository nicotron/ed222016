//Expresión Digital - Diseño Digital - UDD - 2016
//Ana María Ortiz
//s01t01anamaria

/*
linea blanca, circulo calipso y borde blanco, cuadrado amarillo y punto negro.
*/

int r, g, b;
int x, y;

//linea
stroke(255);
int x=0;
int y=50;
//linea diagonal abajo en la mitad izquierda color blanco
line(x,y,40,80);

//elipse
fill(46,215,251);
strokeWeight(2);
int tam = 50;
x=10;
y=100;
// circunferencia esquina izquierda abajo color calipso y borde blanco
ellipse(x,y,-tam,tam);

//punto
stroke(0);
strokeWeight(3);
x=20;
y=20;
//punto negro arriba a la izquierda
point(x,y);

//cuadrado
fill(251,234,46);
noStroke();
x=70;
y=30;
//cuadrado amarillo a la derecha
rect(x,y,20,30);