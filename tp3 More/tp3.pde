int columnas = 6;
int filas = 6;
float x, y;
float tamanoCuadrado; 
float subCuadrado;
float anchoRect1;
float altoRect1;
float anchoRect2;
float altoRect2;

float rotacion;
boolean rotarConMouse = true; 

color col1 = 0;
color col2 = 255;

PImage img;

void setup() {
  size(800, 400);  
  img = loadImage("30.jpg");
  noStroke();
}

void draw() {
  background(150);// si no el codigo genera muchos cuadrados al mismo tiempo
  image(img, 0 , 0, width/2, height);
  if (rotarConMouse == true) {
    rotacion = radians(mouseX); 
  } else {
    rotacion = 0; 
  }
  

  dibujar(400);
  

}

// funcion con parametro que no retorna valor
void dibujar(int inicioX) {
  tamanoCuadrado = 400.0f / columnas; 
  
  // Ciclo for anidado
  for (int fila = 0; fila < filas; fila++) {
    for (int col = 0; col < columnas; col++) {
      
      x = inicioX + (col * tamanoCuadrado);
      y = fila * tamanoCuadrado;
      
      // Rotate y translate
      pushMatrix(); 
      translate(x + tamanoCuadrado / 2, y + tamanoCuadrado / 2);
      rotate(rotacion);
      
      if ((fila + col) % 2 == 0) {
        fill(col1); 
      } else {
        fill(col2); 
      }
      
      rect(-tamanoCuadrado / 2, -tamanoCuadrado / 2, tamanoCuadrado, tamanoCuadrado);
      
      // Sub cuadrados 
      if ((fila + col) % 2 == 0 && fila % 2 != 0){
        fill(col2);
        rect(-tamanoCuadrado / 2, -tamanoCuadrado / 2, tamanoCuadrado / 4, tamanoCuadrado / 4);
      }
      
      if ((fila + col) % 2 == 0 && fila % 2 == 0){
        fill(col2);
        subCuadrado = tamanoCuadrado / 2;
        rect(tamanoCuadrado / 2 - subCuadrado, tamanoCuadrado / 2 - subCuadrado, subCuadrado, subCuadrado);
      }
      
      if ((fila + col) % 2 != 0 && fila % 2 != 0){
        fill(col1); 
        anchoRect1 = tamanoCuadrado / 2 + 5; 
        altoRect1 = tamanoCuadrado / 4;  
        rect(-tamanoCuadrado / 2 + 35, -tamanoCuadrado / 2, anchoRect1, altoRect1);
      }
      
      if ((fila + col) % 2 != 0 && fila % 2 == 0) {
        fill(col1); 
        anchoRect2 = tamanoCuadrado / 4;
        altoRect2 = tamanoCuadrado / 2;
        rect(-tamanoCuadrado / 2, tamanoCuadrado / 2 - altoRect2, anchoRect2, altoRect2);
      }
      
      popMatrix();
    }
  }
} 

//funcion que retorna calor
color generarColor(color cBase) {

  float r = random(255);
  float g = random(255);
  float b = random(255);
  
  return color(r,g,b);
}


void mousePressed() {
 
  if (mouseX > 400) {
    col1 = generarColor(col1);
    col2 = generarColor(col2);
    rotarConMouse = true; 
  }
}

//evento teclado

void keyPressed(){
  if (key == 'r'){
    rotarConMouse = false; 
    rotacion = 0;          
    col1 = color(0);       
    col2 = color(255);    
  }
}
