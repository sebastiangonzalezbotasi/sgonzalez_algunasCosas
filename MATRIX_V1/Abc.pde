class Abc {
  PFont fuente;
  String letterOrder =
    " .`-_':,;^=+/\"|)\\<>)iv%xclrs{*}I?!][1taeo7zjLu" +
    "nT#JCwfy325Fp6mqSghVd4EgXPGZbYkOA&8U$@KHDBWNMR0Q";
  char[] letters;

  int cantLetras;
  int cont;

  int posX, posY;

  Abc( int _posX, int _posY ) {
        posX = _posX;
    posY = _posY;

    fuente = loadFont("AppleSymbols-48.vlw");
    textFont(fuente, 25);
    letters = new char[256];  
    cont = int(random(letters.length));
    
    for (int i = 0; i < 256; i++) {
      int index = int(map(i, 0, 256, 0, letterOrder.length()));
      letters[i] = letterOrder.charAt(index);
    }
  }


  void draw() {
    if ( cont < 256 ) {
      text(letters[ cont ], posX, posY  );
      cont++;
    }
    else {
      cont = 0;
    }
  }
}

