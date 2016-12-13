class Objeto {
// Creo variables:
  float x, x1, x2, x3, y, y1, y2, y3;                                                           // Variables de posición.       
  int tam, amp;                                                                                 // Variable de tamaño.
  int xe, ye, incremento;                                                                       // Variables de cambio.

//Inicializo variables:
  Objeto() {
    
    x1 = 40;
    x2 = 40;
    x3 = 60;
    y1 = 40;
    y2 = 120;
    y3 = 0;
    
    tam = 10;
    amp = 90;
    
    xe  = 200; 
    ye  = 200;
    incremento = 1;
    
  }

//Void que se usará para hacer girar un void sobre el eje x:
  void transicion() {
    
    println(xe);

    if (xe >= 200) {
      incremento = -1;
    }                                                             // Al llegar a 200 xe comienza a restar.
    if (xe <= 0) {
      incremento = 1;                                                              // Al llegar a 0 xe comienza a sumar.
    }
    xe += incremento;
  }

// Void que creará las figuras y les dará posición:
  void movimiento (String tipoMovimiento) {

 // Posición de figuras:
    // for (int o = 0; o < 360; o += 36) {                                
      // for (int q = 0; q < 140; q += 10) {                              
        int o = 10;
        int q = 4;
          //posición inicial * amplitud + ubicación en el eje * rotación
        x = sin(radians(o)) * amp + sin(radians (o + q - frameCount)) * xe;                   // Fórmula que me da posición de cada figura y amplitud y posición del módulo total en el eje x.      
        y = cos(radians(o)) * amp + cos(radians (o + q - frameCount)) * ye;                   // Fórmula que me da posición de cada figura y amplitud y posición del módulo total en el eje y.   
        
 // Características de las figuras:        
        noStroke();                                                  
        fill(map(q, 0, 140, 255, 0), 255, 255);                      

 // Tipos de figuras:
        if (tipoMovimiento == "elipse"){                                                        // Si escribo "elipse" entre paréntesis luego de "tipoMovimiento" me dibuja lo siguiente:
          ellipse(x, y, tam, tam);
        }
        if (tipoMovimiento == "cuadrado"){                                                      // Si escribo "elipse" entre paréntesis luego de "tipoMovimiento" me dibuja lo siguiente:
          rect(x, y, tam, tam);
        }
      // }
    // }
  }

// Void que crea una secuencia de triángulos que giran sobre un eje central y su propio eje:
  void display() {
    
    // for (int i = 0; i < 360; i+=30) {  
      int i = 10;
      pushMatrix();                                                             

      translate(sin(radians( i + frameCount)) * 100, cos(radians( i + frameCount)) * 100); // Figura rota. 
      rotate(radians(-i));                                                                    // Cada triángulo gira sobre su eje.                                                       

      fill(map(i, 0, 140, 255, 0), 200, 255);                                      
      triangle(x1, y1, x2, y2, x3, y3);                                          
      popMatrix();
    // }
  }
}