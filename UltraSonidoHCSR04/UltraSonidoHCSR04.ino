int Trigger = 2;   
int Echo = 3;   

void setup() {
  Serial.begin(9600);
  pinMode(Trigger, OUTPUT); 
  pinMode(Echo, INPUT);  
  digitalWrite(Trigger, LOW);
}

void loop() {
  long tiempo; //timepo que demora en llegar el eco
  long distancia; //distancia en centimetros

  digitalWrite(Trigger, HIGH);
  delayMicroseconds(10);          //Enviamos un pulso de 10us
  digitalWrite(Trigger, LOW);
  
  tiempo = pulseIn(Echo, HIGH); //obtenemos el ancho del pulso
  distancia = tiempo/59;             //escalamos el tiempo a una distancia en cm
  
  //Serial.print("Distancia: ");
  //Serial.print(distancia);      //Enviamos serialmente el valor de la distancia
  Serial.write(distancia);
  //Serial.print("cm");
 // Serial.println();
  
  delay(100);          //Hacemos una pausa de 100ms
}
