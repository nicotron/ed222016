//Expresión Digital - Diseño Digital - UDD - 2016
// M. Elena Errázuriz
//s01e01elenaerrazuriz

//s01e01_12

//variables
int x = 20;
int y = 40;

//cuadrado que sus vertices superiores están a la misma altura que el punto medio del circulo
rect(x, y, x, x);
//circulo a 20 puntos de la arista derecha de la mesa de trabajo
ellipse(x*4, y, x, x);
//linea diagonal de abajo hacia arriba desde el lado izquierdo de la mesa de trabajo,
//bajo el cuadrado
line(x, y*2, x*3, x*3);
// linea diagonal de arriba abajo que termina en la esquina inferior derecha de la mesa de trabajo
line(x*3, y*2, x*5, x*5);