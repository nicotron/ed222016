// Expresión Digital II - Diseño Digital - UDD - 2016
// Javiera Ramírez
// s05t00

int negro = color(0);
int blanco = color(255);

void setup () {
  size(800, 600);
  background(blanco);
  frameRate(20);
}

void draw () {
  background(255);
   
  for (int i = 0; i <= width; i += 100) {
    for (int h = 0; h <= height; h += 100) {
      circ(i, h, 100);
    }
  }
  
  for (int a = 50; a < width; a += 100) {
    for (int b = 50; b < height; b += 100) {
      linea(a, b);
  }
 }
 
  for (int x = 50; x < width; x += 100) {
    for (int y = 50; y < height; y += 100) {
      circ2(x, y, 50);
    }
  }
  
  for (int f = 50; f < width; f += 50){
    for (int g = 50; g < height; g += 50) {
      cuad(f, g);
  }
 }
}


void cuad (float posF, float posG) {
  float op = map(mouseY, 0, width, 0, 255);
  float r = random(15);
  rectMode(CENTER);
  fill(negro, op);
  rect(posF, posG, r, r);
}

void linea (float posA, float posB){
  strokeWeight (3);
  strokeCap (ROUND);
  stroke (blanco);
  line (posA-30, posB-30, posA+30, posB+30); 
  strokeWeight (3);
  strokeCap (ROUND);
  stroke (blanco);
  line (posA+30, posB-30, posA-30, posB+30); 
}

void circ(int posI, int posH, float tam) {
  noStroke();
  fill(220);
  ellipse(posI, posH, tam, tam);
  fill(222, 107, 155);
  ellipse(posI, posH, tam/2.5, tam/2.5);
  fill(198, 68, 123);
  ellipse(posI, posH, tam/5, tam/5);
  float r = random(tam/8);
  rectMode(CENTER);
  fill(negro, 100);
  rect(posI, posH, r, r);
}

void circ2(int posX, int posY, float tam) {
  float colorC = map(mouseY, 0, width, 0, 255);
  float colorB = map(mouseX, 0, width, 0, 255);
  noStroke();
  fill(134, colorC, colorB, 180);
  ellipse(posX, posY, tam, tam);
  fill(colorC, colorB, 144, 150);
  ellipse(posX, posY, tam/2, tam/2);
  float r = random(tam/5);
  rectMode(CENTER);
  fill(negro, 100);
  rect(posX, posY, r, r);
}