// Expresión Digital - Diseño Digital - UDD - 2016
// Francisco Barría
// s10c01

/*
Carrusel doble cruzado de líneas blancas, con variación en ángulo y forma según periodos distintos (T1=2,5, T2=7,5).
Adicionalmente el fondo es una grilla de esferas sin fondo de color arcoíris oscilante, que pulsan cambiando su tamaño.
Se intentó usar class para trabajar los voids, pero el código se volvió muy complejo y la conversión a class se volvió muy hostil.
 */
 
int i, j, f, total;                                            // i&j corresponden a las coordenadas para la grilla de esferas.
float a, b, e, k, l, x, y, x1, y1, y2;                         // 
boolean d, h;                                                     // On/Off que producen las variaciones.
color c1, c2;                                                     //Color "arcoiris" oscilante y Blanco, respectivamente.


void setup() {
  size (600, 600);
  colorMode(HSB, 100);                                            //HSB para facilitar el cambio del color c1.
  x = 0;                                                          //Horizontal de la grid de esferas.
  y = 0;                                                          //Vertical de la grid de esferas.
  a = 0;                                                          //Float que se incrementa continuamente para funcionas trigonométricas (sin, en su mayoría).
  b = 0;                                                          //Float que se incrementa continuamente y vuelve a 0 para el Hue, del c1.
  total = 81;                                                     //IMPORTANTE. La grilla de esferas se adapta a la resolución, solo si el valor de total, es un cuadrado perfecto.
}

void draw() {
  y1 = 50+ e;                                                     //Cima grilla lineas blancas.
  y2 = 550- e;                                                    //Sima grilla lineas blancas.
  c2 = color (0, 0, 100);                                         //Color blanco.
  background(0, 0, 35);
  noFill();

  a++;                                                            
  b++;
  x1= -e;                                                        
  


    for (i= 0; i<= width; i+= width/((sqrt (total)) -1)){
    for (j= 0; j<= height; j+= height/((sqrt (total)) -1)){
    //   o[total]= new Objeto(i,j);
   c1= color (b/2, 100, 70);   
     stroke(c1);
      ellipse (i, j, 40+14*sin(a/30), 40+14*sin(a/30));
    }
  }

     stroke(c2);
      strokeWeight(5);
      for(x = 0; x < width; x+=50){
      line(y1,(width/2)-260*sin(((a/20)+x)),
      y2,(width/2)-260*sin(((a+x1)/20)+x));

      }

      for(x=0;x<width;x+=50){
      line((width/2)-260*sin(((a/20)+x)*k),y1,
      (width/2)-260*sin(((a+x1)/20)+x),y2);

      }

  
  fill(0,0,100);

 // ellipse(e,100,50,50);

  
  if (b>200){
    b*=0;
  }
  
  
  if (frameCount % 150 == 0){

  d=!d;
}

  if (d == true){
  f = 0;
  e = lerp(e,f,.05);

}
  if (d == false){
  f = 150;
  e = lerp(e,f,.05);
}
  if (frameCount % 450 == 0){

  h=!h;
}

  if (h == true){
  k = 0;
//  l = 1;

}
  if (h == false){
  k = 1;
//  l= 0;
}
}