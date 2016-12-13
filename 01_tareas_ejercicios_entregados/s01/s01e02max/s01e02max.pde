

//declarar variables
//Expresión Digital - Diseño Digital - UDD - 2016
// Max Cordero
//s01e02max

/* Copiar los 4 elementos entregados por Nicotron usando variables, rect, line y ellipse. archivo s01e01_39.png*/

//declarar variables
int x = 20;
int y = 40;
//trazar rectangulo
rect(x-20, y, x, x);
//trazar recta
line(x, y*2, x*3, y*2);
//trazar recta
line(y*2, x-20, y*2, x*3);
//trazar elipse
ellipse(y*2, y, y, y);