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
  velocidad = 2;
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
void level (){
  if (puntaje == 5){
     velocidad = 3;
  } 
  if (puntaje == 10){
     velocidad = 4;
  } 
  if (puntaje == 15){
     velocidad = 5;
  }
  if (puntaje == 20){
     velocidad = 6;
  }
  if (puntaje == 25){
     velocidad = 7;
  }
  if (puntaje == 30){
     velocidad = 8;
  }
  if (puntaje == 35){
     velocidad = 9;
  }
  if (puntaje == 45){
     velocidad = 10;
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
    colision = false;
    last_record = puntaje;
    
    /*if (puntaje > mayor_puntaje[0] && puntaje > mayor_puntaje[1] && puntaje > mayor_puntaje[2]  ) {
      mayor_puntaje[2] = mayor_puntaje[1]; 
      mayor_puntaje[1] = mayor_puntaje[0]; 
      mayor_puntaje[0] = puntaje;  
    } else if(puntaje > mayor_puntaje[1] && puntaje > mayor_puntaje[2] ) {
      mayor_puntaje[2] = mayor_puntaje[1]; 
      mayor_puntaje[1] = puntaje;   
    }else if (puntaje > mayor_puntaje[2] ) {
      mayor_puntaje[2] = puntaje;
    }*/
    inicio();
  }
//if (puntaje>5){
//hueco = 25;
//}
 }
}
