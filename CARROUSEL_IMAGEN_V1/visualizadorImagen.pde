
class visualizadorImagen {
  //Atributos
  PImage[] img;
  int cantImg;
  int posX,posY,posXini;
  int rotacion;
  float movimientoInicial,movimientoFinal,velocidad;
  String iniNombre,formato;
  int ancho,alto;
  int separacion, incremento;
  int tamanoContenedor;

  //Costructor
  visualizadorImagen(int posX_, int posY_, int ancho_, int alto_,int cantImg_) {
    ancho = ancho_;
    alto = alto_;
    posX = posX_;
    posY = posY_;
    cantImg = cantImg_;
    posXini = posX_;
  }

  //Metodos
  void cargarImagen(String iniNombre_,String formato_) {
    iniNombre = iniNombre_;
    formato = formato_;
    img = new PImage[cantImg];
    for(int i=1; i<cantImg;i++) {
      String nombre;
      nombre = iniNombre + i +formato;
      img[i] = loadImage(nombre);
      img[i].resize(ancho,alto);
    }
  }

  void paginar(int separacion_) {
    separacion = separacion_;
    incremento = 0;
    for(int i=1;i<cantImg;i++) {
      image(img[i],posX+incremento,posY);
      incremento = incremento + ancho + separacion;
    }
  }
  void dibujar() {
    int tamano = tamanoContenedor();
    fill(255,255,255,50);
    rect(posX-separacion,posY-separacion,tamano,alto+separacion*2);
  }

  void mover(float movimientoInicial_,float velocidad_) {
    movimientoInicial = movimientoInicial_;
    velocidad = velocidad_;

    int tamano = tamanoContenedor();
    int  mapeo = int(map(movimientoInicial,0,width,0,5));
    //println("Mapeo: " + mapeo);
    int final_ = width - ((tamano)+(posXini));
  
    if(mapeo<=2 && mapeo >= 0) {
      posX += velocidad;
      if(posX >= posXini) {
        posX = posXini;
      }
    }
    else if(mapeo>=2 && mapeo<=3) {
      posX = posX;
    }
    else if(mapeo<=4 && mapeo >= 0) {
      posX -=velocidad;
      if(posX <= final_) {
        posX = final_;
      }
    }

  }

  int tamanoContenedor() {
    int resultado;
    resultado = (ancho*cantImg) + (separacion*cantImg+10);
    return resultado;
  }
}

