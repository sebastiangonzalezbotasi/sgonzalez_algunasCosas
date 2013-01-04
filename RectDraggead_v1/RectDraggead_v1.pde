/*
Author: Sebastian G. Botasi <sgonzalez@bionimio.com.ar>
Date: 2011
Description: The application implements an object that allows you to create rectangles and be moved with the mouse. 
Supports events being pushed, moved and return to their resting state.
*/

RectDraggead r[];
int countRectDraggead = 8; //cantidad de cuadrados para dibujar valor min 1 maximo X

int w = 800;
int h = 600;

int _background = 0;

void setup() {
  size(w, h);
  background( _background );

  initRectDraggead(); //funcion que los inicia segun si hay uno o varios (vew tab RectDraggead)
}

void draw() {
  background(0);
  drawRectDraggead(); //funcion que los actualiza y analiza si son tocados o no (vew tab RectDraggead)
}

void mouseDragged() {
  dragRectDraggead(); //funcion que los mueve si son arrastrados (vew tab RectDraggead)
}











