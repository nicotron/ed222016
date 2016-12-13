class Boton {
  int posX, posY, tam;
  int blink = 150;
  int blinkVar = 6;
  boolean showInfo;
  float x = 0;
  float y = 0;
  float r = 40;
  float a = 1;
  float velX = .05;
  int n = 3;
  boolean bInfo;
  int pant;
  String data;

  Boton(int t_posX, int t_posY, int t_tam, boolean t_bInfo, String t_data) {
    posX = t_posX;
    posY = t_posY;
    tam = t_tam;
    bInfo = t_bInfo;
    data = t_data;
  }

  void display() {
    //Falta descripción del bloque de texto
    imageMode(CORNER);
    if (bInfo) image(info, posX, posY, tam, tam);
    if (!bInfo) {
      ellipseMode(CORNER);
      noStroke();
      fill(80, 80, 250);
      ellipse(posX, posY, tam, tam); 
      fill(255);
      textSize(25);
      text(data, posX + 20, posY + 60);
    }
    blink();
    if (showInfo) {
      if (bInfo) info();
    }
  }
//Falta descripción del bloque de texto
  void info() {
    pushMatrix();

    fill(255);
    translate(width - 250, height - 500);
    text(data, 100, -10);
    noStroke();
    rect(0, 0, 250, 400);
    stroke(80, 80, 250);
    quad(20, 100, 60, 20, 100, 100, 60, 60);
    fill(80, 80, 250);
    textSize(18);
    text("Max Wind Speed", 90, 30);
    text("Min Wind Speed", 97, 75);
    text("Wind Direction", 10, 130);
    pushMatrix();
    translate(50, 200);
    ellipseMode(CENTER);
    fill(200);
    noStroke();
    ellipse(x, y, 10, 10);
    x = r * cos(a);
    y = r * sin(a);
    a += velX;
    popMatrix();
    fill(80, 80, 250);
    text("events", 110, 200);
    if (frameCount % 30 == 0) n += 1;
    if (n > 5) n = 1;
    println(n);
    for (int i = 20; i < 100; i += 100 / n) {
      for (int j = 280; j < 380; j += 100 / n) {
        fill(200, 200, 255);
        ellipse(i, j, 10, 10);
      }
    }
    fill(80, 80, 250);
    text("precipitation", 110, 340);
    popMatrix();
  }
//Falta descripción del bloque de texto
  void blink() {
    if (mouseOver()) {
      blink += blinkVar;
      if ( blink > 230 || blink < 80) blinkVar *= -1;
      noStroke();
      fill(255, blink);
      ellipseMode(CORNER);
      ellipse(posX, posY, tam, tam);
    }
  }

//Falta descripción del bloque de texto
  boolean mouseOver() {
    if (mouseX > posX && mouseX < posX + tam 
      && mouseY > posY && mouseY < posY + tam) {
      return true;
    } else {
      return false;
    }
  }
}