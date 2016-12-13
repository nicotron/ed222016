# Certamen00

s04c00

El certamen00 tiene una estructura de 4 partes:

1. Descripción del código
2. Código: estructura y complejidad
3. Resultado gráfico en dos formatos
4. Explicación del código de forma oral

------

##### Descripción del código

Se ha visto constantemente en las clases y tareas, que la descripción se puede hacer en bloques de comentarios, después de cada línea de código y como título descriptivo de cada párrafo de código.

```java
/*
Este es un bloque de texto que sirve para describir en palabras simples
y con detalle, lo que el código hará. Una buena práctica es apretar "enter"
al momento que el bloque de texto alcanza el ancho de la ventana que da 
Processing
*/

println("certamen01"); //Este es un comentario de línea

//Y este uno de título descriptivo
//Al apretar tecla 'a' se guarda y cierra el programa
if (key == 'a') {
  saveFrame("s04c01nicolas.pdf");
  exit();
}
```



##### Código: estructura y complejidad

La parte más importante ya que si no está escrito correctamente el programa no se compila, lo que tiene como resultado **nota 1.0** 

La estructura del código debe contener todas las funciones que se han visto, si se escriben funciones que no se han visto, se preguntará al alumno por una explicación del funcionamiento:

`int` `float` `void setup()` `size();` `void draw()` `point();` `line();` `ellipse();` `rect();`   
`fill(r, g, b, alpha);` `stroke(r, g, b, alpha);` `noStroke();` `noFill();` `strokeWeight(pixels);` `width` `height` `noLoop();` `random();` `for (init; test; update) {}` `if (test) {código}`
 `else if (test){código}` `else{código}` `keyPressed(){}`

*La función `saveFrame();` se verá en detalle al inicio del certamen antes de enviar a imprimir*

El certamen debe tener código que tenga niveles de complejidad:

1. Doble for loop
2. Doble for loop + condicionales 
3. Interacción de teclado para cambiar variables
4. Más de un Doble for loop + condicionales 
5. Más de un Doble for loop + condicionales + Interacción de teclado para cambiar variables

A mayor nivel de completidad entregado la nota resultante será mayor.



##### Resultado gráfico en dos formatos

Se entregarán dos códigos `s04c00nombre00` `s04c00nombre01` :

`s04c00nombre00` 
Se imprimirá en una dimensión de 40 cms de ancho x 50 cms de alto, estás dimensiones son muy grandes para que Processing pueda trabajarlas en pixeles, pero como trabajamos con vectores, se podrán usar **resoluciones de 4 x 5** las que antes de enviar a imprimir se adaptarán al formato final. 

`s04c00nombre01` 
Se imprimirá en una dimensión de 25.4 cms de ancho x 21 cms de alto, estás dimensiones son muy grandes para que Processing pueda trabajarlas en pixeles, pero como trabajamos con vectores, se podrán usar **resoluciones de 3 x 2.5** las que antes de enviar a imprimir se adaptarán al formato final. 

------

#### Es importante que se prototipe un espacio de la grilla creada por el "doble `for ()` loop" así se podrá ver en detalle lo que se está dibujando a una escala mayor de la final

------



##### Explicación del código de forma oral

Una vez entregado se repasará cada programa para hacer consultas al respecto de cómo se construye lógicamente cierta figura en la pantalla.



##### Entrega

La entrega será antes de las 16:00:00 del día jueves 01 de Septiembre de 2016, por medio de un **pull request** para luego ser enviado a imprimir los dos archivos para corregir. El archivo `s04c00nombre01` es el que luego será convertido en una libreta de notas.

Durante la primera parte de la clase, desde las 14:30:00 - 15:59:59 se harán comentarios para ayudar a quienes no han podido lograr el objetivo planteado, serán solo comentarios ya que si el alumno no puede entender las instrucciones para solucionar el problema en su trabajo, quiere decir que aún no sabe lo que está escribiendo, situación que deja en crisis el avance pendiente para el objetivo del semestre.

##### Nota

Escala de evaluación: 

1. Resultado visual 30% de la nota. Tendrá relación con lo descrito en el inicio del programa a través de bloques de comentario.

2. Interacción 10% de la nota. Coherencia en el cambio en el flujo del programa.

3. Redacción 60% de la nota. 

   1. Descripción de cada item en donde puedan existir errores para descontar la nota y factor por error:

      - **run 7.0:** si el programa corre o no, si no corre es 1.0.
      - **programa 1.0**: si cumple con el encargo.
      - **sintaxis 0.5**: coherencia con la redacción de código en los bloques de texto.
      - **código 0.3** : coherencia en lo escrito, i.e. conflicto entre variables.
      - **variables 0.6**: uso de variables asignadas con valores numéricos.
      - **comentarios 0.5**: coherencia entre la descripción y el bloque de texto.
      - **ortografía 0.3:** falta o exceso de caracteres.
      - **notación 0.2:** ruta y nombre de archivo.
      - **github 0.1:** coherencia entre notación de archivos, commit y pull request

      ​
