
class objeto {
  int i, index, paso, mint, maxt;
  float x, y;
  String titulo;
  boolean Speed;

  objeto(int t_index, int t_maxt, int t_mint, int t_i) {

    x = 0;
    y = 0;
    rectMode(CENTER);
    mint= t_mint;
    maxt= t_maxt;
    i=t_i;
    index= t_index;
  }

  void cuadrado() {
    float cuadrado = map(mint, -5, 23, 0, 5 );
    noStroke();
    fill (105, 150, 207);
    rect(x, y, cuadrado, cuadrado);
  }

  void cuadradodos() {
    float cuadradodos = map(maxt, 5, 39, 0, 50);
    stroke (206, 106, 106);
    strokeWeight(5);
    fill (255, 255, 255, 100);
    rect(x, y, cuadradodos, cuadradodos);
  }

  void dias(int paso) {
    for (int i = 0; i < e.length; i++) {
      if (index >= i * paso && index < i * paso + paso) {
        float factor = map(paso, 7, 182, .03, .4);  
        float factor1 = map(paso, 7, 182, 1, .6); 
        float factor2 = map(paso, 7, 182, .09, .1); 
        float factor3 = map(paso, 7, 182, .9, .9); 

        float x1 = map(index % paso, 0, paso-1, width * factor2, width * factor3);
        x = x1;

        float y1 = map((i), 0, 365/paso, height * factor, height * factor1);
        y = y1;
      }
    }
  }
}