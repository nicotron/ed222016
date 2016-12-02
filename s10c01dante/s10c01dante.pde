// Expresión Digital II - Diseño Digital - UDD - 2016
// Dante Crovetto
// s10c01dante

/*
Se crea un fondo color verde claro y sobre este se dibuja una grilla en el fondo que va cambiando sus valores en el eje X, con diferentes elipses que se van dibujando una sobre la otra de un color verde más oscuro.
En el centro del cambas se dibuja una grilla en el eje X con 7 figuras que van a ir cambiando entre triángulos, círculos y rectángulos alternándose y combinándose entre sí
 */

 // NIVEL 1.5 = Una grilla, 2 movimientos, 3 figuras (nivel 3)

float inicio, inicio2, fin, fin2, amt;  // Se crean las variables decimales inicio, inicio2, fin, fin2, amt
boolean b, z, r, t;  // Se crean los boolean b, z, r, t
int q, w, a, e;  //Se crean las variables enteras q, w, a, e
int NUM_C = 7;  // numero de circulos interiores de cada circulo en la grilla
Objects[] objetos = new Objects [7];  // Se crea la clase Objects 

void setup() {  // Función que se ejecuta al principio una sola vez
  size(600, 600);  // Se crea un canvas de 600x600 px
  inicio = height / 4;  // La variable inicio es igual al alto dividido en 4
  inicio2 = 3 * (height / 4);  // La variable inicio 2 es igual al triple del alto dividido en 4
  fin = 3 * (height / 4);  // La variable fin es igual al triple del alto dividido en 4 
  fin2 = height / 4;  // La variable fin 2 es igual a el alto dividido en 4
  for (int i = 0; i < 7; i++) {  // Mientras la nueva variable i sea menor que 30, i va sumando 1 cada vez.
    float ix = i * width / 10; // Se crea la variable decimal ix que es igual a la multiplicación de i por 30.
    // int total = i;  // total es una equivalencia directa a i por lo que no es necesario que exista.
    objetos[i] = new Objects(i, ix, inicio, inicio2, fin, fin2);  // Se ingresan las variables i, ix, inicio, inicio2, fin, fin2 a la clase
  }
}

void draw() {  // Función que se ejecuta cada vez
  background(#DDFAB3);  // El color de fondo es verde
  //esto es específico para la función `fondo` por lo que debe ser declarado en esa función
  noStroke();  // Las figuras no tienen borde
  objetos[0].fondo();  // La función `fondo` puede ser escrita fuera de la clase y no afecta. Al igual que puede ser asignada a cualquier objeto.
  //al igual que este stroke es para toda la clase, si se trabaja con más de una clase, esta función entra en conflicto con las clases
  stroke(3);  // el color de línea de los bordes de las figuras es de 3 entre 0 y 255
  translate(width / 2 - width / 3, 0);  // Se traslada el origen a las cordenadas ancho dividido en 2 menos el ancho dividido en 3, 0

  for (int i = 0; i < objetos.length; i++) {  // Mientras la nueva variable i sea menor que el total de valores dentro del objeto, i va sumando 1 cada vez.

    objetos[i].colormap();  // Se dibuja el contenido del void colormap i veces

// Cada medio segundo la boolean z pasa entre positiva y negativa, si la boolean z es falso se dibuja la función dibujarcirculos, si es positivo la función dibujartriangulos
    if (frameCount % 30 == 0) {
      z = !z;
    } 
    if (z == false) {
      objetos[i].dibujarcirculos();
    }
    if (z == true) {
      objetos[i].dibujartriangulos();
    }
    
    // Cada dos segundos la boolean r pasa entre positiva y negativa, si la boolean r es falso se dibuja la función dibujarlineas, si es positivo la función dibujarrectangulos
    if (frameCount % 120 == 0) {
      r = !r;
    } 
    if (r == false) {

      objetos[i].dibujarlineas();
    }
    if (r == true) {

      objetos[i].dibujarrectangulos();
    }
    
    // Cada un segundo la boolean r pasa entre positiva y negativa, si la boolean r es falso se dibuja la función configuracion, si es positivo la función configuracion2
    if (frameCount % 60 == 0) {
      r = !r;
    } 
    if (r == false) {
      objetos[i].configuracion();
    }
    if (r == true) {
      objetos[i].configuracion2();
    }
  }
}