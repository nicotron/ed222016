//Expresión Digital - Diseño Digital - UDD - 2016
//Benjamin Gutierrez
//s02t03Benja

/*
linea blanca saliendo del lado superior, ellipse morada , un cuadrado morado oscuro con borde negro y una linea negra cruzandolo diagonalmente en dirección derecha abajo*/

int x = 20;
int y = 60;
int u = 50;
int i = 30;
int o = 100;

fill(96, 59, 133);
noStroke();
ellipse(u, y, i, i);

fill(67, 59, 103);
stroke(255,255,255);
rect(x, y, x, x);

stroke(0,0,0);
line(x, y, y, o);

stroke(255,255,255);
strokeWeight(10);
line(60,0, 60, 40);