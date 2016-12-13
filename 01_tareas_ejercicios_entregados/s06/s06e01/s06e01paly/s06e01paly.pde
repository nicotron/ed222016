float x, y, amt;
color c1, c2, c3;

void setup() {
 size(400, 400);
 x = 0;
 y = 0;

 c1 = color(190, 42, 89); //Rosado
 c2 = color(0, 0, 44); //Azul marino
}

void draw() {
 amt = map(x, 0, width, 0, 1); 
 c3 = lerpColor(c1, c2, amt);
 background(0);
 fill(c3); //(c3)
 noStroke();
 ellipse(x, y, 10, 10);
 x++;
 y++;
}