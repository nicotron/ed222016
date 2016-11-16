// Expresión Digital II - Diseño Digital - UDD - 2016
// Max Cordero
// s10c01
/*Programa basado en la acumulación de la materia pasada en las clases de expresión digital.
El programa consta de dos instancias. La primera es de una grilla ordenada la cual presenta 400 elipses que se mueven dentro de un perímetro
no mayor a dos veces su propio tamaño. La idea de esta instancia es poder ordenar elementos en una grilla cuadrada y a su vez, poder moverlos independientemente.
Cuando pasa una cantidad determinada de tiempo, estos elementos cambian de elipses a cuadrados y se empiezan a mover con mayor rapidez en forma elíptica
y en líneas curvas con velicidad independiente*/

// NIVEL 2(3): 2 grillas (nivel 3), -.6 2 movimientos (nivel 1), -.3 2 figuras (nivel 2)

//nombrar clase y llammar 400 elementos (0 a 399)
Dot[] d = new Dot [400];
boolean b;
// definir tamaño e instancia de partida
void setup() {
  size(600, 600);

  // b = true;
//generar el ordenamiento de la grilla
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 20; j++) {
      int total = j + i * 20;
      float ix = i * 25;
      float jy = j * 25;
      float vertical = map (total, 0, 399, 10, height - 10);
      d[total] = new Dot(ix, width / 2, jy, vertical, ix + 20, jy + 20, (int)random(-2, 2), (int)random(-2, 2), (int)random(-1, 1), (int)random(-1, 1), color(0, 100, 160, random(255)), color(50, 150, 10, random(255)));
    }
  }
}

//definir dos instancias para poder hacer las transiciones entre estados. Em primero con framecount entre 0 y 300 y el segundo entre 300 y 600)
void draw() {
  background(0);
  println(frameCount); //no es necesario que estas funciones esten en constante uso, específicamente println() ya que su principal uso es para debugging al ser usado con la consola
  for (int i = 0; i < d.length; i++) {
    if (frameCount > 600) {
      frameCount = frameCount % 600; // esto es igual a frameCount = 0;
    }
    if (frameCount >= 0 && frameCount < 300) {
      // b = true;
      d[i].display(0);
      d[i].grilla(0);
      d[i].move();
    } 
    if (frameCount > 300 && frameCount < 600) {
      // b = false;
      d[i].display(1);
      d[i].grilla(1);
      d[i].move2();
    }
  }
}