/*
Author: Sebastian G. Botasi <sgonzalez@bionimio.com.ar>
Date: 2011
Description: This program allows you to analyze if an object is within a region of the screen. 
Originally this program was designed to see if an object is pressing TUIO or entering certain region. 
The algorithm has a function that returns true or false if this condition is met.
Version: Processing 1.5
*/



PFont fuente;
Circulo dedo;
Region region;


int x1 = 40;
int y1 = 130;
int ancho = 320;
int alto = 100;

void setup() {
  size(800, 400);

  background(255);

  fuente = loadFont("Tahoma.vlw");
  textFont(fuente, 14);



  region = new Region( x1, y1, ancho, alto );  

  smooth();
}


void draw() {
  background(255);
  stroke(0);
  line( width/2, 0, width/2, height );


  region.draw();
  region.imprimir();




  if ( dedo != null) {
    if ( circuloIngresaRegion(dedo)) {
      region.activa();
      dedo.ingreso = true;
    }
    else {
      region.desactiva();
      dedo.ingreso = false;
    }

    dedo.dibujo();
    dedo.imprimir();
  }
}


void mouseReleased() {
  dedo = new Circulo(0, int(mouseX), int(mouseY), 40 );
}


boolean circuloIngresaRegion(Circulo estePuntero) {
  float x_ = estePuntero.x;
  float y_ = estePuntero.y;

  boolean valor = (x_ > x1) && (x_ < (x1+ancho)) && (y_ > y1) && (y_ < (y1+alto));

  return valor;
}


//===============================================================

