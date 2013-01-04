PFont fuente;

int ancho = 800;
int alto = 600;

String frase = "Processing";
float[] tamaniosLetras; 
int cont;
int velocidad;

void setup() {
  size(ancho,alto,P3D);
  //frameRate(30);
  cargarFuentes();
  tamaniosLetras = procesaTamanios(frase);
  velocidad = 5;
  colorMode(HSB,300);
  background(300);
  rectMode(CENTER);
}

void draw() {
  fill(300,60);
  noStroke(); 
  rect(width/2,height/2,width,height);
  cont += velocidad;
  posiciona(100);
}


float[] procesaTamanios(String frase_) {
  int cantLetras = frase_.length();
  float[] tamanios = new float[cantLetras];
  for(int i=0;i<cantLetras;i++) {
    tamanios[i] = textWidth(frase_.charAt(i));
  }
  return tamanios;
}

void posiciona(int posX_) {
  int posX_Comienzo = posX_;
  for(int i=1;i<=frase.length();i++) {
    texto(str(frase.charAt(i-1)),posX_Comienzo,height/2,0,20 * (i-1) + cont,mouseX);
    posX_Comienzo += tamaniosLetras[i-1];
  }
}


void cargarFuentes() {
  fuente = loadFont("fuente/Arial-Black-98.vlw");
  textFont(fuente,98);
}


void texto(String letra_,float x_, float y_, float z_, float rotacionX_, float rotacionY_) {
  pushMatrix();
  fill(200,300,300,50);
  translate(x_,y_,z_);
  rotateX(radians(rotacionX_));
  rotateY(radians(rotacionY_));
  text(letra_,0,0,0);
  popMatrix();
}

