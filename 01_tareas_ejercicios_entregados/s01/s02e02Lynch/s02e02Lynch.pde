// Expresión Digital
// Ricardo Vidal lynch
// s01e01Lynch

int nro = height/5;  // numero para usar multiplos de 20,
                     // basado en height para poder cambiar
                     // el tamaño del canvas
                     
size(100,100);    // tamaño del canvas
background(255);  //  color de fondo
rect(nro*2,nro*2,nro,nro);  // cuadrado central
line(nro,nro*2,nro*2,nro);  // linea diagonal
ellipse(nro*3,nro,(nro*3)/2,(nro*3)/2);  // circulo arriba