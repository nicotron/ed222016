//Exprecion digital - Diseño Digital - UDD- 2016
//Isidora Ordoñez
//s01e02isi

/*un circulo en el inferior izquierdo separado de los bordes 
(mas del borde inferior que el de al lado) y una linea que empieza en el borde
izquierdo y termina en el punto medio de la elipse
*/


int x=20; //defino variable x
int y=60;//defino variable y

ellipse(x,y,y/2,y/2); //dibujo ellipse
x=0; //le doy un nuevo valor a x
y=40;//le doy un nuevo valor a y
line(x,y,y/2,y+20);//dibujo una linea