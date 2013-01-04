class Circulo {
  int x, y, radio;
  color relleno;
  int id;
  boolean ingreso;

  Circulo(int id_, int x_, int y_, int radio_ ) {
    x = x_;
    y = y_;
    radio = radio_;
    relleno = color(random(255), random(255), random(255), 130);
    ellipseMode(CENTER);
    id = id_;
    ingreso = false;
  }

  void dibujo() {
    pushMatrix();
    stroke(0);
    fill(relleno);
    ellipse(x, y, radio, radio);
    popMatrix();
  }
  void imprimir() {
    fill(0);
    text("Dedo[id="+id+"] || Pixeles( x="+x+" | y="+y+" ) \nEstadoRegion= " + mensajeIngreso(), width/2 + 10, 130, 400, 400);
  }
  
  String mensajeIngreso(){
    return (ingreso == true) ? "Activada" : "Desactivada";
  }
  
}

//==============================================


