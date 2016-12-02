class Objects {  // se crea la clase Objetos
  float i, j, ix, jy, angulo, angulo2, angulo3;  // Se crean las variables decimales i, j, ix, jy, angulo, angulo2, angulo3

  Objects (float i, float j, float ix, float jy, float angulo, float angulo2, float angulo3) {  //Se ingresan los valores de las variables provenientes de la otra ventana
    this. i = i;  // La variable i proveniente de la otra ventana es igual a la variable i
    this. j = j;  // La variable j proveniente de la otra ventana es igual a la variable j
    this.ix = ix;  // La variable ix proveniente de la otra ventana es igual a la variable ix
    this.jy = jy;  // La variable jy proveniente de la otra ventana es igual a la variable jy
    this.angulo = angulo;  // La variable angulo proveniente de la otra ventana es igual a la variable angulo
    this.angulo2 = angulo2;  // La variable angulo2 proveniente de la otra ventana es igual a la variable angulo2
    this.angulo3 = angulo3;  // La variable angulo3 proveniente de la otra ventana es igual a la variable angulo3
  }

  void dibujarEngranaje() {  // se crea la función dibujarEngranaje

    stroke(#ECF500); // El color de línea es amarillo
    pushMatrix();  // Las rotaciones y traslaciones que ocurran entre el pushMatrix y el popMatrix solo ocurrirán dentro de este.
    translate(ix, jy);  // Se traslada el origen a las coordenadas ix, jy
    angulo += 0.02;  // Se le suma 0.02 a la variable angulo cada vez
    rotate(angulo);  //Se rota el canvas desde el origen según el valor de la variable angulo
    strokeWeight(10);  // El grosor de línea es 10

    line(29, 0, 51, 0);  // Se crea una línea en las coordenadas 29, 0 hacia las coordenadas 51,0
    popMatrix();  //Se cierra el pushMatrix
  }
  void dibujarEngranaje2() {  // se crea la función dibujarEngranaje2
    stroke(#FF0000); // El color de relleno es rojo
    pushMatrix();  // Las rotaciones y traslaciones que ocurran entre el pushMatrix y el popMatrix solo ocurrirán dentro de este.
    translate(ix, jy);  // Se traslada el origen a las coordenadas ix, jy
    angulo2 -= 0.03;  // Se le resta 0.03 a la variable angulo2 cada vez
    rotate(angulo2);  //Se rota el canvas desde el origen según el valor de la variable angulo2

    line(30, 0, 50, 0);  //Se dibuja una línea con origen 30,0 hacia las coordenadas 50,0
    popMatrix();  //Se cierra el pushMatrix
  }

  void dibujarEngranaje3() {  // se crea la función dibujarEngranaje3
    pushMatrix();  // Las rotaciones y traslaciones que ocurran entre el pushMatrix y el popMatrix solo ocurrirán dentro de este.
    translate(ix, jy);  // Se traslada el origen a las coordenadas ix, jy
    angulo3 += 0.025;  // Se le suma 0.025 a la variable angulo3 cada vez
    rotate(angulo3);  //Se rota el canvas desde el origen según el valor de la variable angulo2

    stroke(0);  // El color del stroke es negro
    line(30, 0, 50, 0);  //Se dibuja una línea con origen 30,0 hacia las coordenadas 50,0
    popMatrix();  //Se cierra el pushMatrix
  }
}