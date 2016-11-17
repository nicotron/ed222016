class Objeto {
// Creo variables:
  float x, x1, x2, x3, y, y1, y2, y3;                                                           // Variables de posición.       
  float tam, amp;                                                                                 // Variable de tamaño.
  int xe, ye, incremento;                                                                       // Variables de cambio.

//Inicializo variables:
  Objeto(float x, float y) {
    
    x1 = 40;
    x2 = 40;
    x3 = 60;
    y1 = 40;
    y2 = 120;
    y3 = 0;
    
    tam = 4;
    this.x = x;
    this.y = y;
    
    xe  = 200 ; 
    ye  = 200;
    incremento = 1;
    
  }

//Void que se usará para hacer girar un void sobre el eje x:
  void transicion() {
    //x++;
    rotate(frameCount * .002);
    //println(xe);

    //if (xe >= 200) incremento = -1;                                                             // Al llegar a 200 xe comienza a restar.
    //if (xe <= 0)   incremento = 1;                                                              // Al llegar a 0 xe comienza a sumar.

    //xe += incremento;
  }

// Void que creará las figuras y les dará posición:
  void movimiento (String tipoMovimiento) {

 // Posición de figuras:        
        noStroke();                                                  
        fill(255);                      

 // Tipos de figuras:
        if (tipoMovimiento == "elipse"){ 
          pushMatrix();
          //translate(width / 2, height / 2);// Si escribo "elipse" entre paréntesis luego de "tipoMovimiento" me dibuja lo siguiente:
          ellipse(x, y, tam, tam);
          popMatrix();
        }
        if (tipoMovimiento == "cuadrado"){                                                      // Si escribo "elipse" entre paréntesis luego de "tipoMovimiento" me dibuja lo siguiente:
          rect(x, y, tam, tam);
        }
  }

// Void que crea una secuencia de triángulos que giran sobre un eje central y su propio eje:
  void display() {
    
    for (int i = 0; i < 360; i+=30) {  
      pushMatrix();                                                             

      translate (sin (radians ( i + frameCount)) * 100, cos (radians ( i + frameCount)) * 100); // Figura rota. 
      rotate (radians(- i));                                                                    // Cada triángulo gira sobre su eje.                                                       

      fill (map (i, 0, 360, 255, 0), 200, 255);                                      
      triangle (x1, y1, x2, y2, x3, y3);                                          
      popMatrix();
    }
  }
}