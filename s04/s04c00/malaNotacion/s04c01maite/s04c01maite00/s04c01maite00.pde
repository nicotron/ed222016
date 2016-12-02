import processing.pdf.*;

//Expresión Digital II - UDD - 2016.
//Maite Iturriaga Batlle.
//s04c00maite00.
//Es un patrón a base de líneas que van cambiando sus colores y grosores.
//falta una descripción de qué pasará con la interacción.
int x = 10; //Declarar un entero para los doble for loop 
int y = 20; //Declarar un entero para los doble for loop
//variable sin uso
float noesta = random(3);

color[] colores = new color[3]; //Declarar array de 3 colores

void setup() {
  size(800, 1000); //Tamaño canvas
  rectMode(CENTER);
  colorMode(HSB,360,100,100); //color HSB, para imprimir
  colores[0] = color(60, 100, 100); //Inicializando Yellow
  colores[1] = color(180, 100, 100); //Inicializando Cyan
  colores[2] = color(300, 100, 100); //Inicializando Magenta
}

//Doble for loop para crear primer dibujo
void draw() {
  // beginRecord(PDF, "sc04c01maite00###.pdf");
  background(0); //background color negro está en void draw, para que cada vez se vuelva a dibujar
  
  //no hay descripción de este bloque de texto  
  for (int i = 10; i <= width; i = i + y) { // en el caso de que i sea menor que el ancho se le va sumar y
    for (int j = 0; j <= height; j = j + y ) { //en el caso de que j sea menor al alto a j se le sumará y
      stroke(colores[(int)random(colores.length)]);
      line(i, j, i + x, j); //Línea(a)
      stroke(colores[(int)random(colores.length)]);
      line(i, j, i, j - x); //Línea(b)
      stroke(colores[(int)random(colores.length)]);
      line(i - x, j + x, i - x, j + x * 2);//Línea(c)
      stroke(colores[(int)random(colores.length)]);
      line(i, j, i - x, j + x); //Línea(d)
    }
  }
  //Doble for loop para crear segundo dibujo con un desface de 5.
  //no hay descripción de este bloque de texto
  for (int i = 10 + x / 2; i <= width; i = i + y) {  //es /2 para que exista el desface en las líneas
    for (int j = x / 2; j <= height; j = j + y ) { //es /2 para que exista el desface en las líneas
      strokeWeight(random(3));//Random de grosor de la línea entre 0 a 3
      stroke(colores[(int)random(colores.length)]);
      line(i, j, i + x, j); //Línea(a)
      
      strokeWeight(random(3));//Random de grosor de la línea entre 0 a 3
      stroke(colores[(int)random(colores.length)]);
      line(i, j, i, j - x); //Línea(b)
      
      strokeWeight(random(3));//Random de grosor de la línea entre 0 a 3
      stroke(colores[(int)random(colores.length)]);
      line(i - x, j + x, i - x, j + x * 2);//Línea(c)
      
      strokeWeight(random(3)); //Random de grosor de la línea entre 0 a 3
      stroke(colores[(int)random(colores.length)]);
      line(i, j, i - x, j + x); //Línea(d)
    }
  }
  noLoop(); //Para que no se repita 
  endRecord();
}


//Se crea la función keyPressed
void keyPressed() {

  if (key == 'a') { //cada vez que se apreta la tecla "a" se vuelve a dibujar
    redraw();
  } else if (key == 's') { //cada vez que se apreta la tecla "s" se guarda un pdf del canvas
    saveFrame("fils/fotos_##.pdf"); //se guarda en la nueva carpeta llamada fils
  }
}