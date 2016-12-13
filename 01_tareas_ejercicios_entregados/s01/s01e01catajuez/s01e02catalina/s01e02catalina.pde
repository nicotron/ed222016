//Expresión Digital - UDD - 2016
//Catalina Juez
//s01e01catalina
int x= 20;
int y= 30;
int z= 80;


/*Segundo ejercicio de la primera clase
*/
//ellipse que se encuentra en el vertice del costado derecho, no se alcanza a ver en su totalidad
ellipse(z+x, x+x, y, y);

//primera diagonal que nace desde el mismo punto que la otra, pero esta es mas larga 
line(0, x, z, x+y);

//segunda diagonal que nace desde el mismo punto que la anterior y es mas pequeña de tamaño, ademas de variar su angulo
line(0, x, x, x+x);

//cuadrado que se encuentra en la ezquina inferior derecha
rect(z, z, x , x);