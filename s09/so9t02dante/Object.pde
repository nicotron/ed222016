class Objects {  // se crea la clase Objetos
  float i, j, ix, jy, angulo, angulo2;  // Se crean las variables decimales i, j, ix, jy, angulo, angulo2

  Objects (float i, float j, float ix, float jy, float angulo, float angulo2) {  //Se ingresan los valores de las variables provenientes de la otra ventana
    this.i = i;  // La variable i proveniente de la otra ventana es igual a la variable i
    this.j = j;  // La variable j proveniente de la otra ventana es igual a la variable j
    this.ix = ix;  // La variable ix proveniente de la otra ventana es igual a la variable ix
    this.jy = jy;  // La variable jy proveniente de la otra ventana es igual a la variable jy
    this.angulo = angulo;  // La variable angulo proveniente de la otra ventana es igual a la variable angulo
    this.angulo2 = angulo2;  // La variable angulo2 proveniente de la otra ventana es igual a la variable angulo2
  }

  void dibujarEngranaje() {  // se crea la función dibujarEngranaje
    pushMatrix();  // Las rotaciones y traslaciones que ocurran entre el pushMatrix y el popMatrix solo ocurrirán dentro de este.
    translate(ix * 2, jy);  // Se traslada el origen a las coordenadas ix por 2, jy
    angulo += 0.02;  // Se le suma 0.02 a la variable angulo cada vez
    rotate(angulo);  //Se rota el canvas desde el origen según el valor de la variable angulo
    strokeWeight(2);  // El grosor de línea es 2
    stroke(0); // El color de línea es negro

    ellipse(0, 0, 20, 20);  // Se dibuja una elipse en las coordenadas 0,0 de diámetro 20
    line(-12, 12, 12, -12);  // Se dibuja una línea con origen -12, 12 hasta el punto 12, -12
    line(17, 0, -17, 0);  // Se dibuja una línea con origen 17, 0 hasta el punto -17, 0
    line(0, 17, 0, -17);  // Se dibuja una línea con origen 0, 17 hasta el punto 0, -17
    line(-12, -12, 12, 12);  // Se dibuja una línea con origen -12, -12 hasta el punto 12, 12
    popMatrix();  //Se cierra el pushMatrix
  }

  void dibujarEngranaje2() {  // se crea la función dibujarEngranaje2
    pushMatrix();  // Las rotaciones y traslaciones que ocurran entre el pushMatrix y el popMatrix solo ocurrirán dentro de este.
    translate(30 + ix*2, jy);  // Se traslada el origen a las coordenadas ix por 2 más 30, jy
    angulo2 -= 0.02;  // Se le suma 0.02 a la variable angulo cada vez
    rotate(angulo2 );  //Se rota el canvas desde el origen según el valor de la variable angulo2
    ellipse(0, 0, 20, 20);  // Se dibuja una elipse en el origen con diámetro 20
    line(-12, 12, 12, -12);  // Se dibuja una línea con origen -12, 12 hasta el punto 12, -12
    line(17, 0, -17, 0);  // Se dibuja una línea con origen 17, 0 hasta el punto -17, 0
    line(0, 17, 0, -17);  // Se dibuja una línea con origen 0, 17 hasta el punto 0, -17
    line(-12, -12, 12, 12);  // Se dibuja una línea con origen -12, -12 hasta el punto 12, 12
    popMatrix();  //Se cierra el pushMatrix
    if (j > 2) {  // Si es que la variable j es mayor a 2 ocurrirá lo siguiente
      fill(#FF0000);  // El relleno será de color rojo
    } else {  // Si no se cumple la condición anterior ocurrirá lo siguiente
      fill(#ECF500); // El color de relleno será de color amarillo
    }
  }
}