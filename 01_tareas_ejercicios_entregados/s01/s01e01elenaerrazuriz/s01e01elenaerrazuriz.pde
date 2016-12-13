//Expresión Digital - Diseño Digital - UDD - 2016
// M. Elena Errázuriz
//s01e01elenaerrazuriz

//s01e01_12

//variables
int x = 0;
int y = 40;
//medio circulo a mano izquierda peago al borde
ellipse(x, y, 30, 30);
//cuadrado que su esquina superior izquierda esta a la misma altura de la mitad del circulo
rect(20, y, 20, 20);
//linea diagonal que nace del vertice inferior izquierdo del cuadrado
line(20, 60, 60, 100);
//linea recta vertical que nace de la arista superior de la mesa de trabajo y esta
//a la misma altura  que el final de la linea diagonal
line(60, 0, 60, 40);