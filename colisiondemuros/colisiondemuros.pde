//colisiones rusticas

//variables y objetos

PVector[] muro;
int num_muros;
int anchomuro;
int altomuro;

PVector PJmax;
PVector PJmin;

boolean colision;



//setup

void setup()
{
  //Ventana
  size(600,600);
  
  
  //inicializar muros
  num_muros = 12;
  anchomuro = 30;
  altomuro = 15;
  muro = new PVector[num_muros];
  
  for(int i = 0; i < num_muros; i++){
    //asignar valores a los muros
      muro[i] = new PVector(0,0); 
      muro[i].x = random(0, width - anchomuro);
      muro[i].y = random(0, height - altomuro);
    
  }
  
  //reserva de memoria del PJ
  //Aqui da advertencia nose porque
  PVector PJmax = new PVector(0,0); //Aqui se guarda xmax y ymax
  PVector PJmin = new PVector(anchomuro, altomuro ); //aqui guardamos ymin y xmin
  
  colision = false;
}


//draw
void draw()
{
  //pintar fondo
  background(250);
  
  //pintar muros
  fill(255, 0, 0);
  //pintar muros a partir del ancho pero empiezo por el inferior izquierdo
  rectMode(CENTER);
  for (int i = 0; i < num_muros; i++)
  {
    rect(muro[i].x, muro[i].y, anchomuro, altomuro);
    //esto es la funcion para crearlos, creo
  }
  
  //pintar al jugador
  if (colision == true) fill (0, 255, 0);
  else fill (0, 0, 255);
  rect(mouseX, mouseY, anchomuro, altomuro);
  
}

//eventos
void mouseMove(){
  //solo calculamos las colisiones cuando el mouse se mueva
  
  
  //inicializar jugador con el raton
  PJmin.x = mouseX - anchomuro / 2.0;
  PJmin.y = mouseX - altomuro / 2.0;
  PJmax.x = mouseX - anchomuro / 2.0;
  PJmax.y = mouseX - altomuro / 2.0;
  
  //ahora hay que comparar el jugador con todos losm uros y decir si tiene colisiones entre ellos
  for(int i = 0; i < num_muros; i++)
  {
    //hay que encontrar algo rustico
    PVector coordmaxmuro = new PVector(0,0);
    coordmaxmuro.x = muro[i].x + anchomuro;
    coordmaxmuro.y = muro[i].y + altomuro;
    
    //momento de hacer el test minmax
    // si xmax1 > xmin2 / xmax2 > xmin1
    if( (PJmax.x > muro[i].x || coordmaxmuro.x > PJmin.x) &&  (PJmax.y > muro[i].y || coordmaxmuro.y > PJmin.y) )
    {
      //si hay colisison
      colision = true;
     
    } 
    else {
      //no hay colision
      colision = false;
   
    }
   
  }
  
  
  

  
}
