//Expresión Digital - UDD - 2016
//Catalina Juez
//s01e01catalina
int x= 30;
int z= 20;
int y= 70;

/* Primer ejercicio en clases
*/
//ellipse pegada al extremo superior (no se alcamza a ver en su totalidad)
ellipse(x+x, 0, x, x);

//diagonal que topa con el exterior del circulo
line(z+z, 0, y, z+z);


//line recta que parte como 10 x e y de la ezquina superior izquierda
line(z, z, z, x+x+x);

//rectangulo abajo, un lado calza con la linea recta anterior
rect(z, z+z+z+z, z , z);