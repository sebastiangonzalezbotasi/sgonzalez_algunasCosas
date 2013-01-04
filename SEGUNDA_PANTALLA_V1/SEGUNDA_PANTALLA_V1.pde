/*
Author: Sebastian G. Botasi <sgonzalez@bionimio.com.ar>
Date: 2011
Description:Application that explores the possibility of a Processing application in a window and if there is a projector or other monitor connected replicate such an image. This is the first test will be developed soon more evolved versions.
*/

import java.awt.*;
import javax.swing.JFrame;

public JFrame nuevaVentana;
MiVentana ventana;

PImage imagen;

boolean hayProyector = false;
int anchoProyector, altoProyector;
int frameLocationX, frameLocationY;

OrganismoPG colonia;
int FRAME_RATE = 25;

void infoPrograma() {
  println(frame.getTitle());
  println ();
  println (" ********************************************************");
  println (" *                                                      *"); 
  println (" *  COMANDOS                                            *"); 
  println (" *  >> A = Activo Proyeccion                            *"); 
  println (" *  >> D = Desactivo Proyeccion                         *");
  println (" *  >> SPACE = Reinicia                                 *");

} 


void setup() {

  frameLocationX = frameLocationY = 0;

  size( 800, 600 );
  frameRate(FRAME_RATE);
  colonia = new OrganismoPG();
  infoPrograma();
  background(255);
}


void draw() {
  colonia.dibujo();
  image( colonia.getGrafico(), 0, 0, width, height );
}
//---------------------------- 
void keyPressed() {
  if ( key == 'a' || key == 'A') {
    swapScreenPosition();
    if ( hayProyector ) {



      nuevaVentana = new JFrame();
      nuevaVentana.setLocation(frameLocationX, frameLocationY);
      nuevaVentana.setUndecorated(true);

      ventana = new MiVentana();

      nuevaVentana.getContentPane().add(ventana, BorderLayout.CENTER);
      nuevaVentana.setVisible(true);
      ventana.render( colonia );

      ventana.init();

      nuevaVentana.setSize(anchoProyector, altoProyector);


      frame.toFront();
    }
    else {
      println("NO HAY PROYECTOR");
    }
  }
  else if (key == 'd' || key == 'D') {
    if ( hayProyector ) {
      nuevaVentana.setVisible(false); //you can't see me!
      // nuevaVentana.dispose(); //Destroy the JFrame object
    }
  }
  else if (key == ' ') {
    colonia = new OrganismoPG();
    ventana.render( colonia );

    ventana.init();
    background(255);
  }
}


void swapScreenPosition() {

  java.awt.GraphicsEnvironment ge = java.awt.GraphicsEnvironment.getLocalGraphicsEnvironment();
  java.awt.GraphicsDevice[] gs = ge.getScreenDevices();
  java.awt.GraphicsDevice gd = gs[gs.length-1];
  java.awt.GraphicsConfiguration[] gc = gd.getConfigurations();
  java.awt.Canvas c = new java.awt.Canvas(gc[0]); 
  java.awt.Rectangle gcBounds = gc[0].getBounds();



  if (gs.length < 2) { 
    frameLocationX = gcBounds.width-width;
    hayProyector = false;
  }
  else {
    frameLocationX = gcBounds.x;
    anchoProyector = gcBounds.width;
    altoProyector = gcBounds.height;
    //    println("Estamos iniciando en " + gcBounds.x + "x"+ gcBounds.y);
    //    println("Estamos iniciando en " + gcBounds.width + "x"+ gcBounds.height);
    hayProyector = true;
  }
}




//=================================================

