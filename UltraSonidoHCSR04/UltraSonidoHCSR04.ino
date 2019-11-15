int Trigger = 2;   
int Echo = 3;   
long tiempo; //timepo que demora en llegar el eco
long distancia; //distancia en centimetros
void setup() {
  Serial.begin(9600);
  pinMode(Trigger, OUTPUT); 
  pinMode(Echo, INPUT);  
  digitalWrite(Trigger, LOW);
  
}

void loop() {
  

  digitalWrite(Trigger, HIGH);
  delayMicroseconds(10);          //Enviamos un pulso de 10us
  digitalWrite(Trigger, LOW);
  
  tiempo = pulseIn(Echo, HIGH); //obtenemos el ancho del pulso
  distancia = tiempo/59;             //escalamos el tiempo, /59 para cm
  //tiempo = tiempo/2;
  //Serial.println(tiempo);
  /*Serial.print("Distancia: ");
  Serial.print(distancia);      //Enviamos serialmente el valor de la distancia
  Serial.print("cm");
  Serial.println();*/
  Serial.write(distancia);
  delay(50);          //Hacemos una pausa de 50ms
}
