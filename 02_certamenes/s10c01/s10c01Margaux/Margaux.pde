// Llamada del primer objeto.
class Margaux {
// Creación de variables.
  float x, y, tx, ty, velx, vely, angulo, a, rotation, tercero;
  
// Declaración de las variables.
  Margaux (float x, float y, float tx, float ty, float velx, float vely, float angulo) {
    this.x = x;
    this.y = y;
    this.tx = tx;
    this.ty = ty;
    this.velx = velx * 0.5; 
    this.vely = vely * 0.5;
    this.angulo = angulo;
    // this.r = 10; // variables sin uso
  }
  
// Dibujo de la primera forma, una línea de 4px que vibra.
    void formaUno() {
    pushMatrix();
    translate(x, y);
    strokeWeight(4);
    stroke(#00BC9C);
    // noFill(); //la función line por defecto no tiene fill
    line(0, 0, 10, 10);    
    popMatrix();
  }
  
// Dibujo de la segunda forma, una elipse que vibra al mismo tiempo que la linea.
  void formaDos() {
    pushMatrix();
    translate(x * 2, y * 2);
    strokeWeight(2);
    stroke(#00BC9C);
    noFill();
    ellipse(x, y, 20, 20);    
    popMatrix();
  }

// Ajuste del primer movimiento.
 void movimientoUno() {
    x += velx; // anteriormente velx y vely se estaban aumentando en cada loop por si mismas.
    y += vely; // de esta forma velx y vely llegan a tener valores mayores a la función movimientoTres
    rotation += 0.1;
  }
  
// Dibujo de la tercera forma, una otra linea que realiza una rotación continua a la izquierda.
 void formaTres() {
    pushMatrix();
    translate(x, y);
    rotate(rotation);
    strokeWeight(2);
    stroke(#00BC9C);
    // noFill(); //la función line por defecto no tiene fill
    line(0, 0, 15, 15);    
    popMatrix();
  }

// Ajuste del segundo movimiento, una rotación rapida a la izquierda.
   void movimientoDos() {
    rotation += 0.1;
    }
    
// Dibujo de la cuarta forma, un rectángulo .
   void formaCuatro() {
    pushMatrix();
    translate(x, y);
    rotate(angulo);
    strokeWeight(2);
    stroke(#FBC430);
    noFill();
    rect(x, y, 5, 5);    
    popMatrix();
  }
  
// Ajuste del tercer movimiento que es diferente dependiendo de la posición x e y del rectángulo.
   void movimientoTres() {
    if (x > tx || x < tx - 25) {
      velx *= -1; //antes el valor dejaba en 0 luego de un tiempo. dejar en -1 cambiar el valor
    }             // y entonces su dirección.
    if (y > ty || y < ty - 25) {
      vely *= -1;
    }
    angulo += 0.05;
  } 
}

// Llamada del segundo objeto.
 class Gomar {
// Creación de variables
  float x, y, tercero;
  
// Declaración de las variables.
  Gomar (float x, float y, float tercero) {
    this.x = x;
    this.y = y;
    this.tercero = tercero;
  } 
  
// Dibujo de la quinta forma, un diamante que que realiza una rotación continua a la derecha.
  void formaCinco() {
    pushMatrix();
    translate(x * 2, y * 2);
    rotate(tercero);
    strokeWeight(1);
    stroke(#EEEEEE);
    fill(#FFFFFF);
    quad(x, y, x + 5, y + 5, 10, 10, 10, 10);    
    popMatrix();
  }

// Ajuste del cuarto movimiento que realiza una rotación a la derecha.
   void movimientoCuatro() {
    tercero -= 0.1;
  } 
}
 