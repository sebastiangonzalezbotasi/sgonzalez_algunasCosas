/*
Author: Sebastian G. Botasi <sgonzalez@bionimio.com.ar>
Date: 2011
Description: Application that incorporates object that generates the type transitions fade-in fade-out.
*/
class Transition {
  //Atributos
  float x, y;
  float ancho, alto;
  float alpha_, alphaFinal;
  color r, g, b;
  String tipoFade;
  int velocidad;

  //-------------------------------------

  //Constructor
  Transition() {
    x = 0;
    y = 0;
    ancho = width;
    alto = height;
  }

  //-------------------------------------

  void setMode(String tipoFade_) {
    tipoFade = tipoFade_;
    if (tipoFade == "fadeIn") {
           alpha_ = 255;
 
    }
    else if (tipoFade == "fadeOut") {
           alpha_ = 0;
 
    }
  }

  //-------------------------------------

  void setColor( color r_, color g_, color b_ ) {
    r = r_;
    g = g_;
    b = b_;
  }

  //-------------------------------------

  void setVelocity( int velocity_ ) {
    velocidad = velocity_;
  }


  //-------------------------------------
  void reset() {
    setMode( tipoFade );
    estado = ESPERA;
  }
  //-------------------------------------


  void start() {
    if (tipoFade == "fadeIn") {
      alphaFinal = fadeIn();
    }
    else if (tipoFade == "fadeOut") {
      alphaFinal = fadeOut();
    }
    pushMatrix();
    translate(x, y);
    noStroke();

    fill(r, g, b, alphaFinal);
    rect(0, 0, ancho, alto);
    popMatrix();
  }


  //-------------------------------------
  boolean isEnd() {
    boolean end = false;
    if (tipoFade == "fadeIn") {
      end = (alpha_ == 0);
    }
    else if (tipoFade == "fadeOut") {
      end = (alpha_ == 255);
    }
    return end;
  }

  //-------------------------------------


  float fadeOut() {

    if (alpha_ < 255) {
      alpha_+= velocidad;
      if (alpha_ >= 255) {
        alpha_ = 255;
      }
    }
    return alpha_;
  }

  //-------------------------------------

  float fadeIn() {
    if (alpha_ > 0) {
      alpha_-= velocidad;
      if (alpha_ <= 0) {
        alpha_ = 0;
      }
    }
    return alpha_;
  }

  //-------------------------------------
}

