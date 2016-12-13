class Objeto {
  //variables globales de la clase
  int x, velx, vely;                                   //Determinar va-riables int x, velx, vely
  float y, amt;                                        //Determinar variables float y, amt
  color c, c1, c2, c3, c4, cc, ccc;                    //Determinar variables de color c, c1, c2, c3, c4, cc, ccc
  boolean v, h;                                        //Determinar variables boolean v, h

  //constructor
  Objeto(int x) {
    //inicialización de variables globales de la clase
    this.x = x;                                        //Iniciación varible x
    y = 10.5;                                          //Iniciación varible y
    velx = 4;                                          //Iniciación varible velocidad velx
    vely = 6;                                          //Iniciación varible velocidad vely
    c = color(97, 209, 206);                           //Variable color turqueza
    c1 = color(93, 255, 70);                           //Variable color verde
    c2 = color(255);                                   //Variable color blanco
    c3 = color(0);                                     //Variable color negro
    c4 = color(120);                                   //Variable color gris (120)
    v = true;                                          //Variable boolean v es verdadero
    h = false;                                         //Variable boolean h es falso
  }

  //Muestra un triángulo sin borde de color turqueza
  void display() {
    stroke(c4);                                        //Stroke es de color gris
    strokeWeight(2);                                   //Stroke de grosor 2
    fill(c);                                           //Relleno de color turqueza
    triangle(x + 30, y, x, y + 60, x + 60, y + 60);    //Creo triángulo 
    ellipse(x, x, y, y);                               //Creo círculo
  }

  //Mover a través del canvas
  void mover() {

    x += velx;                                         //Iniciación varible velocidad velx
    y += vely;                                         //Iniciación varible velocidad vely

    if (x > width - 40 / 2 || x < 40 / 2) {            //Iniciación varible velocidad velx
      velx *= -1;                                      //Variable velx 
      amt = map(x, 0, width, 0, 1);                    //Variable amt             
      cc = lerpColor(c, c1, amt);                      //Iniciación varible velocidad velx        
      ccc = lerpColor(c2, c3, amt);                    //Iniciación varible velocidad velx
    }

    if (y > height - 40 / 2 || y < 40 /2) {            //Sí, y se cuemple               
      vely *= -1;                                      //Iniciación varible velocidad velx             
      amt = map(x, 0, width, 0, 1);                    //Iniciación varible velocidad velx            
      cc = lerpColor(c, c1, amt);                      //Iniciación varible velocidad velx        
      ccc = lerpColor(c2, c3, amt);                    //Iniciación varible velocidad velx
      x++; //x += random();                            //Iniciación varible velocidad velx
    }
  }
}

//Si llega al ancho, parte de cero y nuevo tamaño de ancho
void borde() {
  if (x > width) {                                     //Sí, x es m
    x = 0;                                             //Entonces x es igual a 0
    y = random(5, 30);                                 //y es igual a un ancho random entre 5 y 30
  }
}