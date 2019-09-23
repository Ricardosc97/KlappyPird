void columna(int x,int altura){
  fill (250);
  stroke(250);
  rect (x,0,columnWidth,altura);
  rect (x,altura+hueco,columnWidth,height);
  return;
}
void inicio(){
  x[0] = width;
  x[1] = x[0] + (width/3);
  x[2] = x[1] + (width/3);
  for (int i = 0; i < 3; i++){
    altura[i] = int(random(techo,height - 70));
  }
  puntaje = 0;
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

void refreshColummns(){
  for (int i = 0; i < 3; i++){
    if(x[i] < -columnWidth){
      x[i] = width;
      altura[i] = int(random(techo,piso));
      puntaje = puntaje +1;
    }
  }
}

void gameover(){
  fill(0);
  textSize(24);
  text("GAME OVER",width/2-60,height/2-20);
  delay(250);
  fill(255);
  text("GAME OVER",width/2-60,height/2-20);
  delay(250);
  delay(5000);
}

void hitbox(){
  for (int i = 0; i < 3; i++){
    if((distancia < altura[i] || distancia + 40 > altura[i] + hueco) && (52 > x[i])){
    colision = true;
    image(img, 15, distancia, 40, 40);
  }
  if(colision){
    image(img, 15, distancia, 40, 40);
   // text("GAME OVER",width/2-60,height/2-20);
    inicio();
    mayor_puntaje[0] = puntaje; 
    colision = false;
    for (int y = 0; y < 3; y++){
    if(mayor_puntaje[y] < puntaje){
      mayor_puntaje[y] = puntaje;
    }
   }
  }
//if (puntaje>5){
//hueco = 25;
//}
 }
}
