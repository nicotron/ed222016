//Expreción digital - Diseño Digital - UDD- 2016
//Isidora Ordoñez
//s10c01isi.

/*
En este código se llamarán distintos voids de manera autónoma a través de un boolean y 
 un frameCount.
 Los voids serán de figuras y movimientos, y a través de lo aprendido se logrará generar
 distintas composiciones con movimiento.
 El primer void es el de "elipses", que están dispuestas en la grilla de una forma
 circular, generando en primer lugar un módulo de 14 elipses, y este repitiéndolo 10 veces
 rotandolo con el centro del canvas como eje. Este modulo cambia su disposición en el eje
 'x' e 'y' lo que hace que las secuencias de elipses descritas se acerquen y alejen del
 centro del canvas.
 Por otra parte tenemos el void de transición que hace que la función descrita 
 anteriormente rote sobre su eje 'y' cambiando el valor de 'x' de la función.
 Por último tenemos el void display que crea una composición de triángulos que rotan sobre
 su propio eje gracias a la función rotate y sobre el eje central de la composición 
 gracias a translate cambiando el punto 0,0 del canvas lo que hace que giren y a la vez
 se alejen y acerquen.
 */



Objeto [] a = new Objeto [100];  //Por que solo con numeros impares se cumple el boolean?                                                         // Creo "Objeto".
boolean evalDivision;

// Inicialización:
void setup() {

  size (600, 600);
  //for (int i = 0; i < o.length; i ++) { 
  for (int o = 0; o < 10; o ++) {                                
    for (int q = 0; q < 10; q ++) {   
      int index = q + o * 10;
      //posición inicial * amplitud + ubicación en el eje * rotación
      //float x = sin (radians(o)) * 90 + sin (radians (o + q));                   // Fórmula que me da posición de cada figura y amplitud y posición del módulo total en el eje x.      
      //float y = cos (radians(o)) * 90 + cos (radians (o + q));                   // Fórmula que me da posición de cada figura y amplitud y posición del módulo total en el eje y.   
      float qmap = map(q, 0, 10, 10, 200);
      float om = map(o, 0, 10, 0, TWO_PI);
      float indexm = map(index, 0, 100, 0, 2);
      float x = qmap * cos(om * indexm);
      float y = qmap * sin(om * indexm);
      a[index] = new Objeto(x, y);

    }// Inicializo "Objeto".
  }

  evalDivision = true;
}

// Corre programa:
void draw() {

  background (0);                                                   
  translate (height / 2, width / 2);                                                   //Posiciona composición en el centro del canvas. 

  for (int i = 0; i < a.length; i ++) {

    // Cambiar estados de el boolean:
    if (frameCount % 200 == 0) {
      evalDivision = !evalDivision;
    }
    // Dibujar primeras funciones:    
    if (evalDivision) {
      a[i].movimiento("elipse");
      a[i].transicion();
    }
    // Dibujar segunda función: 
    else { 
      a[i].movimiento("cuadrado");
    }
    // Dibujar funciones que siempre están:    
    a[i].display();
  }
}