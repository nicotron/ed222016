En este código se visualizan los datos climáticos de la ciudad Barrow en Alaska, el código
cuenta con cuatro tipos de visualizaciones que enseñan distintos datos. En primer lugar,
tenemos la visualización del void elipses (tecla '1'), la cual a través del color muestra
las temperaturas máxima y mínima graficadas con el color rojo y azul respectivamente, generando
una gama de rosas y morados por las frías temperaturas del lugar. También a través de un frameCount
vemos como cambia el tamaño de las elipses según los datos entregados del punto de rocío, y por ultimo,
vemos como la opacidad es alterada por los datos de Visibilidad en kilometros de Barrow.
En la segunda visualización llamada void lineas (tecla '2'), vemos como los colores son alterados nuevamente,
pero esta vez gracias a la velocidad del viento, creando gamas entre verdes y azules, y como también
el tamaño de estas lineas se ve alterado por la cantidad de nubes que hubieron ese día.
La tercera visualización es el void triángulo ( tecla '3'), la cual estudia la temperatura
según color y hacia donde se direcciona el vértice, ocupando el punto 'y' de las otras dos aristas
como punto 0.
Por último el void circular ( tecla '4'), este último void estudia el mar, los colores de las lineas
están dados por la presión del mar en tonos rojos y verdes para máxima y mínima respectivamente
y la ráfaga define el tamaño de la linea.
Para poder usar de una mejor manera los datos, estos tuvieron que mapear sus valores a través de la función
"map", además al código se le agregaron una serie de teclas para la reorganización de un año, pudiéndolo
ver en semestre ('f'), estaciones ('d'), meses ('s') y semanas ('s').

