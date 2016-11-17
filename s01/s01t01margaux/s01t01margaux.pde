//Expresión Digital - Diseño Digital - UDD - 2016
//Margaux Leroy
//s01e01margaux

/*
Ejercicio para trabajar los colores, espesores y rellenos
*/

//declaración de variables
int x = 50;
int y = 0;

int a = 250;
int b = #F34F3D;

//color del fondo
background(b);

//rectángulo de la misma color del fondo con una línea blanca de 4px
strokeWeight(4);
stroke(a);
fill(b);
//otro rectángulo más pequeño al interior comienza a la izquierda con un línea de 2px
rect(x, y, 30, 30);
strokeWeight(2);
rect(x, y, 20, 20);
//elipse grande con un fondo blanco
fill(a);
ellipse(y, x, 50, 50);
//otra elipse al interior del otro con una linea de la misma color del fundo
stroke(b);
ellipse(y, x, 40, 40);
//línea que separa los elipses de los rectángulos
stroke(a);
line(y, y, 100, 100);


// Margaux te faltó agregar el color negro y además otro color de tu elección para usarlos durante el semestre.