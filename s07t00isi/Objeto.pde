//Doy inicio a la clase llamada objeto.
class Objeto {                           

//Variables globales:
  int x, d, q, w, vx, vy;                            // Variables tipo int.                
  float y, amt;                                      // Variables tipo float.                                           
  color b, n, a, v, c1, c2, c3, c4;                  // Variables tipo color.  

//Constructor (inicializa las variables):
  Objeto (int x) {
    colorMode(HSB, 360, 100, 100);                   // Cambio el modo de color a HSB.
    vx = 2;                                          // Doy valor a "vx".
    vy = 3;                                          // Doy valor a "vy".
    d = 80;                                          // Doy valor a 'd'.                            
    this.x = x;                                      // 
    a = 20;                                          // Doy valor a 'a'.                                                                                 
    y = height / 2 ;                                 // Doy valor a 'y'.                
    q = 40;                                          // Doy valor a 'q'.                                               
    w = 80;                                          // Doy valor a 'w'.                            
        
    b = color(0, 0, 100);                            // Doy código de color a 'b'.           
    n = color(0);                                    // Doy código de color a 'n'.            
    a = color(41, 93.7, 98.8);                       // Doy código de color a 'a'.          
    v = color(86, 26.5, 74.1);                       // Doy código de color a 'v'.       
    c1 = v;                                          // Variable "c1" es igual a 'v'. 
    c2 = a;                                          // Variable "c2" es igual a 'a'.
    c3 = b;                                          // Variable "c3" es igual a 'b'. 
    c4 = n;                                          // Variable "c4" es igual a 'n'.
  }

//Void de construcción de figuras:
  void triangulo1() {                                // Creo void llamado "triangulo1".                           

    //triángulo 1 (arriba):
    fill (c1);                                       // Asigno color de relleno.                                                     
    noStroke ();                                     // No dibujo linea de contorno.                                                       
    triangle (x, y, x+ q, y + q, x + w, y );         // Dibujo triángulo.
  }

  void triangulo2() {                                // Creo void llamado "triangulo2". 

    //triángulo 2 (derecha):
    fill (c2);                                       // Asigno color de relleno.                                                     
    triangle (x, y, x + q, y + q, x, y + w);         // Dibujo triángulo.
  }

  void triangulo3() {                                // Creo void llamado "triangulo3".                             

    //triángulo 3(izquierda):
    fill (c3);                                       // Asigno color de relleno.                                                      
    triangle (x + w, y, x + q, y + q, x + w, y + w); // Dibujo triángulo.
  }

  void triangulo4() {                                // Creo void llamado "triangulo4".                              

    //triángulo 4(abajo):
    fill (c4);                                       // Asigno color de relleno.                                                     
    triangle (x, y + w, x + q, y + q, x + w, y + w); // Dibujo triángulo.
  }

  void circulo() {                                   // Creo void llamado "circulo". 
    
    noStroke();  
    fill(c1, 200);                                   // Asigno color de relleno.     
    ellipse(x, y, d, d);                             // Dibujo elipse.
  }


//Void de acciones:
  void mover() {                                     // Creo void llamado "mover". 
    
    x += vx;                                         // A la variable 'x' le sumo "vx".                             
    y += vy;                                         // A la variable 'y' le sumo "vy".
  }
  
  void borde() {                                     // Creo void llamado "borde". 
    
    if (x > width - d /2 || x < d/2) {               // Si x es mayor al ancho menos 40 o menor a 80.       
      vx *= -1;                                      // Cambia el sentido en el que se mueve.
      amt = map(x, 0, width, 0, 1);                  // Le asigno valor map a "amt".
      c1= lerpColor (a, b, amt);                     // Asigno función de color "lerpColor" a "c1".
      c2= lerpColor (v, n, amt);                     // Asigno función de color "lerpColor" a "c2".
      c3= lerpColor (n, b, amt);                     // Asigno función de color "lerpColor" a "c3".
      c4= lerpColor (a, v, amt);                     // Asigno función de color "lerpColor" a "c4".
    }
    if ( y > height - d / 2 || y < d / 2) {                       
      vy *= -1;                                      // Cambia el sentido en el que se mueve.                                                
      amt = map(x, 0, width, 0, 1);                  // Le asigno valor map a "amt".                              
      c1= lerpColor (a, b, amt);                     // Asigno función de color "lerpColor" a "c1".
      c2= lerpColor (v, n, amt);                     // Asigno función de color "lerpColor" a "c2".
      c3= lerpColor (n, b, amt);                     // Asigno función de color "lerpColor" a "c3".
      c4= lerpColor (a, v, amt);                     // Asigno función de color "lerpColor" a "c4".
    }
  }
}