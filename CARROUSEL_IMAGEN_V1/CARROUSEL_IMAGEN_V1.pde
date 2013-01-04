/*
Author: Sebastian G. Botasi <sgonzalez@bionimio.com.ar>
Date: 2011
Description: The application is designed to load a series of images that are stored in the Data folder
and make a carousel of images that can be traveled on according to mouse movement.
The object allows you to pass PARAMETERS height and width and apply them to the images automatically.
Version Test: Processing 1.5


*/
visualizadorImagen visualizador;

float rotacion,rotacion_;
int cont;

void setup() {
  size (1000,400,P2D);
  visualizador = new visualizadorImagen(50,50,320,240,32); 
  visualizador.cargarImagen("data_",".jpg"); 

  rotacion = 0;
  cont = 0;  
}

void draw() {
  background(0);
  rotacion_ = rotacion;

  //println("Cont: " + cont);
  //dibujo(width/2,height/2,cont);

  visualizador.dibujar();
  visualizador.paginar(10);
  visualizador.mover(mouseX,5);
}


void dibujoPatron(float patronX, float patronY, float patronRotacion) {
  rectMode(CENTER);
  pushMatrix();   
  translate(patronX,patronY);
  rotate(patronRotacion);
  rect(0,0,50,50);
  popMatrix();
}


void dibujo(float patronX, float patronY, float patronRotacion) {
  rectMode(CENTER);
  pushMatrix();   
  translate(patronX,patronY);
  rotate(radians(patronRotacion));
  rect(0,0,50,50);
  popMatrix();
}

