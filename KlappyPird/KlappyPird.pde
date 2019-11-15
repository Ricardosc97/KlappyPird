import processing.serial.*;
Serial port;
PImage img;
int techo = 80;
int piso = 330;
int hueco = 120;
int distancia;
int columnWidth = 50;
int [] x = {0,0,0};
int [] altura = {int(random(techo,height - 70)),int(random(techo,height - 70)),int(random(techo,height - 70))};
boolean colision = false;
boolean levelup = false;
int puntaje = 0;
int[] mayor_puntaje = {0,0,0};
int last_record = 0;
int velocidad = 2;

void setup() {
  textFont(createFont("Arial", 14));
  size (800, 400);
  //600 , 400 estandar
  background(0, 0, 150);
  port = new Serial(this, "COM14", 9600);
  port.bufferUntil ( '\n' );
  img = loadImage("images.jpg");
  inicio();
}

void draw() {
  background(0, 0, 150);
  if (port.available() > 0) {
   converter(port.read());
  }
  stroke(200,0,0);
  //distancia = port.read();
  //rect (13, distancia-2, 44,44);      //HitBox
  //distancia = mouseY;
  image(img, 15, distancia, 40, 40);
  fill (250);
  for (int i = 0; i < 3; i++){
     columna(x[i] ,altura[i]);
     x[i] = x[i] - velocidad;
  }
  textSize(38);
  fill(0);
  text(puntaje,width - 40 ,35);
  textSize(24);
  text("Last player:",width - 140,height - 68);
  text(last_record,width - 40,height - 44);
//  text("1°: " + mayor_puntaje[0],width - 80,height - 68);
//  text("2°: " + mayor_puntaje[1],width - 80,height - 44);
//  text("3°: " + mayor_puntaje[2],width - 80,height - 20);
  refreshColummns();
  level();
  hitbox();
  //if (puntaje > 1 && puntaje < 5) {
  //background(0,0,150);
  // gameover();
  //delay(5000);
  //}
}
