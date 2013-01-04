class Matrix {

  Abc[][] abc; 

  int rows, cols;

    Matrix( int _rows, int _cols ) {
    rows = _rows;
    cols = _cols;
    init( rows, cols );
  }

  void init( int _rows, int _cols ) {
    abc = new Abc[ _rows ][ _cols ];
    for (int i=0;i<cols;i++) {
      for (int j=0;j<rows;j++) {
        abc[i][j] = new Abc( i * (width/rows) + 10, j * (height/cols) + 20 );
      }
    }
  }

  void draw() {
    int transparencia = 300;
    for (int i=0;i<cols;i++) {
      for (int j=0;j<rows;j++) {
        transparencia -= 10;
        fill(0, 255, 0,transparencia);

        abc[i][j].draw();
      }
      transparencia = 300;
    }
  }
  
}

