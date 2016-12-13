//Expresión Digital - Diseño Digital - UDD - 2016
// Ana María Ortiz
//s02t02anamaria

size(1024, 768);
  color a= color(251,234,46);  //amarillo
  color c= color(46,215,251);  //calipso
  float r = random(0, 255);    //random

for (int x = 0; x < width; x += 100){
for (int y = 0; y < height; y += 100){
  
fill(r);
noStroke ();
rect (x, y, x + 100, y + 100);

fill (a);
stroke (c);
quad (x + 50, y, x + 100, y + 50, x + 50, y + 100, x, y + 50);

fill (c);
noStroke ();
triangle (x + 50, y, x + 50, y + 50, x, y + 50);

}
}