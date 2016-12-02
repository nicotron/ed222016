class Objeto {
  boolean a;
  
  int x, y, velx, vely, t, ta;
  float x1, y1, amt;
  color c1, c2, c3, c4;
  color bl;
  
  Objeto (int x) {
  x = 200;                                     // Variable de tamaño para x
  y = 200;                                     // Variable de tamaño para y
  x1 = (int)random(width);                     // Variable de tamaño para x1
  y1 = height / 2;                             // Variable de tamaño para y1

  velx = 4;                                    // Variable de velocidad para x
  vely = 6;                                    // Variable de velocidad para y

  t = 10;
  
  c1 = color (80, 149, 100);  // Verde         // Se señala la variable de color para la figura a dibujar
  c2 = color (255, 0, 0);     // Rojo          // Se señala la variable de color para la figura a dibujar
  c3 = color (#7C3148);       // Morado        // Se señala la variable de color para la figura a dibujar

  bl = color(255);            // Blanco        // Variable de color a usar en el background

  a = true; 