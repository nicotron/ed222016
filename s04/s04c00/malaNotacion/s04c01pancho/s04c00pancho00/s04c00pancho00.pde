// Expresión Digital II - Diseño Digital - UDD - 2016
// Francisco Barría
// s04c00pancho00

/*
Molinos Rojos en unos cuadrados de cafes claros, en un canvas de puntos rojos con opacidad suave. */
 
import processing.pdf.*;

void setup() {          
  size(800, 1000);

}

void draw() {          
  // beginRecord(PDF, "s04c00pancho00.pdf");
  colorMode(HSB, 360, 100, 100);
  // debe ser local dentro de cada for loop
  int i;
  int j;
  
  //Colores
  // gloabales y llamadas solo para su uso en void draw
  color pal = color(42, 9, 100);        //  Palido.
  color sal = color(41, 49, 99);        //  Salsa de ajo.
  color car = color(352, 81, 84);        //  Carmesi.
  color tre = color(343, 92, 60);        //  Tres cuartos.
  // gloabales y llamadas solo para su uso en void draw
  color bla = color(0, 0, 100);        //  Blanco.
  // esta variable no está en uso
  color neg = color(0, 0, 0);        //  Negro.
  // gloabales y llamadas solo para su uso en void draw
 color [] back = {bla, pal, sal};  //Array de colores cafes.
 color [] oxi = {car, tre};      //Array de colores carmesi.
  
  translate(width/2, height/2);    //Vestigio de que empiezo mis trabajos como espirales.

  background(back[(int)random(3)]);    //El fondo cambia de colores según el Loop.

  noStroke();

  for (i = -(width/2); i < width; i += 15) {      // Puntos al fondo.
    for (j = -(height/2); j < height; j += 15) {
    
      int e = (int) random(4);
      // no hay descripción de lo que pasará si esto es verdadero
      if (e >= 2){
        fill(back[(int)random(2)], random(100));  
        ellipse(i, j, 10 - e, 10 - e);
      }
      // no hay descripción de lo que pasará si esto es verdadero
      else {
        fill(oxi[(int)random(2)], random(100));
        ellipse(i, j, 10 - e, 10 - e);
      }
    }
  }


  for (i = -(width/2); i < width; i += 80) {
    for (j = -(height/2); j < height; j += 80) {    //Doble for para crear grilla.
     
        
      fill(back[(int)random(3)]);      //Colores cafes.
      
      quad(i + 40, j, i, j - 40, i - 40, j, i, j + 40);       //Cuadrados
      quad(i + 40, j, i, j - 40, i, j + 40, i - 40, j); 
      
      // no hay descripción de lo que se dibujará
      fill(oxi[(int)random(2)], 255 - random(200));    //Triángulos del molino
      triangle(i, j, i + 40, j, i + 15, j - 15);     
      fill(oxi[(int)random(2)], 255-random(200));    
      triangle(i, j, i - 40, j, i - 15, j + 15);    
      fill(oxi[(int)random(2)], 255-random(200));    
      triangle(i, j, i, j - 40, i - 15, j - 15);  
      fill(oxi[(int)random(2)], 225-random(200));    
      triangle(i, j, i, j + 40, i + 15, j + 15);
    }
    noLoop();
  }


  // endRecord();
}

void keyPressed() {
  // no hay descripción de lo que pasará si esto es verdadero
  if  (key == 'a')  {
    saveFrame("s04c00pancho00.pdf");
    loop();
  }
}