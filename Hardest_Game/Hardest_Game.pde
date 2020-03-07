int[][] mapa= {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
               {1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
               {1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
               {1,0,0,0,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
               {1,0,0,0,2,2,2,1,1,1,1,1,1,1,1,1,3,3,1},
               {1,0,0,0,2,2,2,1,1,1,1,1,1,1,1,1,3,3,1},
               {1,0,0,0,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
               {1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
               {1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
               {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}};
               
void dibujarMapa(int[][] mapa){
  float largo = width*1.0/mapa.length;
  float ancho = width*1.0/mapa[0].length;
  for(int fila = 0; fila < mapa.length; fila++){
    for(int columna = 0; columna < mapa[0].length; columna++){
      stroke(255); 
      if(mapa[fila][columna] == 0 || mapa[fila][columna] == 3){
        stroke(204,255,204);
        fill(204,255,204);
      }
      else if(mapa[fila][columna] == 2){
        stroke(153,204,255);
        fill(153,204,255);
        }
      else {
        stroke(153,153,255);
        fill(125,125,255);
      }
      rect(columna*ancho, fila*largo, ancho, largo);
    }
  }
}           

  
//VARIABLES DEL PERSONAJE
float posicion_inicial_x = 125;
float posicion_inicial_y = 475;
float personaje_x = posicion_inicial_x;
float personaje_y = posicion_inicial_y;
float personaje_radio = 15;
float[] enemigos_x = new float[14];
float[] enemigos_y = new float[14];
float radio_enemigos = 15;
color color_enemigo = color(0, 0, 255);
float personaje_velocidad_x = 2;
float personaje_velocidad_y = 2;
color personaje_color = color(255,0,0);
boolean mover_izq, mover_der, mover_arriba, mover_abajo; 
boolean colision_personaje = false;

//Variables enemigo (deben ser arreglos)

/*AQUI DEBE GENERAR LAS VARIABLES REQUERIDAS*/
PImage ganador;
void setup(){
  size(950,950);
  ganador = loadImage("win.png");
}

void draw(){
  background(0);
  dibujarMapa(mapa);
  dibujaPersonaje(personaje_x, personaje_y, personaje_radio, personaje_color);
  /*
  dibuje aqui a los enemigos
  */
  inienemigo();
  dibujaEnemigos1();
  dibujaEnemigos2();
  
  
   intersect(265, 885, 110, 380);
   intersect(250, 885, 570, 840);
   intersect(800, 900, 380, 570);
   intersect(200, 350, 380, 570);
   intersect(65, 200, 300, 650);
   pared();
  /*
  actualice a los enemigos (posicion)   
  */
  /*
  llame a la funcion colision (debe retornar un booleano)
  que retorne verdadero cuando un enemigo y el personaje chocan.
  en otro caso retorna falso
  */
  //colision_personaje = colision();
 ganador(800, 900, 380,570);
}

//FUNCIONES DEL ENEMIGO
/*
Consideraciones:
- Para dibujar al enemigo puede utilizar la funcion del personaje (ver funcion dibujarPersonaje) 
- Debe revisar siempre si existe una colision entre el personaje y el enemigo:
    crear la funcion boolean colision()
- Los enemigos deberian moverse
*/


//FUNCIONES DEL PERSONAJE (No es necesario modificarlas)
void dibujaPersonaje(float x, float y, float radio, color c){
  pushStyle();
  noStroke();
  fill(c);
  ellipse(x, y, 2*radio, 2*radio);
  popStyle();
}

void actualizarPersonaje(float velocidad_x, float velocidad_y){
  /*if(colision_personaje){
    personaje_x = 30;
    personaje_y = 30;
  }*/
  if(mover_izq) personaje_x -= velocidad_x;
  if(mover_der) personaje_x += velocidad_x;
  if(mover_arriba) personaje_y -= velocidad_y;
  if(mover_abajo) personaje_y += velocidad_y;
}

void dibujaEnemigos1(){
  pushStyle();
  noStroke();
  fill(0, 0, 255);
  for(int i = 0; i < 5; i++){
    if(i % 2 == 0){
      enemigos_y[i] =  120 * sin(frameCount/15) + enemigos_y[i];
  ellipse(enemigos_x[i], enemigos_y[i], 2*radio_enemigos, 2*radio_enemigos);
  colision_personaje();
  }
     if(i % 2 == 1){
       enemigos_y[i] =  -120 * sin(frameCount/15) + enemigos_y[i];
  ellipse(enemigos_x[i], enemigos_y[i], 2*radio_enemigos, 2*radio_enemigos);
  colision_personaje();
  }
  }
  
  popStyle();
}

void dibujaEnemigos2(){
  pushStyle();
  noStroke();
  fill(0, 0, 255);
  for(int i = 5; i < 14; i++){
    if(i % 2 == 0){
      enemigos_y[i] =  120 * sin(frameCount/15) + enemigos_y[i];
  ellipse(enemigos_x[i], enemigos_y[i], 2*radio_enemigos, 2*radio_enemigos);
  colision_personaje();
  }
     if(i % 2 == 1){
       enemigos_y[i] =  -120 * sin(frameCount/15) + enemigos_y[i];
  ellipse(enemigos_x[i], enemigos_y[i], 2*radio_enemigos, 2*radio_enemigos);
  colision_personaje();
  }
  }
  
  popStyle();
}

void moverPersonaje(boolean activar){
  switch(keyCode){
    case LEFT:{
      mover_izq = activar;
      break;
    }
    case UP:{
      mover_arriba = activar;
      break;    
    }
    case RIGHT:{
      mover_der = activar;
      break;

    }
    case DOWN:{
      mover_abajo = activar;
      break;
    }
  }

}

void keyPressed(){
  if(key == CODED){
    moverPersonaje(true);
  }
}

void keyReleased(){
  if(key == CODED){
    moverPersonaje(false);
  }
}

boolean intersect(int x1, int x2, int y1, int y2){
 
  if(personaje_x >= x1 && personaje_x < x2 && personaje_y >= y1 && personaje_y < y2){
    actualizarPersonaje(personaje_velocidad_x, personaje_velocidad_y);  
    return true;
  }
  else {
    return false;
    }
  }
  
void pared(){
  if(intersect(265, 885, 110, 380) == false && intersect(250, 885, 570, 840) == false && intersect(800, 900, 380, 570) == false && intersect(200, 335, 380, 570) == false && intersect(65, 200, 300, 650)== false){
     switch(keyCode){
     case RIGHT:{
             personaje_x = personaje_x -1;
      dibujaPersonaje(personaje_x, personaje_y, personaje_radio, personaje_color);
      break;

    }
    case LEFT:{
      personaje_x = personaje_x +1;
      dibujaPersonaje(personaje_x, personaje_y, personaje_radio, personaje_color);
      break;
    }
    case UP:{
      personaje_y = personaje_y +1;
      dibujaPersonaje(personaje_x, personaje_y, personaje_radio, personaje_color);
      break;    
    }
   
    case DOWN:{
      personaje_y = personaje_y -1;
      dibujaPersonaje(personaje_x, personaje_y, personaje_radio, personaje_color);
      break;
    }

  }
    
  } 
}
  
  void inienemigo(){
    enemigos_x[0] = 375;
    enemigos_y[0] = 710;
    enemigos_x[1] = 475;
    enemigos_y[1] = 710;
    enemigos_x[2] = 575;
    enemigos_y[2] = 710;
    enemigos_x[3] = 675;
    enemigos_y[3] = 710;
    enemigos_x[4] = 775;
    enemigos_y[4] = 710;
    enemigos_x[5] = 700;
    enemigos_y[5] = 235;
    enemigos_x[6] = 350;
    enemigos_y[6] = 235;
    enemigos_x[7] = 400;
    enemigos_y[7] = 235;
    enemigos_x[8] = 450;
    enemigos_y[8] = 235;
    enemigos_x[9] = 500;
    enemigos_y[9] = 235;
    enemigos_x[10] = 550;
    enemigos_y[10] = 235;
    enemigos_x[11] = 600;
    enemigos_y[11] = 235;
    enemigos_x[12] = 650;
    enemigos_y[12] = 235;
    enemigos_x[13] = 750;
    enemigos_y[13] = 235;
    }
    
  void colision_personaje(){
    for( int i = 0; i < 14; i++){
    if(sqrt(pow(enemigos_x[i]-personaje_x, 2) + pow(enemigos_y[i]-personaje_y, 2)) <= 30){
     personaje_x = posicion_inicial_x;
     personaje_y = posicion_inicial_y;
    }
    }
    };  
    
 void ganador(int x1, int x2, int y1, int y2){
  if(personaje_x >= x1 && personaje_x < x2 && personaje_y >= y1 && personaje_y < y2){
    image(ganador, 237, 237);
  }
  }
