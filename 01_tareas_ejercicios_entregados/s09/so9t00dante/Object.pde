class Objects {  // se crea la clase Objetos
  float i, j, ix, jy, angulo;  // Se crean las variables decimales i, j, ix, jy, angulo

  Objects (float i, float j, float ix, float jy, float angulo) {  //Se ingresan los valores de las variables provenientes de la otra ventana
     this. i = i;  // La variable i proveniente de la otra ventana es igual a la variable i
     this. j = j;  // La variable j proveniente de la otra ventana es igual a la variable j
    this.ix = ix;  // La variable ix proveniente de la otra ventana es igual a la variable ix
    this.jy = jy;  // La variable jy proveniente de la otra ventana es igual a la variable jy
    this.angulo = angulo;  // La variable angulo proveniente de la otra ventana es igual a la variable angulo
  }
  
  void dibujarBandera() {  // se crea la función dibujarBandera
    pushMatrix();  // Las rotaciones y traslaciones que ocurran entre el pushMatrix y el popMatrix solo ocurrirán dentro de este.
    translate(ix, jy);  // Se traslada el origen a las coordenadas ix, jy
     angulo -= 0.08;  // Se le resta 0.08 a la variable angulo cada vez
    rotate(angulo);  //Se rota el canvas desde el origen según el valor de la variable angulo
    strokeWeight(2);  // El grosor de línea es 2
    stroke(0);  // El color del contorno es negro
    if (j >= 10){  // Si es que j es mayor o igual a 10 que ocurra lo siguiente
      fill(#FF0000);  // El color de relleno es rojo
    }
    else{  // Si no se cumple la condición anterior que ocurra lo siguiente
      fill(#ECF500);  // El color de relleno es amarillo
    }
    if (i >= 10 && j < 10){  // Si es que la variable i es mayor o igual a 10 ó la variable j es menor a 10 que ocurra lo siguiente
      fill(0);  // El color de relleno será negro
    }
    ellipse(0,5,30-i, 30-i);  // Se dibuja una ellipse en las coordenadas 0,5 de diámetro 30 menos el valor de i
    popMatrix();  //Se cierra el pushMatrix
  }
}