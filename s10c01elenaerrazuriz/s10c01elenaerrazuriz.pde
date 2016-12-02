//Expresión Digital II - Diseño Digital - UDD - 2016
// M. Elena Errázuriz
//s10c01elenaerrazuriz

/*
Este código muestra tres elementos distintos (líneas, cuadrados y círculos), que se trasladan desde sus respectivas grillas
 a las aristas de la composición, transformándolas en el centro. Cada una tiene un movimiento diferente gracias a la traslación o 
 rotación de los elementos. Al no haber background, cada fotograma queda plasmado en la pantalla sin ser borrado, formando las
 estelas del movimiento y una composición final/general.
 */

/*
Declaración de elementos y creación de los arrays y la cantidad de elementos en uso según el class Elena creado
 */
Elena[] na = new Elena [36];
Elena[] e = new Elena [100];
Elena[] li = new Elena [100]; 

boolean bo;

/*
Creación de las grillas para cada array Elena según su necesidad. Se determina su creación con un doble forLoop y
 la distancia que habrá entre cada unidad de la grilla. Aparte, en los mismos valores dentro del array, se podrá manipular
 la rotación, traslación, dirección, de cada uno.
 También se inicializa el boolean 'bo', en este caso como true.
 */
void setup() {
  size(600, 600); //tamaño del canvas
  bo = true;

  for (int c = 0; c < 6; c++) {
    for (int d = 0; d < 6; d++) {
      int total = d + c * 6;
      float dx = c * 0; //distancia entre los elementos, separación de 0px entre cada uno
      float dy = d * 0; //distancia entre los elementos, separación de 0px entre cada uno
      na[total] = new Elena(dx, dy, dx, dy, random(-4, 4), random(-4, 4), total * 2);
    }
  }

  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      int total = j + i * 10;
      float dx = i * 5; //distancia entre los elementos, separación de 5px entre cada uno
      float dy = j * 5; //distancia entre los elementos, separación de 5px entre cada uno
      e[total] = new Elena(dx, dy, dx + 10, dy + 10, random(-2, 2), random(-2, 2), (int)random(-1, 1));
    }
  }

  for (int e = 0; e < 10; e++) {
    for (int f = 0; f < 10; f++) {
      int total = f + e * 10;
      float dx = e * 3; //distancia entre los elementos, separación de 3px entre cada uno
      float dy = f * 3; //distancia entre los elementos, separación de 3px entre cada uno
      li[total] = new Elena(dx, dy, dx + 2, dy +2, random(-2, 2), random(-2, 2), (int)random(-1, 1));
    }
  }
}

/*
Función que, como dice su nombre, dibuja todo lo que esté dentro de ella, es la representación visual. Se llama a las funciones que están
 dentro del class Elena, con su prefijo adecuado para cada grilla. Estas funciones se encuentran dentro del boolean, que dependiendo si es 
 true o false dibuja algo diferente. A su vez, el boolean es activado por un frameCount, esto quiere decir que cada 3 seg se activa un estado
 del boolean. El resultado final es la intercalación entre dos composiciones diferentes.
 */

void draw() {

  if (frameCount % 60 == 0) { //determinar el tiempo entre cada estado.
    bo = !bo; //cuando 'bo' es verdadero, pasa a ser falso una vez que el tiempo determinado previamente se cumple. Crea la intercalación.
  }

  if (bo) {
    pushMatrix(); //determina el inicio de un espacio de acción en el cual los elementos no son afectados por modificaciones previas y ajenas a las que están dentro 
    translate(width / 2.1, height / 2.1); //traslación de la grilla en su totalidad, con el primer elemento (0, 0) como ancla

    for (int i = 0; i < na.length; i++) { // se ordena a usar todos los elementos disponibles en los arrays creados
      na[i].circulos(na[i].am); //determinar la variable de color que sa va a usar del class
      na[i].espiralRotar(.3); //determinar la dirección de rotación anti-horario
    }

    popMatrix(); //cierre del espacio de acción

    pushMatrix();
    translate(width / 2.26, height / 2.1);

    for (int i = 0; i < e.length; i++) {
      e[i].dibujar((int)random(2, 14));
      e[i].mover();
      e[i].rotar();
    }

    popMatrix();
  } else {

    pushMatrix(); 
    translate(width / 2.1, height / 2.1); //traslación de la grilla en su totalidad, con el primer elemento como ancla, no es afectado por la traslación anterior gracias al push y popMatrix

    for (int i = 0; i < na.length; i++) { // se ordena a usar todos los elementos disponibles en los arrays creados
      na[i].circulos(na[i].tu); //determinar la variable de color que sa va a usar del class
      na[i].espiralRotar(-.3);//determinar la dirección de rotación horario
    }

    popMatrix(); 
    
    pushMatrix();
    translate(width / 2.1, height / 2.1);

    for (int i = 0; i < li.length; i++) {
      li[i].linea((int)random(1, 8));
      li[i].mover();
    }

    popMatrix();
  }
}