/* dibujo del patron de triangulos  */
// falto una descripción de cada bloque de código para poder entener el órden del patrón 
void patron(int p, int o) {
  noStroke();
  stroke(80);
  strokeWeight(random(4));
  if (a == 0) {
    fill(colT[2], colT[0], colT[1]);
  } else if (a == 1) {
    fill(colT[0], colT[1], colT[2]);
  }
  triangle(p, o + 20, p + 10, o, p + 20, o + 20);
  
  if (a == 0) {
    fill(colT[0], colT[1], colT[2]);
  } else if (a == 1) {
    fill(colT[1], colT[2], colT[0]);
  }
  triangle(p + 10, o, p + 20, o + 20, p + 30, o);
  
  if (a == 0) {
    fill(colT[1], colT[2], colT[0]);
  } else if (a == 1) {
    fill(colT[2], colT[0], colT[1]);
  }
  triangle(p + 20, o + 20, p + 30, o, p + 40, o + 20);
  
  if (a == 0) {
    fill(colT[0], colT[2], colT[2]);
  } else if (a == 1) {
    fill(colT[2], colT[1], colT[0]);
  }
  triangle(p, o + 20, p + 10, o + 40, p + 20, o + 20);
  
  if (a == 0) {
    fill(colT[2], colT[2], colT[0]);
  } else if (a == 1) {
    fill(colT[1], colT[2], colT[0]);
  }
  triangle(p + 20, o + 20, p + 10, o + 40, p + 30, o + 40);
  
  if (a == 0) {
    fill(colT[2], colT[0], colT[2]);
  } else if (a == 1) {
    fill(colT[1], colT[2], colT[0]);
  }
  triangle(p + 20, o + 20, p + 40, o + 20, p + 30, o + 40);
}