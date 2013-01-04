/*
Author: Sebastian G. Botasi <sgonzalez@bionimio.com.ar>
Date: 2011
Description: Application that incorporates object that generates the type transitions fade-in fade-out.
*/

void infoPrograma() {
  println(frame.getTitle());
  println ();
  println (" ********************************************************");
  println (" *                                                      *"); 
  println (" *  COMANDOS                                            *"); 
  println (" *  >> S = Inicia Fade - In                             *"); 
  println (" *  >> D = Inicia Fade - Out                            *");
  println (" *  >> F = Reinicia                                     *");
} 


Transition fadeIn, fadeOut;

int estado;

int ESPERA = 1;
int ACTIVO = 2;
int PROCESO = 3;

void setup() {
  size( 800, 600);
infoPrograma();
  
  fadeIn = new Transition();
  fadeIn.setMode( "fadeIn" );
  fadeIn.setColor( 0, 0, 0 );
  fadeIn.setVelocity( 8 );


  fadeOut = new Transition();
  fadeOut.setMode( "fadeOut" );
  fadeOut.setColor( 0, 0, 0 );
  fadeOut.setVelocity( 8 );

  estado = ESPERA;
}

void draw() {

  if ( estado == ESPERA ) {
    background( 255, 0, 0 );
    if ( key == 's' || key == 'S') {

      fadeOut.start();
      if ( fadeOut.isEnd() ) {

        fadeOut.reset();
        estado = ACTIVO;
      }
    }
  }

  else if ( estado == ACTIVO ) {
    background( 0, 255, 0 );

    fadeIn.start();
    if ( fadeIn.isEnd() ) {

      if ( key == 'd' || key == 'D') {
        fadeOut.start();
        if ( fadeOut.isEnd() ) {
          fadeOut.reset();
          fadeIn.reset();
          estado = PROCESO;
        }
      }
    }
  }

  else if ( estado == PROCESO ) {
    background( 0, 0, 255 );

    fadeIn.start();
    if ( fadeIn.isEnd() ) {

      if ( key == 'f' || key == 'F') {
        fadeOut.start();
        if ( fadeOut.isEnd() ) {
          fadeOut.reset();
          fadeIn.reset();
          estado = ESPERA;
        }
      }
    }
  }
}

