//semana 02 entrega 01
//Expresión Digital
//Maite Iturriaga

int x;
int i;
int j;

void setup() {
  size(1024, 768);
  background(255);
}

void draw() {

  
  for (int i = 0; i <=width-20; i = i+20) {
    for (int j = 0; j <=height+20; j = j+20) {
      fill(random(255),random(20),random(20));

      rect( i, j, i+20 , j+20); //cuadrado
    

      //<= menor o igual
    }
  }  

  for (int i = 10; i <=width-10; i = i+20) {
    for (int j = 10; j <=height-10; j = j+20) {
      stroke(0);
      strokeWeight(1);

      line( i, 0, i , width); //para hacer cruces
      line( 0, j, width , j); //para hacer cruces

      //<= menor o igual
    }
  }



  for (int i = 20; i < width-20; i = i+20) {
    for (int j = 20; j <=width -20; j = j+20) {
      fill(255, 20, 20);
      stroke(random(255),random(0), random(255));
      strokeWeight(2);

      ellipse( i, j, 10, 10); //primeros posición segundos tamaños.
        
      //<= menor o igual
    }
  }
}
