int b= 255; //primera variable que hace referencia al color blanco
int n= 0; //segunda variable que hace referencia al negro
int t= 250;// valor usado para darle el tamaño a nuestros cuadrados, tambien servira para que este se ubique en otra esquina de la composicion (razón por la que equivale a la mitad de esta).
color color1; // nombrar a nuestro primer color, el cual seria: "color1"
color color2; // nombrar a nuestro segundo color, el cual seria: "color2"

void setup() {
  size (500, 500); //tamaño de nuestra composicion 
  background(255); //el fondo de nuestra composicion
  color1= color(132, 87, 232); // llamamos a nuestro color y le damos el valor que tendra
  color2= color(78, 9, 229); // llamamos a nuestro segundo color y le damos otro valor
}

void draw() {
  stroke(b); //todo tendra una linea de color blanco, a menos que se indique lo contrario
  strokeWeight (10); //este corresponde al ancho que tendra nuestra linea
  
  fill(color1); //este primer cuadrado usara el colo: "color1"
  rect(0, 0, t, t); // se encuentra en la posicion 0, y su tamaño es "t", el cual corresponde a 250

  fill(n); //este segundo cuadrado usara la variable: "n"
  rect(t, 0, t, t); // al igual que el anterior su tamaño es  "t", pero su posicion varia, cosa de que cambie de esquina

  fill(n); //este tercer cuadrado usara la variable: "n"
  rect(0, t, t, t); // al igual que el anterior su tamaño es  "t", pero su posicion varia, cosa de que cambie de esquina
  
  fill(color2); // En este caso la siguiente fgura que se encuentre vajo de este codigo usara el color: "color2"
  ellipse(t, t, 100, 100); //La posicion de esta ellipse sera al medio de nuestra composicion, ya que esta esta definida por nuestra variable "t" que corresponde a la mitad de nuestra composicion. Ademas de tener un diametro de 100
}