import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variable
Minim minim;
  AudioPlayer song1;
  color white = #FFFFFF ;


void setup() {
  size(500, 600) ;
  minim = new Minim(this);
  song1 = minim.loadFile("Robots_a_Cometh.mp3");
  
  
  }
  
  
  
void draw() {
  
  
  
} 



void keyPressed() {
  if (key == 'p' || key == 'P') {
  song1.play();
  }
 
  
  
}



void mousePressed() {
  
  
    
}
