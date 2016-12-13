//Expresión Digital - Diseño Digital - UDD - 2016
//Francisco Barría
//s01e01pancho
//Es el n°45. Dos lines que se cruzan(no perpendicularmente), con un cuadrado tangente a una punta y la mitad de una elipse al borde.
int x = 40;
int z = 100;
int y = 60;
line(x,x,x,z);
line(y,x,x/2,x*2);
rect(y,x,x/2,x/2);
ellipse(z,y,y/2,y/2);