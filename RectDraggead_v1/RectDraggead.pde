/*
Author: Sebastian G. Botasi <sgonzalez@bionimio.com.ar>
Date: 2011
Description: The application implements an object that allows you to create rectangles and be moved with the mouse. 
Supports events being pushed, moved and return to their resting state.
*/

//*****************************************************************************************
//FUNCIONES GENERALES PARA EL FUNCIONAMIENTO EL APPLET
//*****************************************************************************************

void initRectDraggead() {
  int posX,posY;
  color FillAndStroke;

  r = new RectDraggead[countRectDraggead];

  for(int i=0; i<countRectDraggead;i++) {

    if(  countRectDraggead == 1 ) {
      posX = width/2;
      posY = height/2;
      FillAndStroke = color( 7, 179, 245 );
    }
    else {
      posX = (int)random(width);
      posY = (int)random(height);
      FillAndStroke = color( random(0,255), random(0,255), random(0,255) );
    }  

    r[i] = new RectDraggead();
    r[i].setPosition( posX, posY );
    r[i].setSize( 100,100 );
    r[i].setFillAndStroke( FillAndStroke );
    r[i].setAlphaFill( 60 );
  }
}

void drawRectDraggead() {
  for(int i=0; i<countRectDraggead;i++) {

    if( r[i].isColition(mouseX,mouseY) ) {
      r[i].setState( true );
      r[i].setAlphaFill( 70 );
    }
    else {
      r[i].setAlphaFill( 60 );
      r[i].setState( false );
    }
    r[i].draw();
  }
}

void dragRectDraggead() {
  for(int i=0; i<countRectDraggead;i++) {
    if( r[i].getState() ) {
      r[i].move( mouseX,mouseY );
    }
  }
}

//*****************************************************************************************
//CLASS RectDraggead - CLASS RectDraggead - CLASS RectDraggead - CLASS RectDraggead - 
//*****************************************************************************************

class RectDraggead {

  int w,h;
  int x,y;
  int _alpha = 60;
  int tolerance = 20;
  boolean state = false;
  color FillAndStroke;

  RectDraggead() {
  }

  void move( int _x, int _y ) {
    x = _x;
    y = _y;
  }

  void draw() {
    rectMode( CENTER );
    stroke( FillAndStroke );
    fill( FillAndStroke, _alpha );
    rect( x,y,w,h );
  }





  //GETTERS AND SETTERS
  boolean isColition( int _mX, int _mY ) {
    boolean state = false;
    if( dist( _mX, _mY, x, y ) < tolerance ) {
      state = true;
    }
    return state;
  }


  void setFillAndStroke( color _FillAndStroke ) {
    FillAndStroke = _FillAndStroke;
  }

  void setAlphaFill( int alpha_) {
    _alpha = alpha_;
  }

  void setState( boolean _state ) {
    state = _state;
  }

  void setSize( int _w, int _h ) {
    w = _w;
    h = _h;
  }

  void setPosition( int _x, int _y ) {
    x = _x;
    y = _y;
  }

  int getW() {
    return w;
  }

  int getH() {
    return h;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  boolean getState() {
    return state;
  }
} 

