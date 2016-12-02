/*
Ventana adjunta a la función principal. Acá se crea el class, que va a contener todas las variables, funciones, etc, de lo que se quiere dibujar.
La idea es usar la menor cantidad de líneas de código en la ventana general, y sólo cambiar valores específicos en ella cuando es realmente necesario
*/
class Elena {                                                     //Crear un class de un objeto llamado 'Elena'
  int x, y, a, d;                                                 //Declarar variables enteras
  int velx = 2;                                                   //Declarar variable velocidad eje x
  int vely = 2;                                                   //Declarar variable velocidad eje y
  float amt;                                                      //Declarar variable lerpColor

  color bl, ng, tu, sg, c1, c2;                                   //Declarar variables de color

/*
Segmento constructor del class, se escribe todo lo que se va a dibujar
*/
  Elena (int x) {                                                 //Dentro del objeto 'Elena', se van a dibujar los siguientes elementos
    rectMode(CENTER);                                             //Definir que todos los cuadrados se dibujen desde el centro
    d = 60;                                                       //Inicializar variable d
    this.x = x;                                                   //Inicializar variable x, que será afectada por la 'x' declarada en 'Elena' y a su vez por el valor que tome en el void draw
    a = 55;                                                       //Valor tamaño cuadrados
    y = height / 2;                                               //Inicializar variable y

    bl = color(255);                                              //Inicializar variable color
    ng = color(0);                                                //Inicializar variable color
    tu = color(54, 215, 183);                                     //Inicializar variable color
    sg = color(27, 163, 156);                                     //Inicializar variable color
    c1 = tu;                                                      //Inicializar variable color para lerpColor
    c2 = sg;                                                      //Inicializar variable color para lerpColor
  }


  void mover() {
    x += velx;                                                    //Avanzar espacios en x según la variable de velocidad
    y += vely;                                                    //Avanzar espacios en y según la variable de velocidad
  }

  void borde() {
    /*
  Colores en eje X y determinar el margen del canvas para que la figura rebote justo al bordey su velocidad
     */
    if (x > width - d / 2 || x < d / 2) {                         //Si x en las figuras cumple con las condiciones dadas
      velx *= -1;                                                 //la velocidad, cada vez que llega al final, se multiplica por '-', por lo que hace el recorrido de vuelta
      amt = map(x, 0, width, 0, 1);                               //Determinar el comportameinto de la función amt, con sus mínimos y máximos
      c1 = lerpColor(tu, bl, amt);                                //Determinar los dos colores en los cuales se hará el dergradé
      c2 = lerpColor(sg, ng, amt);                                //Determinar los dos colores en los cuales se hará el dergradé
    } 

    /*
  Colores en eje Y y determinar el margen del canvas para que la figura rebote justo al bordey su velocidad
     */
    if ( y > height - d / 2 || y < d / 2) {                       //Si y en las figuras cumple con las condiciones dadas
      vely *= -1;                                                 //la velocidad, cada vez que llega al final, se multiplica por '-', por lo que hace el recorrido de vuelta
      amt = map(x, 0, width, 0, 1);                               //Determinar el comportameinto de la función amt, con sus mínimos y máximos
      c1 = lerpColor(tu, bl, amt);                                //Determinar los dos colores en los cuales se hará el dergradé
      c2 = lerpColor(sg, ng, amt);                                //Determinar los dos colores en los cuales se hará el dergradé
    }
  }

  void cuadradito(int x, int y) {                                 //Función de nombre cuadradito, con dos variables  

    fill(c2);                                                     //función c2 para lerpColor como relleno
    noStroke();                                                   //Figuras sin líneas
    rect(x, y, a / 4, a / 4);                                     //Coordenadas de posición y tamaño para el cuadrado
  }

  void cuadrado(int x, int y) {                                   //Función de nombre cuadrado, con dos variables  

    noFill();                                                     //Figuras sin relleno
    stroke(c2);                                                   //Línea como c2 para la figura
    strokeWeight(3);                                              //con un grosor de 3px
    rect(x, y, a / 2, a / 2);                                     //Coordenadas de posición y tamaño para el cuadrado
  }

  void cGrande() {                                                //Función de nombre cGrande

    strokeWeight(4);                                              //Grosor de la línea de 4px      
    noFill();                                                     //Figuras sin relleno
    stroke(c1);                                                   //Color c1 según la función lerpColor para las líneas de la figura
    rect(x, y, a, a);                                             //Coordenadas y tamaño para el cuadrado
  }

  void espiral() {                                                //Función de nombre espiral

    stroke(c1);                                                   //Color c1 de la línea
    strokeWeight(4);                                              //Grosor de la línea de 4px
    line(x - 4, y + 16, x + 24, y + 16);                          //Línea horizontal conectada al lado derecho del cuadrado
    line(x - 4, y + 16, x - 4, y - 15);                           //Línea vertical originada de la anterior                    
    line(x - 4, y - 15, x + 16, y - 15);                          //Línea horizontal originada de la anterior vertical                      
    line(x + 16, y - 15, x + 16, y + 3);                          //Línea vertical                   
    line(x + 16, y + 3, x - 18, y + 3);                           //Línea horizontal final, interior del espiral
    line(x - 18, y + 3, x - 18, y - 24);                          //Líena vertical hacia arriba, hasta llegar al borde superior del cuadrado
  }
}