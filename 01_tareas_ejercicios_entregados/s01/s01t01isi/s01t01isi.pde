
// Expresión Digital - Diseño Digital - UDD - 2016
// Isidora Ordoñez.
// s01t01isi

/*
circulo amarillo de 240 x 240 px ubicado a 120 px de la linea superior e izquierda 
del canvas y cuadrado verde de 200 x 200 px con contorno blanco de 20 px ubicado a 160 
px de el eje x y a 120 px del eje y, un punto blanco de 40 px ubicado a 200 px del eje x 
y 200 px del eje y y una linea negra de grosor 11 px que cruza las figuras que tiene 
su punto de comienzo a 40 px del eje x y 20 del eje y y termina a 320 px del eje x 
y 340 px en el eje y.
*/

size (400, 400);         // asigno variables de tamaño para canvas.

//Variables posición:
int x= 120;             //Asigno valor para Variable x
int y= 200;             //Asigno valor para Variable y
int z= 340;             //Asigno valor para Variable z
int b= 20;              //Asigno valor para Variable b

//Variables color:
color a = color(252, 179, 116);       //Asigno valor para color amarillo.
color v = color(164, 189, 139);       //Asigno valor para color verde.
color bl = color(255, 255, 255);      //Asigno valor para color blanco.
color n = color(0, 0, 0);             //Asigno valor para color negro.



//elipse:
fill(a);                  //relleno color amarillo.
noStroke();               // no linea de contorno.
ellipse(x, x, x+x, x+x);     // medidas y ubicacion de la elipse.
                          
//cuadrado:               
fill(v);                  //relleno color verde.     
stroke(bl);               //linea de contorno blanca.
strokeWeight(b);          //grosor linea de contorno 5 px.
rect(x+b+b, x, y, y);        //medida y ubicación de cuadrado.

//punto:                  //el punto no tiene relleno (el relleno es el stroke).
stroke(bl);               //linea de contorno blanca.
strokeWeight(b+b);        //grosor linea de contorno de 40 px.
point(y, y);               //ubicación de punto.

//linea:                  //las lineas no tienen relleno (el relleno es el stroke).
stroke(n);                //linea de contorno negra.
strokeWeight(b-9);        //grosor linea 11 px.
line(b+b, b, x+y, z);        //ubicación de la linea.