//Expresión Digital - Diseño Digital - UDD - 2016
//Margaux Leroy
//s006t00margaux

/*
*/

int x, y, velx, vely, t;
float amt, tam;
color c1, c2, c3;
color bl, ng, c, v, m;

void setup() {
  size(400, 400); 
  x = (int)random(width);
  y = height / 2;
  
 //Velocidad
  velx = 3;
  vely = 1;
  t = 50;

 //Colores
  c1 = color(34, 12, 211);
  bl = color(255);
  ng = color(0);
  c = color(0, 255, 255);
  m = color(255, 0, 255);
  v = color(255, 255, 0);
  c1 = color(200, 0, 50);
  c2 = color(5, 155, 200);
}

void draw() {
  background(123);
  amt = map(mouseX, 0, width, 0 , 1);
  c3 = lerpColor(c1, c2, amt);
  fill(c3);
  noStroke();
  ellipse(x, y, t, t);
  
  x += velx;
  y += vely;

//bordes
  if (x > width - t / 2 || x < t / 2) {           
   velx *= -1;
   int r = (int)random(4);
   if (r == 0) {
      c1 = bl;
  }
   if (r == 0) {
      c1 = ng;
  }
   if (r == 0) {
      c1 = c;
  }
   if (r == 0) {
      c1 = m;
  }
}
  
  if (y > height - t / 2 || y < t / 2) {            
   vely *= -1;
   fill(random(255),random(255),random(255));
  }  
}

 void variable(){
  for (int y = 0; y < height; y += 20) {
    for (int x = 0; x < width; x += 20) {
      fill(#FFFFFF);
      stroke(3);
      rect(x, y, 30, 30);
    }
  }
}

void keyPressed() {
    if (key == 'a') {   
      redraw();
     } else if (key == 'b') {
  }
}