// Expresión Digital II - Diseño Digital - UDD - 2016
// Paulina Descouvieres
// s04c00paly01

import processing.pdf.*;                       //indicar que se trabajará en PDF

void setup(){
 size(1200, 1500);                             //determirar tamaño del canvas
 colorMode(HSB, 360, 100, 100);                //determinar color modo HSB
 background(#ffffff);                          //pintar de color blanco el fondo
 
/*
No existe descripción de qué hace el programa ni cómo se usa.
*/

/*
 CÓDIGO DE COLORES USADOS
 rojo claro = color(346, 98, 76);
 rojo oscuro = color(340, 84, 55);
 morado claro = color(286, 63, 27);
 morado oscuro = color(285, 65, 21);
*/
// buen uso del bloque de comentarios para saber qué colores se usarán con notación en español
// el error está en que debieron ser declarados e inicializados con nombres similares rojo claro = rojo_claro

}

void draw(){
  
  beginRecord(PDF, "frames/s04c00paly###.pdf");

//declarar variables
// declaración de variables globales dentro de este loop para su uso dentro de otro
  int i; 
  int j;

//array de colores HSB para luego crear un random
  int[] h = {346, 340, 286, 285};
  int[] s = {98, 84, 63, 65};
  int[] b = {76, 55, 27, 21};

//doble for loop que determina la posición de i y j dentro del plano cartesiano
	for(i = 0; i < width + 100; i += 100){ 
	  for(j = 0; j < height + 100; j += 100) {

	//random de 4 colores con array para los cuadriláteros grandes
	//declarar e inicializar dentro del void draw
	  	int random = (int) random(4);
	    int colorh = h[random];
	    int colors = s[random];
	    int colorb = b[random];

	//cuadrilátero, sin borde de random de color
	  	noStroke();
	  	fill(colorh, colors, colorb);
	  	quad(i + 50, j, i + 100, j + 50, i + 50, j + 100, i, j + 50);

	//random de 4 colores con array para los cuadriláteros chicos
	/* declarar e inicializar dentro del void draw un nuevo grupo 
	de variables para el mismo objetivo, lo correcto es solamente 
	cambiar el valor de ellas.
	*/
	  	int random2 = (int) random(4); 
	    int colorh2 = h[random2];
	    int colors2 = s[random2];
	    int colorb2 = b[random2];

	/*líneas blancas con transparencia de 50%
	entrecruzadas en el centro de los cuadriláteros grandes*/
	  	stroke(#ffffff, 50);
	  	strokeWeight(2);
	  	line(i, j, i + 100, j + 100);
	  	line(i, j + 100, i + 100, j);
	  
	//cuadrilátero chico, sin borde con random de color
		  noStroke();
		  fill(colorh2, colors2, colorb2);
		  quad(i, j - 25, i + 25, j, i, j + 25, i - 25, j);
	    
	//círculos con transparencia de 80% en las esquinas de los cuadriláteros grandes
	  	noStroke();
	  	fill(#ffffff, 80);
	  	ellipse(i + 50, j, 25, 25);
	  	ellipse(i, j + 50, 25, 25);

	//puntos con transparencia de 80% en el centro de los cuadriláteros chicos
	  	stroke(#ffffff, 50);
	  	strokeWeight(5);
	  	point(i, j);

	//cuatrilátero chico blanco en el centro del cuadrilátero grande
	  	noStroke();
	  	fill(#ffffff);
	  	quad(i + 50, j + 25, i + 75, j + 50, i + 50, j + 75, i + 25, j + 50);
	 
	  }
	}
  noLoop();              //función que detiene el loop
  endRecord();
}



void keyPressed() {
 if (key == 'n') { // no hay descripción de qué hace cada letra.
   redraw();
 } else if (key == 'q') { // no hay descripción de qué hace cada letra.
   exit();
 } else if (key == 's') { // no hay descripción de qué hace cada letra.
     saveFrame("frames/s04c00paly###.pdf");
 }
}