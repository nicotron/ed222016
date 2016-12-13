// Expresión Digital
// Ricardo Vidal lynch
// s01e01Lynch

int nro = height/5;  // numero para usar multiplos de 20,
                     // basado en height para poder cambiar
                     // el tamaño del canvas
size(100,100);  // Tamaño del canvas
background(255);  // color del fondo
line(nro-nro,nro,nro*5,nro*5); // linea diagonal larga
line(nro*2,nro,nro*4,nro);  // linea recta corta
ellipse(nro,nro*3,(nro*3)/2,(nro*3)/2);  // circulo