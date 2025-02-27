//negrique

//Variables

//PJ
float pjx, pjy;
//PNJs
float pnj1x, pnj1y;
float pnj2x, pnj2y;
//alfas
float alfa1, alfa2;


//Setup
void setup()
{
  //ventana
  size(1000, 700);
  
  //Posición inicial del PJ (En medio de la ventana)
  pjx = width/2.0;
  pjy = height/2.0;
  
  //posicion inicial de pnj1 y pnj2
  pnj1x = width/3.0;
  pnj1y = height/3.0;
  pnj2x = width/5.0;
  pnj2y = height/5.0;
  
  //crear alfas rusticos
  alfa1 = 0.055;
  alfa2 = 0.085;
  
}
//Draw loop
void draw()
{
   //quitar el fondo
   background(255);
   
  //Posicion y vision de PJ
  pjx = mouseX;
  pjy = mouseY;
  fill(255,125,0);
  ellipse(pjx,pjy,width/20.0,height/13.5);
  
  //pintar pnjs rusticos
  fill(0,125,0);
  ellipse(pnj1x,pnj1y,width/20.0,height/29.5);
  fill(0,125,0);
  ellipse(pnj2x,pnj2y,width/20.0,height/29.5);
  
  //calculos de posicion rusticos pnj1 y pnj2
  pnj1x = (1.0 - alfa1) * pnj1x + alfa1 * pjx; 
  pnj1y = (1.0 - alfa1) * pnj1y + alfa1 * pjy;
  
  pnj2x = (1.0 - alfa2) * pnj2x + alfa2 * pjx; 
  pnj2y = (1.0 - alfa2) * pnj2y + alfa2 * pjy;
  
  
}
