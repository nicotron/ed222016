//Expresión Digital - Diseño Digital - UDD - 2016
//Francisco Barría
//s01e03pancho
//Tarea de testeo de 2 colores. Los que escoji son (0,255,96) y (231,76,60). Al final la visualizacion es un rostro.

color a  = color  (0,255,96);
color b  = color  (231,76,60);

fill(0,255,96); //Color incicial para el cuadrado que conforma el rostro.
rect(10,10,80,80); //Rostro.

stroke(#FFFFFF); strokeWeight(2); //Color y grosor de las lineas en las mejillas.

line(22,65,30,52); //Lineas que se forman en su mejilla derecha.
line(27,65,35,52);
line(32,65,40,52);

line(72,65,80,52);//Lineas que se forman en su mejilla izquierda.
line(77,65,85,52);

noStroke();//Para las siguientes formas no hace falta stroke.

fill(#FFFFFF); //El blanco y las elipses conforman sus ojos.
ellipse(35,35,20,20);
ellipse(70,35,18,18);

fill(a); //El rectangulo del mismo color que el rostro es para delimitar los ojos y que no sean solo circulares.
rect(15,15,70,18); 

fill(b); //Los labios de color rubi, formados por 3 triangulos.
triangle(40,70,35,75,45,75);
triangle(45,70,40,75,50,75);
triangle(42,80,37,76,47,76);

fill(#000000); //El negro para las proximas facetas faciales.

triangle(55,40,55,60,65,60); //Nariz.

triangle(27,30,47,30,47,27); // Cejas
triangle(57,30,77,30,77,27); 

rotate(PI/4); //Rectangulos formando las pupilas. Girados en 45 grados.
rect(75,-25,4,4);
rect(50,0,4,4);