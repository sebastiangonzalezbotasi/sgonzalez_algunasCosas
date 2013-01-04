/*
Author: Sebastian G. Botasi <sgonzalez@bionimio.com.ar>
Date: 2011
Description: Prototype with aesthetic artworks Kandinsky.
Object Creation chromatic circles for configuring colors and creates concentrically.

*/
EllipsesCromatico[] p1;
int cantidad;

void setup() {

  size( 1024, 728);
  smooth();
  iniciar();
}

void draw() {

  background( #ece7ca );

  for ( int i=0; i<cantidad; i++ ) {
    p1[i].draw();
  }
}

void mousePressed() {

  iniciar();
}

void iniciar() {
  cantidad = int( random( 3, 7 ) );
  p1 = new EllipsesCromatico[ cantidad ];
  for ( int i=0; i<cantidad; i++ ) {
    p1[i] = new EllipsesCromatico();
    p1[i].transladar( (random(1) < 0.5) ? false : true );
  }
}





//----------------------



