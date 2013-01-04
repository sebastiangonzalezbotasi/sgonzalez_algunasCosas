Matrix matrix;

int ancho = 400; 
int alto = 400;

int rows = ancho/4;
int col = alto/4;
int cantMatrix = rows + col;



void setup() {
  size(ancho, alto);

  matrix = new Matrix( 20, 20);

  frameRate(24);

  background(0);
}

void draw() {

  background(0);

  matrix.draw();
}

