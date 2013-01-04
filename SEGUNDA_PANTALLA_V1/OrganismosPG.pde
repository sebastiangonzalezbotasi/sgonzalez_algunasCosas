/*
Author: Sebastian G. Botasi <sgonzalez@bionimio.com.ar>
Date: 2011
Description: Application that explores the possibility of a Processing application in a window and if there is a projector or other monitor connected replicate such an image. This is the first test will be developed soon more evolved versions.
*/
class OrganismoPG {

  PGraphics grafico;
  Organismo[] animales; 
  int cantAnimales; 

  OrganismoPG() {
    cantAnimales = 30;
    grafico = createGraphics( width, height, P2D );
    iniciar();
  }


  //---------------------------- 
  void iniciar() {

    animales = new Organismo[cantAnimales];  
    for (int i=0;i<cantAnimales;i++) {   
      animales[i] = new Organismo();
    }
  }

  void dibujo() {

    
    grafico.beginDraw();

  

   grafico.rectMode(CENTER);
    grafico.stroke(0, 168, 255);
    grafico.fill(0, 168, 255, 60);


    for (int i=0;i<cantAnimales;i++) { 
      animales[i].mover();
      grafico.pushMatrix();
      grafico.translate(animales[i].x, animales[i].y);
      grafico.rotate(animales[i].direccion);
      grafico.rect(0, 0, 15, 15);
      grafico.popMatrix();
    }





    grafico.endDraw();
  }


  PImage getGrafico() {
    return grafico;
  }
}

