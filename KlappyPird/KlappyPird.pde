import processing.serial.*;
Serial port;

int techo = 80;
int piso = 330;
int hueco = 100;
int distancia_p;
int distancia;
int yPos;
int yPosPresent;

int x1 = width;
float a1 = random (techo,piso);
int altura1 = int (a1);

int x2 = x1+210;
float a2 = random (techo,piso);
int altura2 = int (a2);

int x3 = x2+210;
float a3 = random (techo,piso);
int altura3 = int (a3);

int cuenta = 0;

void setup(){
  size (600,400);
  background(0,0,150);
  port = new Serial(this, "COM7",9600);
  port.bufferUntil ( '\n' );
}

void draw(){
  background(0,0,150);
  stroke(250);
  if (port.available() > 0){
    converter(port.read());
  }
  line(50, distancia,15, distancia);
  //distancia_p = distancia;
  fill (250);
  columna(x1, altura1);
  x1 = x1 - 2;
  columna(x2, altura2);
  x2 = x2 - 2;
  columna(x3, altura3);
  x3 = x3 - 2;
  
  //if (cuenta>5){
    //hueco = 25;
  //}
  if(x1<-50){
    x1=width;
    a1 = random (techo,piso);
    altura1 = int (a1);
    cuenta = cuenta +1;
  }
  if(x2<-50){
    x2=width;
    a2 = random (techo,piso);
    altura2 = int (a2);
    cuenta = cuenta +1;
  }
  if(x3<-50){
    x3=width;
    a3 = random (techo,piso);
    altura3 = int (a3);
    cuenta = cuenta +1;
  }
  fill(0);
  textSize(24);
  text(cuenta,20,30);
}

void columna(int x,int altura){
  fill (250);
  rect (x,0,50,altura);
  rect (x,altura+hueco,50,400);
  return;
}

void converter(int medida){
  if (medida > 80 ){
    return;
  } else if (medida < 5){
    distancia = 390;
  } else{
    distancia = (390-(medida-5)*6);    
  }
}
