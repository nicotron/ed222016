//Expresión Digital - Diseño Digital - UDD - 2016
// Max Cordero
//s01e01max

/* Copiar los 4 elementos entregados por Nicotron usando variables, rect, line y ellipse de archivo s01e01_0.png.
*/

//declarar variables
int x = 20;
int y = 80;
//trazar elipse
ellipse(y/2, x, y-50, y-50);
//trazar rectangulo
rect(x, x, x, x);
//trazar recta
line(x, y/2, y, y);
//trazar recta
line(y, x*5, x*5, x*3);