// Un detector de colisiones simple
// Basado en Bounding Boxes circulares
// El PJ es un circulo verde (se mueve con el raton)
// Los objetos colisionables son circulos rojos (son estaticos)

// Variables
int[] coords_x; // Coords X de los objetos colisionables
int[] coords_y; // Coords Y de los objetos colisionables
int numero_de_objetos; // Cuantos objetos colisionables hay en la escena
int radio_circulos; // Como de grandes son los objetos colisionables
boolean coli; // Variable de estado que me informa de si hay coli

// Setup
void setup() { // Se llama solo 1 vez y al principio
  // La ventana
  size(400, 400);
  // Inicializar los arrays
  numero_de_objetos = 10;
  coords_x = new int[numero_de_objetos];
  coords_y = new int[numero_de_objetos];
  // Calcular las x's y las y's de cada objeto colisionable
  // Los valores los vamos a poner "random"
  // Tienen que estar dentro de la ventana
  for (int i=0; i<numero_de_objetos; i++) {
    coords_x[i] = (int)random(width);
    coords_y[i] = (int)random(height);
  }
  // Determinamos el radio
  radio_circulos = 15;
  // Al empezar suponemos que no hay coli
  coli = false;
}

// Draw
void draw() { // Es el bucle infinito
  // Color de fondo a negro
  background(0);
  // Pinto el PJ
  if (coli == false) fill(0, 255, 0); // verde quier decir que NO hay coli
  else fill(0, 0, 255); // azul quiere decir que SI hay coli
  ellipse(mouseX, mouseY, radio_circulos*2, radio_circulos*2);
  // Pintemos los objetos colisionables
  fill(255, 0, 0); // rojo
  for (int i=0; i<numero_de_objetos; i++) {
    ellipse(coords_x[i], coords_y[i], radio_circulos*2, radio_circulos*2);
  }
}

// Eventos
void mouseMoved() { // Solamente comprovamos si hay coli cuando PJ se mueve
  // Me tengo que comparar con todos los objetos colisionables
  for (int i=0; i<numero_de_objetos; i++) {
    // Hay coli si la distancia entre los centros de
    // ambos circulos es igual o inferior a la suma de sus radios
    // Sabre la distancia calculando el modulo del vector entre ambos centros
    float[] vector_distancia = new float[2];
    vector_distancia[0] = coords_x[i] - mouseX;
    vector_distancia[1] = coords_y[i] - mouseY;
    float modulo_distancia = sqrt(vector_distancia[0]*vector_distancia[0]
      +vector_distancia[1]*vector_distancia[1]);
    // Comparamos la distancia calculada con la suma de los radios
    // Y vemos si se cumple la coli o no
    if (modulo_distancia<=radio_circulos*2) { // SI hay coli
      println("SI me acabo de chocar");
      coli = true;
      break;
    } else {
      println("NO me acabo de chocar");
      coli = false;
    }
  }
}
