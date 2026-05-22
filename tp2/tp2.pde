PImage portada, historia, allie, noah, sara, james, finalImg;
PFont fuente;

int pantalla = 0;
int tiempo= 0;
float transparencia = 0;
float moverTexto = -50;

void setup() {
  size(640, 480);
  
  // carga
  
  portada = loadImage("Portada.jpeg");
  historia = loadImage("Historia.jpeg");
  allie = loadImage("Allie.jpeg");
  noah = loadImage("Noha.jpeg");
  sara = loadImage("Sara.jpeg");
  james = loadImage("James.jpeg");
  finalImg = loadImage("Final.jpeg");
 
 fuente = loadFont("Arial-BoldMT-20.vlw");
}

void draw() {

  background(220, 240, 235);

  // Pant 1
  if (pantalla == 0) {

    image(portada, 0, 0, width, height);

    fill(173, 216, 230);
    ellipse(80, 420, 100, 50);

    fill(255);
    textSize(22);
    text("PLAY", 57, 423);
  }

  // Pant 2
  else{ 
    cambioAutomatico();
    
    if (pantalla == 1) {
    rect(0,0, 320,240);
    image(historia, 0, 0, width, height);

    if (transparencia < 255) {
    transparencia += 2;
     }
     
    fill(0, 150);
    rect(0, 0, width/2, height);
    fill(255, transparencia);

    textSize(14);

    text(
      "La historia de Noah y Allie comienza\n" +
      "en un verano de 1940 en un parque\n" +
      "de diversiones, donde se enamoran\n" +
      "apasionadamente.\n\n" +

      "A lo largo de los años, separados\n" +
      "por las diferencias sociales,\n" +
      "Noah nunca deja de escribirle cartas.\n" +
      "Con cada carta, le promete devolverle\n" +
      "sus sueños y construir la casa\n" +
      "que imaginaron juntos.\n\n" +

      "Años después, Allie está a punto\n" +
      "de casarse con otro hombre,\n" +
      "mientras Noah nunca deja de amarla.\n\n" +

      "El final muestra a Allie en un asilo,\n" +
      "donde Noah le lee cada día\n" +
      "las cartas de su diario,\n" +
      "reviviendo su historia de amor.",
      20,
      50
    );
  }

  // Pant 3
  else{
    if (pantalla == 2) {

    image(allie, 0, 0, width, height);

     if (moverTexto < 0) {
    moverTexto += 0.5;
  }
    fill(0, 150);
    rect(0, 0, width/2, height/2);
    fill(255);

    textSize(16);
    text(
      "Allie Hamilton:\n\n" +
      "Proviene de una familia adinerada\n" +
      "y estricta. Es creativa,\n" +
      "independiente y ama la pintura,\n" +
      "aunque se siente atrapada\n" +
      "por las expectativas familiares.\n\n" +
      "Es cálida y empática,\n" +
      "pero también insegura,\n" +
      "porque debe equilibrar\n" +
      "sus deseos personales\n" +
      "con lo que esperan de ella.",
      25,
      moverTexto
    );

  }

  // Pant 4
  else{ 
    if (pantalla == 3) {

    image(noah, 0, 0, width, height);

        if (transparencia < 255) {
    transparencia += 2;
  }
     if (moverTexto < 10) {
    moverTexto += 0.5;
  }
    fill(255, transparencia);

    textSize(16);

    text(
      "Noah Calhoun:\n\n" +
      "Es un joven soñador y creativo,\n" +
      "de clase baja, criado por\n" +
      "su padre viudo en un pequeño pueblo.\n\n" +

      "Es trabajador y apasionado.\n" +
      "Ama la construcción y la pintura.\n\n" +

      "Aunque tiene limitaciones económicas,\n" +
      "siempre sueña con una vida mejor\n" +
      "y nunca deja de luchar\n" +
      "por el amor de Allie.",
      moverTexto,
     60
    );

  }

  // Pant 5
  else{
    if (pantalla == 4) {

    background(210, 235, 225);

    image(sara, 0, 80, 200, 300);
    image(james, 440, 80, 200, 300);
    fill(0);
    rect(200, 106, 240, 213);
   if (transparencia < 255) {
    transparencia += 2;
  }
    fill(255, transparencia);

    textSize(15);

    text(
      "Después de separarse,\n" +
      "Allie comienza una relación con Lon,\n" +
      "un hombre estable y exitoso.\n\n" +

      "Noah, por otro lado,\n" +
      "también conoce a Sara,\n" +
      "quien lo apoya y acompaña.\n\n" +

      "Sin embargo,\n" +
      "el amor entre Noah y Allie\n" +
      "nunca desaparece.",
      210,
      120
    );

  }

  // PANTALLA 6 - FINAL
  else if (pantalla == 5) {

    image(finalImg, 0, 0, width, height);

    fill(107, 142, 35);

    rect(255, 395, 140, 50, 15);

    fill(255);

    textSize(24);

    text("Reinicio", 289, 429);
  }
}
}
}
}
}

// Func. cambio automatico
void cambioAutomatico() {
  tiempo++; 
  if (tiempo > 600) {

    pantalla++;

    tiempo = 0;

    transparencia = 0;
    moverTexto = -50;
  }
}

// Click mouse
void mousePressed() {

  // play
  if (pantalla == 0) {

    float distancia = dist(mouseX, mouseY, 80, 420);

    if (distancia < 50) {

      pantalla = 1;

    }
  }

  // Reset
  else{
    if (pantalla == 5) {

    if (
      mouseX > 250 &&
      mouseX < 390 &&
      mouseY > 395 &&
      mouseY < 445
      ) {

      pantalla = 0;

      transparencia = 0;
      moverTexto = -50;
    }
  }
}
}

// ayuda
void mouseClicked() {
  println(mouseX + ", " + mouseY);
}
