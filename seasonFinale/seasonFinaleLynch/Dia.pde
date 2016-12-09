class Dia {

  int minT, meanT, maxT;
  float posY, posY2, posY3, posX, pos;
  String titulo;
  int num, maxWSpeed, meanWSpeed;
  float wDir;
  int transp = 0;
  String info;
  String eventos;
  int roseSz = 50;
  PImage foto;
  int precipitation;

  float x = 0;
  float y = 0;

  float a = 1;
  float velX = .05;

  Dia(String t_titulo, int t_maxWSpeed, 
    int t_meanWSpeed, int t_wDir, String t_eventos, 
    int t_precipitation, int t_num, int t_minT, int t_meanT, int t_maxT, int t_pos) {
    titulo = t_titulo;
    num = t_num;
    maxWSpeed = t_maxWSpeed * 3;
    meanWSpeed = t_meanWSpeed * 3;
    wDir = radians(t_wDir);
    eventos = t_eventos;
    precipitation = t_precipitation * 3;
    minT = t_minT;
    meanT = t_meanT;
    maxT = t_maxT;  
    pos = t_pos;
    if (precipitation == 0) precipitation = 1;
  }

  void display() {

//Falta descripción del bloque de texto
    pushMatrix();
    translate(width / 2, height / 2);
    flechaViento();
    popMatrix();
  }
//Falta descripción del bloque de texto
  void flechaViento() {
    pushMatrix();
    noFill();
    stroke(80, 80, 250, transp);
    strokeWeight(4);
    rotate(wDir);
    quad(-roseSz, 0, 0, meanWSpeed, roseSz, 0, 0, maxWSpeed); 
    transp += 10;
    popMatrix();
  }


//Falta descripción del bloque de texto
  void datos() {
    if (pantalla == 0) {
      fill(255);   
      info = semana[semanaDay]+ " " + titulo;
      text(info, 20, 50);
    }

    if (pantalla == 1) {
      fill(255);
      info = "semana del " + titulo;
      text(info, 20, 50);
    }
  }
//Falta descripción del bloque de texto
  void precip() {
    for (int i = 0; i < width; i += width / precipitation) {
      for (int j = 0; j < height; j += height / precipitation) {
        if (precipitation > 1) {
          fill(200, 200, 255);
          noStroke();
          ellipseMode(CENTER);
          ellipse(i, j, 10, 10);
        }
      }
    }
  }
//Falta descripción del bloque de texto
  void temps() {
    posX = map(pos, weekS, weekO, 0, width);
    posY = map(minT, -13, 18, 0, height);
    posY2 = map(meanT, -13, 18, 0, height);
    posY3 = map(maxT, -13, 18, 0, height);
    stroke(255);
    line(posX + 25, height, posX + 25, 0);
    noStroke();
    ellipseMode(CORNER);
    fill(200, 20, 20);
    ellipse(posX, posY, 50, 20);
    fill(20, 200, 20);
    ellipse(posX, posY2, 50, 20);
    fill(20, 20, 200);
    ellipse(posX, posY3, 50, 20);
  }
//Falta descripción del bloque de texto
  void eventos(int r) {

    pushMatrix();
    translate(width / 2, height / 2);
    imageMode(CENTER);
    tint(255, transp);
    foto = loadImage(eventos + ".png");  
    image (foto, x, y);
    x = r * cos(a);
    y = r * sin(a);
    a += velX;
    popMatrix();
  }
}