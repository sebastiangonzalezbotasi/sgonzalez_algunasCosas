class EllipsesCromatico {

  float x, y;
  float radio;
  color r1, r2, r3;
  int[] aleatorio;
  int dividendo;
  boolean transladar;
  float valor;

  color[] rellenos = {
    #7b547d, #eec047, #71b1b9, #b81a02, #a4ad81, #3480a5, #eab78b, #201a22, #fef3f3, #d07251, #f8c04a, #dbab47
  };


  EllipsesCromatico() {
    iniciar( random(width), random(height) );
  }

  void iniciar( float _x, float _y ) {

    x = _x;
    y = _y;

    aleatorio = aleatoriosSinRepetir( rellenos.length  );
    dividendo = 1;

    r1 = rellenos[ aleatorio[0] ];
    r2 = rellenos[ aleatorio[1] ];
    r3 = rellenos[ aleatorio[2] ];

    radio = random( 100, 250 );
  }

  void transladar( boolean _transladar ) {

    if ( _transladar ) {
      valor = random( -30, 30);
    }
  }

  void draw() {
    pushMatrix();
    translate( x, y );

    stroke( 0 );
    fill( r1 );
    ellipse( 0, 0, radio, radio);



    translate( valor, -valor );

    stroke( 0 );
    fill( r2 );
    ellipse( 0, 0, radio/2, radio/2);

    translate( -valor, valor );

    stroke( 0 );
    fill( r3 );
    ellipse( 0, 0, radio/4, radio/4);

    popMatrix();
  }






  //funciones
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

