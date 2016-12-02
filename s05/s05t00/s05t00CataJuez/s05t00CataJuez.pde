// Expresión Digital II - Diseño Digital - UDD - 2016
// Catalina Juez
// s05t00CataJuez
/*
Esta composición consta de múltiples objetos con opacidad que ese dibujan 
 constantemente, al apretar el botón “a” aparecerá un círculo blanco lo 
 suficientemente grande como para tapar la pantalla y al volver a apretarlo 
 este desaparecerá, lo que hará que esta composición se vuelva a dibujar. 
 Además al apretar el botón “z” desaparecen todos los círculos de la composición 
 y solo quedarán los cuadrados de esta, y al volver a apretar “z” los círculos 
 volverán a aparecer. Y el último uso del boolean es cuando el mouse pasa la mitad 
 de la pantalla en relación al eje “y”, este cambia sus colores.
 */

//definir variables
int a;
int c = color(132, 87, 232, 1);
int e = color(78, 90, 229, 1);
int f = color(250, 0, 0, 1);
color g, h; 

//definición de boolean
boolean b;
boolean z;
boolean j;
boolean o = true;
int col, fil, stepx, stepy, t;


void setup() {
  //tamaño de la composición y su color de fondo
  size(800, 600);  
  frameRate(10);
  background(255);

  //cuadrado se dibuja desde el centro
  rectMode(CENTER);

  //explico que mis boolean coresponden a "true", 
  //ademas que mi valor g es igual al mi color c, como h es igual a mi color e
  b = true;
  z = true;
  j = true;
  g = c;
  h = e;
}


void draw() { 
  //cantidad de fotogramas por segundo
  // esta función se usa en el void setup frameRate(10);
  for (int x = 0; x <  width; x += width / 12) {
    for (int y = 0; y < height; y += height / 9) {
      noStroke();

      //primer boolean "z", para que parezcan solamente los cuadrados al apretar mi tecla "z"
      if (z == true) {
        fill(g);
        // los colores debrían estár dentro de cada función
        circulodos(x * 3, y * 3, t, t);
        fill(h);
        // los colores debrían estár dentro de cada función
        circulo(x * 2, y * 2, height / 2, height / 2);

        fill(255);
        // los colores debrían estár dentro de cada función
        cuadrado(x * 3, y * 3, t, t); //cuadrado más grande de color blanco

        fill(g);
        // los colores debrían estár dentro de cada función
        cuadradodos(x * 3, y * 3, t, t); 

        cuadradotres(x * 3, y * 3, t, t); //cuadrado más pequeño
      }
      if (z == false) {
        fill(255);
        // los colores debrían estár dentro de cada función
        cuadrado(x * 3, y * 3, t, t); //cuadrado más grande de color blanco

        fill(g);
        // los colores debrían estár dentro de cada función
        cuadradodos(x * 3, y * 3, t, t); 

        cuadradotres(x * 3, y * 3, t, t); //cuadrado más pequeño
      }


      //Segundo boolean, al apretar latecla "a", aparece un círculo blanco que tapa toda la composición
      if (b == true) {
        fn1();
      }
      if (b == false) {
        fn2();
      }


      //En este ultimo boolean, cuando el mouse pasa la mitad del eje "y" de nuestra composición este cambia de color
      if (mouseY < height/2) {
        o = false;
      } else {
        o = true;
      }

      //defino mis valores g y h como son cuando están en "true"
      if (o == true) {
        g = c; //defino que g es igual a c 
        h = e; //defino que h es igual a e
      }

      //
      if (o == false) {
        g = f; // defino que g cambia a f
        h = f; //defino que h cambia a f
      }
    }
  }

  //for de los puntos que aparecen en mi composición 
  for (int x = 0; x <width; x += width/50) {
    for (int y = 0; y <height; y += height/50) {
      strokeWeight(8); 
      stroke (e); 
      p(x, y, 2, x); // que hacen los dos últimos parámetros?
    }
  }
}

//void de mis puntos
void p(int posX, int posY, float tam, float sw) { // que hacen los dos últimos parámetros?
  float colorp = map(mouseX, 0, width, 60, 255); // el color del stroke de mis puntos cambia de gris a blanco (de izquierda a derecha)
  float t = map(mouseX, 0, width, 0, 2); //cambia el tamaño de mis puntos de 0 a 2 (de izquierda a derecha)
  strokeWeight(t);
  stroke(colorp);
  point(posX, posY);
  // nada
}

//void de mi primer círculo
void circulo(int posX, int posY, float t, float sw) { //float sw?
  ellipse(posX, posY, t, t);
  // dónde está el float sw?
}

//void de mi segundo círculo, el cual no aparece ni se nota siempre, puesto que es tapado muchas veces por el cuadrado blanco
void circulodos(int posX, int posY, float tam, float sw) { //float sw?
  float t = map(mouseX, 0, width, 2, 100); //El tamaño de este circulovaria de 0 a 200, de izquierda a derecha
  ellipse(posX, posY, t, t);
}

//void de mi segundo cuadrado
void cuadrado(int posX, int posY, float tam, float sw) { //float sw
  float t = map(mouseY, 0, width, 2, 263); //el tamaño de este cuadrado varia de abajo hacia arriba (relación al eje y)
  rect(posX, posY, t, t);
}

void cuadradodos(int posX, int posY, float tam, float sw) { //float sw
  float t = map(mouseX, 0, width, 50, 200); //el tamaño de este cuadrado varia de eje x, de 50 a 200 (izquierda derecha)
  rect(posX, posY, t, t);
}

void cuadradotres(int posX, int posY, float tam, float sw) { //float sw
  //float c = map(mouseX, 0, width, 78, 132);  ¿Qué es esto?
  //float d = map(mouseX, 0, width, 229, 232); ¿Qué es esto?
  float t = map(mouseX, 0, width, 0, 100); //el tamaño de este rectángulo varia de izquierda derecha ( de 0 a 100)
  //fill(c, 87, d, 30); //cambio del valor de color de izquierda derecha (al final esto no se usa debido a que el uso del boolean "o" hace que esto no sea perceptible)
  fill(c); 
  rect(posX, posY, t, t);
}

void keyPressed() {
  // definición de boolean según el keyPressed
  if (key == 'a') {
    b = !b; // si aprietas "a" tu boolean "true" cambia  "false" (llamado desde el void draw para que la pantalla se ponga blanca)
  }

  if (key == 'z') {
    z = !z; // si aprietas "z" tu boolean "true" cambia  "false"
  }
}

// Void que es llamado por el void draw a través de un if (donde también es llamado el boolean "b" donde se usa la tecla "a")
void fn1() { //nombres de funciones copiados, da a entender que no sabe lo que escribe
  fill(0);
  ellipse(400, 300, 0, 0); // se dibuja una elipse de tamaño 0
}

void fn2() { //nombres de funciones copiados, da a entender que no sabe lo que escribe
  fill(255);
  ellipse(400, 300, 1000, 1000);
}