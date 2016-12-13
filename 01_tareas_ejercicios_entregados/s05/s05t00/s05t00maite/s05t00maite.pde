//Expresión Digital II - UDD - 2016.
//Maite Iturriaga Batlle.
//s05t00maite.


int x = 10;                                //Declarar un entero para los doble for loop 
int y = 20;                                //Declarar un entero para los doble for loop

float grosor;

boolean lineas1;
boolean lineas2;

color[] colores = new color[3];            //Declarar array de 3 colores

void setup() {
  size(800, 600);                           //Tamaño canvas
  rectMode(CENTER); 
  colorMode(HSB, 360, 100, 100);                //color HSB, para imprimir
  colores[0] = color(60, 100, 100);          //Inicializando Yellow
  colores[1] = color(180, 100, 100);         //Inicializando Cyan
  colores[2] = color(300, 100, 100);         //Inicializando Magenta

  lineas1 = true;
  lineas2 = true;
}


//Doble for loop para crear primer dibujo
void draw() {

  background(0);                            //background color negro esta en void draw, para que cada vez se vuelva a dibujar


  if (lineas1 == true) {
    for (int i = 0; i <= width; i += width/11) {             //Crear 12 figuras en el eje x
      for (int j = 0; j <= height; j += height/8) {          //Crear 9 figuras en el eje y
        grosor = map(mouseX, 0, width, 1, 50);

        stroke(colores[(int)random(colores.length)]);
        strokeWeight(grosor);
        line( i, j, i + x, j); //Linea(a)
        stroke(colores[(int)random(colores.length)]);
        strokeWeight(grosor);
        line( i, j, i, j - x); //Linea(b)
        stroke(colores[(int)random(colores.length)]);
        strokeWeight(grosor);
        line(i - x, j + x, i - x, j + x * 2);//Linea(c)
        stroke(colores[(int)random(colores.length)]);
        strokeWeight(grosor);
        line(i, j, i - x, j + x); //Linea(d)
      }
    }
  } else {
    lineas1 = false;
  }

  //Doble for loop para crear segundo dibujo con un desface de 5.
  if (lineas2 == true) {
    for (int i = -5; i <= width; i += width/11) {             //Crear 12 figuras en el eje x
      for (int j = -5; j <= height; j += height/8) {          //Crear 9 figuras en el eje y
        grosor = map(mouseY, 0, height, 1, 100);

        strokeWeight(random(0, 3));                 //Random de grosor de la linea entre 0 a 3
        stroke(colores[(int)random(colores.length)]);
        strokeWeight(grosor);
        line( i, j, i + x, j); //Linea(a)


        strokeWeight(random(0, 3));                 //Random de grosor de la linea entre 0 a 3
        stroke(colores[(int)random(colores.length)]);
        strokeWeight(grosor);
        line( i, j, i, j - x); //Linea(b)


        strokeWeight(random(0, 3));                  //Random de grosor de la linea entre 0 a 3
        stroke(colores[(int)random(colores.length)]);
        strokeWeight(grosor);
        line(i - x, j + x, i - x, j + x * 2);//Linea(c)


        strokeWeight(random(0, 3));                   //Random de grosor de la linea entre 0 a 3
        stroke(colores[(int)random(colores.length)]);
        strokeWeight(grosor);
        line(i, j, i - x, j + x); //Linea(d)
      }
    }
  } else {
    lineas1 = false;
  }
}


//Se crea la funcion keyPressed
void keyPressed() {

  if (key == 'm') {
    lineas1 = !lineas1;
    println(lineas1);
  } 
  if (key == 'i') {
    lineas2 = !lineas2;
    println(lineas2);
  } else if (key == 's') {                          //cada vez que se apreta la tecla "s" se guarda un pdf del canvas
    saveFrame("fils/fotos_##.pdf");                //se guarda en la nueva carpeta llamada fils
  }
}