//Expresión Digital - Diseño Digital - UDD - 2016
//Benjamin Gutierrez
//s01c01benja

/*una ellipse al lado superiro izquierdo,
una linea diagona en medio y otra saliendo
desde el borde superior izquierdo hasta el medio 
y un cuadrado por el borde de abajo por el lado izquierdo*/

int x = 0;
int y = 20;
int h = 30;
int z = 40;
int s = 60;
int k = 80;

line(k,x, s, s);//linea salendo del borde superior
line(z, z, y, s);//linea al medio del canvas
rect(s, k, y, y);//cuadrado en borde inferiror al lado derecho
ellipse(x, y, h, h);//ellipse al borde izquierdo por arriba