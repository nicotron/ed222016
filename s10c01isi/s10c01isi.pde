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

// NIVEL 0.6 (2): Pero no hay grilla, sí hay 3 movimientos (nivel 2) y 3 figuras (nivel 3)

Objeto [] o = new Objeto [1]; //es solo un objeto.                                                         // Creo "Objeto".
boolean evalDivision;

// Inicialización:
void setup() {

  size (600, 600);
  for (int i = 0; i < o.length; i ++) {                
    o[i] = new Objeto(); // no hay parámetros en el constructor hacia la clase                                                               // Inicializo "Objeto".
  }
  
  evalDivision = true;  
}

// Corre programa:
void draw() {
  
  background(0);                                                   
  translate(height / 2, width / 2);                                                   //Posiciona composición en el centro del canvas. 
  
  for (int i = 0; i < o.length; i++) {
    
// Cambiar estados de el boolean:
    if (frameCount % 200 == 0) {
      evalDivision = !evalDivision;
    }
// Dibujar primeras funciones:    
    if (evalDivision) {
      o[i].movimiento("elipse");
      o[i].transicion();
    }
// Dibujar segunda función: 
    else { 
      o[i].movimiento("cuadrado"); 
    }
// Dibujar funciones que siempre están:    
    o[i].display();    
  }
}