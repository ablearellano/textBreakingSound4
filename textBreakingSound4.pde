//titulo:textBrakingSound4
//descripcion: sketch que mueve un texto en función de entrada de audio
//creado: 15 de mayo 2016


PFont f;
String message = "make click to shake it up";
String message2 = "hacer click para sacudir";
String message3 = "hacer click para sacudir2";
String message4 = "hacer click para sacudir3";
import processing.sound.*;

AudioIn input;
Amplitude rms;

int scale=1;

// An array of Letter objects
Letter[] letters,letters2,letters3,letters4;
//Letter2[] letters2;

void setup() {
  size(700, 600);

  // Load the font
  f = createFont("Arial", 20);
  textFont(f);

  // Create the array the same size as the String
   letters = new Letter[message.length()];
   letters2 = new Letter[message2.length()];
   letters3 = new Letter[message3.length()];
   letters4 = new Letter[message4.length()];
  ///parte de sonido/&////
  
   //Create an Audio input and grab the 1st channel
    input = new AudioIn(this, 0);
    
    // start the Audio Input
    input.start();
    
    // create a new Amplitude analyzer
    rms = new Amplitude(this);
    
    // Patch the input to an volume analyzer
    rms.input(input);
    
    /////////////////////////////////////////

  // Initialize Letters at the correct x location
  ////////TEXTO1
  
  int x = 10;
  for (int i = 0; i < message.length (); i ++ ) {
    // Letter objects are initialized with their location within the String as well as what character they should display.
    letters[i] = new Letter(x, 50, message.charAt(i)); 
    x += textWidth(message.charAt(i));
  }
   ////////TEXTO2
  int x2 = 50;
for (int j = 0; j< message2.length (); j ++ ) {
    // Letter objects are initialized with their location within the String as well as what character they should display.
    letters2[j] = new Letter(x2, 200, message2.charAt(j)); 
    x2 += textWidth(message2.charAt(j));
  }
   ////////TEXTO3
  int x3 = 50;
for (int i = 0; i < message3.length (); i ++ ) {
    // Letter objects are initialized with their location within the String as well as what character they should display.
    letters3[i] = new Letter(x3, 400, message3.charAt(i)); 
    x3 += textWidth(message3.charAt(i));
  }
   ////////TEXTO4
    int x4 = 50;
for (int i = 0; i < message4.length (); i ++ ) {
    // Letter objects are initialized with their location within the String as well as what character they should display.
    letters4[i] = new Letter(x4, 550, message4.charAt(i)); 
    x4 += textWidth(message4.charAt(i));
  }


}

void draw() {
  background(255);
  for (int i = 0; i < letters.length; i ++ ) {

    // Display all letters
    letters[i].display();

    // If the mouse is pressed the letters shake
    // If not, they return to their original location
     
    // adjust the volume of the audio input
    input.amp(map(mouseY, 0, height, 0.0, 1.0));
    
    // rms.analyze() return a value between 0 and 1. To adjust
    // the scaling and mapping of an ellipse we scale from 0 to 0.5
    scale=int(map(rms.analyze(), 0, 0.5, 1, 350));
    noStroke();
    
    
    if (scale > 1.0) { //parametro de calibracion
      letters[i].shake();
    } else {
      letters[i].home();
    }
  }
  
for (int i = 0; i < letters2.length; i ++ ) {

    // Display all letters
    letters2[i].display();
      
    // adjust the volume of the audio input
    input.amp(map(mouseY, 0, height, 0.0, 1.0));
    
    // rms.analyze() return a value between 0 and 1. To adjust
    // the scaling and mapping of an ellipse we scale from 0 to 0.5
    scale=int(map(rms.analyze(), 0, 0.5, 1, 350));
    noStroke();
    
    
    if (scale > 1.1) { //parametro de calibracion
      letters2[i].shake();
    } else {
      letters2[i].home();
    }
}


for (int i = 0; i < letters3.length; i ++ ) {

    // Display all letters
    letters3[i].display();
      
    // adjust the volume of the audio input
    input.amp(map(mouseY, 0, height, 0.0, 1.0));
    
    // rms.analyze() return a value between 0 and 1. To adjust
    // the scaling and mapping of an ellipse we scale from 0 to 0.5
    scale=int(map(rms.analyze(), 0, 0.5, 1, 350));
    noStroke();
    
    
    if (scale > 1.1) { //parametro de calibracion
      letters3[i].shake();
    } else {
      letters3[i].home();
    }
}

for (int i = 0; i < letters4.length; i ++ ) {

    // Display all letters
    letters4[i].display();
      
    // adjust the volume of the audio input
    input.amp(map(mouseY, 0, height, 0.0, 1.0));
    
    // rms.analyze() return a value between 0 and 1. To adjust
    // the scaling and mapping of an ellipse we scale from 0 to 0.5
    scale=int(map(rms.analyze(), 0, 0.5, 1, 350));
    noStroke();
    
    
    if (scale > 1.2) { //parametro de calibracion
      letters4[i].shake();
    } else {
      letters4[i].home();
    }
}



}