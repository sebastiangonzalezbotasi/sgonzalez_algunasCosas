/*
Author: Sebastian G. Botasi <sgonzalez@bionimio.com.ar>
Date: 2011
Description: Application that explores the possibility of a Processing application in a window and if there is a projector or other monitor connected replicate such an image. This is the first test will be developed soon more evolved versions.
*/
public class MiVentana extends PApplet {
  public PApplet ventana;
  OrganismoPG render;

  void render( OrganismoPG _render) {
    render = _render;
  }

  public void setup() {
    frameRate(FRAME_RATE);
  }


  public void draw() {
    
    if (hayProyector && nuevaVentana.isVisible() ) {
      render.dibujo();
      image( render.getGrafico(), 0, 0, width, height );
    }
  }
  
  void limpiar(){
      background(255);
  
  }
}

