// Expresión Digital - Diseño Digital - UDD - 2016
// Catalina Ringeling Selman
//s02t01cringelings

/*
Descripción en español de lo que se verá una vez que corra el programa
*/

//Declarar Variables de x e y
int x = 20;
int y = 10;

//Colores a usar
//Rojo Opaco.
//Rojo Anaranjado.
//Naranjo.
//Azul.
//Rosado.
//Morado Claro Opaco.
//Negro.

//Color de Fondo
background(175, 183, 205);
//Figuras que se dibujarán

//Rectángulos que van por debajo de los ellipses y líneas
//Diferentes colores de rellenos
//Colores Opacos
//Rectángulo Nº1 a la izquierda
fill(132, 170, 223);
strokeWeight(0);
rect(y-11, x-10, y+1, x+62);
//Rectánngulo Nº2 arriba
fill(182, 87, 50);
rect(x-10, y-10, x+61, y);
//Rectángulo Nº3 a la derecha
fill(132, 170, 223);
rect(y+80, x-10, y, x+62);
//Rectángulo Nº4 abajo
fill(182, 87, 50);
rect(x-10, y*9, x+10, y);

//Cuatro ellipses en diferentes posiciones, teniendo contacto con otro ellipse.
//El color es el mismo pero variando en la escala de B (azules).
//El grosor del borde de cada ellipse también va variando.
//Ellipse grande relleno con color rojo opaco.
fill(223, 130, 140);
strokeWeight(8);
ellipse(x*4, x*4, x*4, x*4);
//Ellipse más pequeño con color rojo opaco más anaranjado.
strokeWeight(6);
fill(223, 130, 123);
ellipse(x*3, x*3, x*3, x*3);
//Ellipse aún más pequeño con un rojo aún más anaranjado opaco.
strokeWeight(4);
fill(223, 130, 110);
ellipse(y+25, x*2, y+x, x+10);
//Ellipse más pequeño y naranjo, el grosor del borde es el más delgado
strokeWeight(2);
fill(223, 130, 105);
ellipse(x-5, x+y, x, x);

//Tres puntos diferentes con diferentes grosores
//Punto Nº1
strokeWeight(8);
point(x, x+10);
//Punto Nº2
strokeWeight(10);
point(x+25, x+20);
//Punto Nº3
strokeWeight(16);
point(x+62, x+45);

//Cuatro líneas que forman un cuadrado al interior y rectángulo a sus costados, por encima de los círculos.
//Cambia el grosor de las líneas. Todas tienen diferente grosor.
//Cambio de color, de azul a rosado pasando por morado claro opaco.
//Línea de arriba
stroke(170, 200, 227);
strokeWeight(2);
line(x*5, x-10, y-10, y);
//Línea del costado izquierdo
stroke(100, 200, 227);
strokeWeight(1);
line(x-10, x*5, y, y-10);
//Línea de Abajo
stroke(230, 200, 227);
strokeWeight(4);
line(x*5, x+70, y-10, y+80);
//Línea del costado derecho
stroke(200, 200, 227);
strokeWeight(3);
line(x+70, x*5, y+80, y-10);