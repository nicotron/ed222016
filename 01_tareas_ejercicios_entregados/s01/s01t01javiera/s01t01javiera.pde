// Expreción Digital - Diseño Digital - UDD - 2016
//Javiera Ramírez
//s02e01javiera

int x = 200;
size(400, 400);
background(0, 0, 0);

//circulo esquina superior izquierda [con en centro en 100,100]
//con fondo naranjo y borde calipso de un grosor de 30 px
fill(255, 106, 0);
strokeWeight(30);
stroke(4, 175, 146);
ellipse(100, 100, 100, 100);

//circulo esquina inferior derecha [con centro en 300, 300]
//con fondo calipso y borde naranjo de un grosor de 30 px
fill(4, 175, 146);           
strokeWeight(30);            
stroke(255, 106, 0);         
ellipse(300, 300, 100, 100); 

//línea esquina inferior izquierda con borde y fondo color blanco. 
//El borde es de 20 px de ancho
strokeWeight(20);
stroke(255, 255, 255);
line(100, x, x, 300);

//fila de puntos verticales a intervalos de 20 px hacia abajo cada uno.
//Borde y fondo color blanco. Borde de 10 px de grosor
strokeWeight(10);
point(x, 20);
point(x, 40);
point(x, 60);
point(x, 80);
point(x, 100);

//fila de puntos horizontal a intervalos de 20 px hacia el lado cada uno.
//Borde y fondo color blanco. Borde de 10 px de grosor
point(380, x);
point(360, x);
point(340, x);
point(320, x);
point(300, x);