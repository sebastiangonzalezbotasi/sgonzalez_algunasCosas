//------------------------------------------------------------------------------------------------------------
// Organismo - Organismo - Organismo - Organismo - Organismo - Organismo - Organismo - Organismo - Organismo - 
//------------------------------------------------------------------------------------------------------------
//
//  Emiliano Causa 2007
//  e_causa@yahoo.com.ar
//  www.emiliano-causa.com.ar
//  www.biopus.com.ar
//
class Organismo {


  float x, y; //posicion del organismo
  float direccion; //dirección en la que avanza
  float velocidad; //velocidad a la que avanza
  float dx, dy;  //desplazamiento en x e y deducido de la dirección y velocidad.
  boolean toroidal;

  //----------------------------  

  Organismo(  float x_, float y_ ) { //inicializa el organismo
    iniciar( x_, y_ );
  }
  //----------------------------  

  Organismo( ) { //inicializa el organismo
    iniciar( random(width), random(height) ); //si no recibe parametros inicia con x e y al azar
  }
  //----------------------------  

  void iniciar( float x_, float y_ ) {  //inicialización del organismo


    x = x_;
    y = y_;
    direccion = random(TWO_PI); //inicia con una dirección al azar
    velocidad = 5;  //inicia la velocidad en 5 pixels por fotograma
    toroidal = true; //esta variable activa el espacio toroidal
  }
  //----------------------------  

  void mover() {  //actualiza la ubicación del organismo
    variarAngulo( 30 );  //caria la direccion en un rango de 30 grados para cada lado
    dx = velocidad * cos(direccion);  //deduce el desplazamiento en X
    dy = velocidad * sin(direccion);  //deduce el desplazamiento en Y
    x += dx; //aplica los desplazamiento
    y += dy; //aplica los desplazamiento

    if ( toroidal ) { //si el espacio es toroidal entonces revisa si se pasó de límite
      x = ( x>width ? x-width : x );
      x = ( x<0 ? x+width : x );      
      y = ( y>height ? y-height : y );
      y = ( y<0 ? y+height : y );
    }
  }
  //----------------------------  

  void dibujar() {  //dibuja el organismo
    pushMatrix();
    translate(x, y);
    rotate(direccion);
    rect(0, 0, 10, 10);
    popMatrix();

  }
  //----------------------------  

  void variarAngulo( float amplitud ) {  //varia la dirección con una amplitud determinada
    float radi = radians( amplitud ); //transforma los grados en radianes
    direccion += random( -radi, radi ); //aplica un valor al azar dentro del rango
  }
}

