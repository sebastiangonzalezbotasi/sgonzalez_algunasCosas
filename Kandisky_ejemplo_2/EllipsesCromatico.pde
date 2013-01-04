/*
Author: Sebastian G. Botasi <sgonzalez@bionimio.com.ar>
Date: 2011
Description: Prototype with aesthetic artworks Kandinsky.
Object Creation chromatic circles for configuring colors and creates concentrically.

*/
class EllipsesCromatico {
  PGraphics imagen; 
  int anchoLienzo,altoLienzo;  
 
  float x, y;
  float radio;
  float rot;
  int[] aleatorio;
  int indice;
  boolean trans,stroke_;
  int pasosTotal;
  int transparencia;
  color[] rellenos = {
    #7b547d, #eec047, #71b1b9, #b81a02, #a4ad81, #3480a5, #eab78b, #201a22, #fef3f3, #d07251, #f8c04a, #dbab47
  };


  EllipsesCromatico() {
    iniciar( random(width), random(height));
    
  }

  //------------------

  void iniciar( float _x, float _y) {
    x = _x;
    y = _y;
    rot = random( -60, 60 );
    aleatorio = aleatoriosSinRepetir( rellenos.length  );
    indice =0;
    radio = random( 100, 250 );
    pasosTotal = int(random( 0, 3 ));
    transparencia = int(random(120,170));
  }
  //-------------------
  void setTranslate( boolean _trans ) {
    trans = _trans;
  }
  //-------------------
  void setStroke( boolean _stroke ) {
    stroke_ = _stroke;
  }
  
  
  //-------------------
  void draw() {
    pushMatrix();

    translate ( x, y );

    circulo( 0, pasosTotal,radio, rot, indice, trans , stroke_);

    popMatrix();
  }

  //-------------------


  void circulo( int pasos,int _pasosTotal, float radio, float _rot, int _indice, boolean _translada, boolean _stroke ) {
    if( _stroke ){
      stroke (0 , transparencia);
      strokeWeight (2);
    }else{
      noStroke();
    }
    fill ( rellenos[ aleatorio[ _indice ]] , transparencia );
    ellipse (0, 0, radio, radio); 
    if (pasos < _pasosTotal ) {
      if ( _translada ) {
        translate (20, 0);
        rotate (radians( _rot ));
      }
      circulo ( pasos+1, _pasosTotal ,radio/2, _rot, _indice + 1, _translada, _stroke);
    }
  }

  //--------------------------------

  int[] aleatoriosSinRepetir(int cantidad_) {
    int[] myArray = new int[cantidad_];
    for (int i = 0; i < cantidad_; ++i) {
      int num = 0;
      boolean isUnique = false;
      while (!isUnique) {
        num = int(random(cantidad_));
        isUnique = true;
        for (int j = 0; j < i; ++j) {
          if (num==myArray[j]) {
            isUnique = false;
          }
        }
      }
      myArray[i] = num;
    }

    return myArray;
  }
}



