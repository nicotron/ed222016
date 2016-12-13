// Expresión Digital - Diseño Digital - UDD - 2016
// Paulina Descouvieres
// s02t01paly


int x = 20;                               //declarar variables de x e y
int y = 60;

color a = color(0, 0, 44);                //variables de color
color r = color(190, 42, 89);             //COLORES USADOS
color b = color(0);                       //blanco, negro, azul marino, rosado
color w = color(255);


background(a);                            //pintar el fondo azul marino

                                          //dibujar figuras
stroke(r);                                //linea diagonal rosada
strokeWeight(x+y);                        //grosor de 80
strokeCap(PROJECT);                       //terminación cuadrada
line(x*0, x+y, x, x*5);

stroke(r);                                //cuadrado rosado
strokeWeight(x/20);                       //grosor de 1
fill(r, x*4);                             //relleno rosado con transparencia
rect(y, x, x, x);

stroke(w);                                //elipse
strokeWeight(x/10);                       //grosor de 2
noFill();                                 //sin relleno
ellipse(y/2, y-10, x, x*2);

stroke(w, x+y);                          //linea horizontal blanca
strokeWeight(x/20);                      //grosor de 1
strokeCap(ROUND);                        //terminación redondeada
line(x, x+y, x*2+y, y-10);

stroke(b);                              //linea vertical negra
strokeWeight(x/20);                     //grosor de 1
line(x/2, x*0, y/2, x*2+y);