//Expresión Digital II - Diseño Digital - UDD - 2016
//Ana María Ortiz
//s06e01anamaria

/*
Un círculo irá rebotando en los extremos y al hacerlo irá cambiando de color.
 */
 
float velx, vely;
int x, y, diam, r;
color col;
color bla, ne, am, cal;

void setup() {
  size(400, 400);
  velx = 2;
  vely = 4;
  x = (int)random(width);
  diam = 55;
  r = 20;
  y = height/2;
  colorMode (HSB, 360, 100, 100, 100);
  col = color(255, 0, 255);
  bla = color(194, 0, 100);
  ne = color(194, 100, 0);
  am = color(53, 75, 93);
  cal = color(194, 64, 79);
}

void draw() {
  background(255);
  stroke(col);
  fill(col);
  ellipse(x, y, diam, diam);
  x += velx;
  y += vely;
  
  if (x > width - diam / 2 || x < diam / 2) { 
    velx *= -1;
    r = (int)random(4);
    
    if (r == 0){
      col = bla;
    }
     if (r == 1){
      col = ne;
    }
     if (r == 2){
      col = am;
    }
     if (r == 3){
      col = cal;
    }
  }
if (y > height - diam / 2 || y < diam / 2) {
   vely *= -1;
    r = (int)random(4);
    
    if (r == 0){
      col = bla;
    }
     if (r == 1){
      col = ne;
    }
     if (r == 2){
      col = am;
    }
     if (r == 3){
      col = cal;
    }
}
}