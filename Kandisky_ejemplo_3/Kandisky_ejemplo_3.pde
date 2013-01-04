/*
Author: Sebastian G. Botasi <sgonzalez@bionimio.com.ar>
Date: 2011
Description: Prototype with aesthetic artworks Kandinsky.
Object Creation chromatic circles for configuring colors and creates concentrically.

*/
EllipsesCromatico[] p1;
PImage fondo;
int cantidad;

void setup() {

  size( 1024, 600); //wsvga
  smooth();
  fondo = loadImage("textura_0.jpg");
  iniciar();
}

void draw() {

  background( #ece7ca );
  image(fondo, 0, 0);

  for ( int i=0; i<cantidad; i++ ) {
    p1[i].draw();
  }
}

void mousePressed() {
  iniciar();
}

void iniciar() {
  boolean valor = false;
  cantidad = int( random( 7, 15 ) );
  p1 = new EllipsesCromatico[ cantidad ];

  for ( int i=0; i<cantidad; i++ ) {
    p1[i] = new EllipsesCromatico();
    p1[i].setTranslate( valor );
    p1[i].setStroke( valor );
    valor = !valor;
  }
}





//----------------------



