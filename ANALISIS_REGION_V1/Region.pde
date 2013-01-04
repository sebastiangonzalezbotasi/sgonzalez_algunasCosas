class Region {

  int x, y;
  int ancho, alto;
  int margen = 20;
  int radio = 10;
  color relleno = color(255);

  Region( int x_, int y_, int ancho_, int alto_ ) {
    x = x_;
    y = y_;
    ancho = ancho_;
    alto = alto_;
  }

  void draw() {
    fill( 0 );

    text( "x1 , y1", esquinaSuperiorX() + 5, esquinaSuperiorY() - 5);

    text( "x2 , y2", esquinaInferiorX() - 45, esquinaInferiorY() + 15);

    stroke(0);
    fill( 255 );

    //arribaIzq
    line( x, y, x - margen, y  );
    line( x, y, x, y- margen  );

    //arribaDer
    line( x + ancho, y, x + ancho + margen, y  );
    line( x + ancho, y, x + ancho, y - margen  );

    //abajoIzq
    line( x, y + alto, x - margen, y + alto );
    line( x, y + alto, x, y + margen + alto );

    //abajoDer
    line( x + ancho, y + alto, x + ancho + margen, y + alto  );
    line( x + ancho, y + alto, x + ancho, y + alto + margen );
    fill(relleno);
    rect(x, y, ancho, alto);

    stroke(255, 0, 0);
    fill(255);
    ellipse(esquinaSuperiorX(), esquinaSuperiorY(), radio, radio);
    ellipse(esquinaInferiorX(), esquinaInferiorY(), radio, radio);
  }

  void activa() {
    relleno = color(21, 215, 234);
  }
  void desactiva() {
    relleno = color(255);  
  }

  void consola() {
    println( "esquinaSuperiorX= " + esquinaSuperiorX() + " esquinaSuperiorY= " + esquinaSuperiorY() );
    println( "esquinaInferiorX= " + esquinaInferiorX() +  " esquinaInferiorY= " + esquinaInferiorY()  );
  }

  void imprimir() {
    fill(0);
    text("x1= " + esquinaSuperiorX(), width/2 + 10, 10, 400, 400);
    text("y1= " + esquinaSuperiorY(), width/2 + 10, 30, 400, 400);
    text("x2= " + esquinaInferiorX(), width/2 + 10, 50, 400, 400);
    text("y2= " + esquinaInferiorY(), width/2 + 10, 70, 400, 400);
    text("ancho= " + (ancho), width/2 + 10, 90, 400, 400);
    text("alto= " + (alto), width/2 + 10, 110, 400, 400);
  }



  int esquinaSuperiorX() {
    return  x;
  }

  int esquinaSuperiorY() {
    return  y;
  }


  int esquinaInferiorX() {
    return  ( x + ancho );
  }

  int esquinaInferiorY() {
    return  ( y + alto );
  }
}

