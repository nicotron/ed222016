//Expresión Digital II - Diseño Digital - UDD - 2016
// Ana María Ortiz
//s10c01anamaria
// NIVEL 1
/* En primer lugar aparecerán flechas que van cambiando de color entre amarillo y gris mientras se 
 mueven en su dirección, al llegar a la esquina, se cambiará la imagen y se verán rombos en constante
 movimiento con una línea en su interior que gira, al volver nuevamente a las flechas, ellas estarán 
 nuevamente en el centro.*/


Objeto[] e = new Objeto [144];      //nueva clase con 144 objetos rombo
Objeto[] ob = new Objeto [256];      //nueva clase con 256 objetos flecha
boolean b;      //declaración objeto
void setup() {
  size(600, 600);      //tamaño del canvas
  colorMode(HSB, 360, 100, 100);      //modo de color

  //for para rombo
  for (int i = 0; i < 12; i++) {      //creación de 12 objetos
    for (int j = 0; j < 12; j++) {      //creación de 12 objetos
      int total = j + i * 12;
      float ix = i * 45;      //45 px de distancia entre los elementos
      float jy = j * 45;      //45 px de distancia entre los elementos
      e[total] = new Objeto(ix, jy, ix + 5, jy + 5, (int)random(-2, 2), (int)random(-2, 2), total);
    }
  }

  //for para flecha
  for (int i = 0; i < 16; i++) {      //creación de 16 objetos
    for (int j = 0; j < 16; j++) {      //creación de 16 objetos
      int total = j + i * 16;
      float ix = i * 34;      //34 px de distancia entre los elementos
      float jy = j * 34;      //34 px de distancia entre los elementos
      ob[total] = new Objeto(ix, jy, ix + 5, jy + 5, (int)random(-2, 2), (int)random(-2, 2), total);
    }
  }
}

void draw() {
  background(314, 1, 94);      //color background
  translate(width / 15, height / 15);      //posición de la composición
  if (frameCount % 30 == 0) {      //tiempo
    b = !b;      //boolean
  }

  //Se dibuja la primera función
  if (b == true) {
    // pushMatrix();      //cambiar el estado de las coordenadas  
    translate(width / 1000, height / 1000);      //posición de los objetos
    for (int i = 0; i < e.length; i++) {      //si i es menor que el ancho, se suma 1 y se dibujan las funciones 
      e[i].dibujarRombo();      //se dibuja el rombo
      e[i].dibujarLinea();      //se dibuja la línea
      e[i].mover();      //se cumple la función mover
      e[i].bordes();      //se cumple la función bordes
    }
    // popMatrix();      //volver al estado original de las coordenadas
  }

  //Se dibuja la segunda función
  if (b == false) {
    // pushMatrix();      //cambiar el estado de las coordenadas   
    for (int i = 0; i < ob.length; i++) {      //si i es menor que el ancho, se suma 1 y se dibujan las funciones 
      ob[i].dibujarFlecha();      //se dibuja la flecha
    }
    // popMatrix();      //volver al estado original de las coordenadas
  }
}