###### Expresión Digital II - Facultad de Diseño - UDD - 2016

##### Examen

El examen tiene como objetivo la demostración del conocimiento acumulado a lo largo del semestre, en relación a la escritura de código para un resultado visual. Con especial interés en el manejo de bases de datos y la visualización de esos datos. 

##### Descripción:

Cada alumno tendrá una base de datos que consiste en datos del clima de un año de una ciudad específica, con datos de los 365 días del año y cada día con 21 factores a considerar. 

Se considerará como examen entregado apto para ser corregido **un programa** con:

1. A lo menos dos visualizaciones, una general y una particular.
   1. Se podrán crear más visualizaciones dentro de estos parámetros. Mientras más visualizaciones es mayor la complejidad lo que lleva a optar por una nota mayor.
2. Navegación dentro la pantalla del programa, (ya que no se podrán leer los comentarios del código), con mensajes para presionar teclas o interacción con el mouse

##### Para crear un programa se debe exportar como aplicación en Processing `File>Export Application`

------

##### Entrega:

La entrega será antes de las 14:30:00 del día jueves 01 de Diciembre de 2016, por medio de un **pull request** el que será aceptado a medida que se publiquen.

El pull request debe contener: 

1. Carpeta con código y base de datos
2. Archivo `README.md` describiendo el programa en sus características y uso. Los archivos de extensión `md` (Markdown) son usados en general a través de Github y son los que aparecen por defecto en cada página dentro del sitio web. Todas las tareas han sido escritas con esta extensión. Para redactar existe una barra de herramientas al momento de escribir un archivo en Github o se puede usar un software llamado [Typora](http://www.typora.io/)

------

##### Formato:

El formato es de libre dimensión, cada alumno deberá pensar un canvas que sea lo más adecuado para el objetivo que quiere lograr y el resultado gráfico que le dará a los datos. 

------

##### Proceso:

El examen será presentado el día jueves 17 de Noviembre y se espera que cada alumno desarrolle a lo largo de la clase un objetivo individual de cómo quiere visualizar los datos. Esto a través de referentes, esquemas y dibujos. Una vez el objetivo sea claro, se procederá a guiar el desarrollo del programa enseñando métodos para lograr aspectos específicos que se quieren lograr y que han quedado fuera del contenido del curso. 

------

##### Niveles de visualizaciones:

General a Particular:

año - semestre - estación - mes - semana - días - día.

Visualizar diferentes datos por cada nivel también ayuda a optar a una calificación mayor.

------

##### Niveles de evaluación:

Entregando una visualización con dos niveles uno general y uno particular con dos datos, se opta a nota 5.0

Los datos son:
Por defecto debe existir el **día**, sumado a un set de variables: 

**Temperatura**: Mínima, media, máxima  
**Punto de rocío**: Mínima, media, máxima  
**Humedad**: Mínima, media, máxima  
**Presión atmosférica**: Mínima, media, máxima  
**Visibilidad**: Mínima, media, máxima  
**Viento**: Mínima, media, máxima  
**Precipitación**: Total  
**Eventos**: Lluvia, tormenta, nieve, truenos, niebla

**Temperatura**

| Nota | Visualizaciones |       Diferentes Datos       |
| :--: | :-------------: | :--------------------------: |
| 5.0  |        2        |   día + set de variable(1)   |
| 5.5  |        3        |   día + set de variable(1)   |
| 6.0  |        4        |   día + set de variable(2)   |
| 6.5  |        5        |   día + set de variable(2)   |
| 7.0  |      6 o +      | día + set de variable(2 o +) |

------

##### Criterios de evaluación:

Se evaluará la propuesta final, como también el código. Ya es conocida la estructura de evaluación del código: 
Descripción de cada ítem en donde puedan existir errores para descontar la nota y factor por error:

- **run 7.0:** si el programa corre o no, si no corre es 1.0.
- **programa 0.5**: por cada nivel de dificultad faltante.
- **sintaxis 0.3**: coherencia con la redacción de código en los bloques de texto.
- **código 0.3**: coherencia entre los bloques de código entre sí, y variables.
- **comentarios 0.15**: coherencia entre la descripción y el bloque de texto.
- **ortografía 0.5:** falta o exceso de caracteres.
- **notación 0.2:** ruta y nombre de archivo.
- **github 0.1:** coherencia entre notación de archivos, commit y pull requestDiseño de la Información

La propuesta final se evaluarán factores de diseño:

- **diseño de la información**
- **diseño gráfico**
- **interacción**