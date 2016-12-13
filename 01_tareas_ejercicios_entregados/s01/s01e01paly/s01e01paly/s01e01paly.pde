//Expresión Digital - Diseño Digital - UDD - 2016
//Paulina Descouvieres
//s01e01paly

//declarar variables de x e y
int x = 20;
int y = 60;

//pintar el fondo blanco
background(255);

//elipse
ellipse(x*0, x*0, y/2, y/2);
//linea 1
line(x, x, y, y);
//linea 2
line(x*0, x*2, x*4, x);
//rectangulo
rect(y, y, x, x);