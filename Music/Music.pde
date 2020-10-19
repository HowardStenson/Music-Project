import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variable
Minim minim;
int numberofSongs = 2 ;
  AudioPlayer[] song = new AudioPlayer[numberofSongs];
  color white = #FFFFFF ;


void setup() {
  size(500, 600) ;
  minim = new Minim(this);
  song[0] = minim.loadFile("Robots_a_Cometh.mp3") ;
  song[1] = minim.loadFile("Death_Impact_Yell_Single.mp3") ;
  song[2] = minim.loadFile("Spring Thaw - Asher Fulero.mp3") ;
  song[3] = minim.loadFile("Cover - Patrick Patrikios.mp3") ;
  song[4] = minim.loadFile("Cold Water - Patrick Patrikios.mp3") ;
  }
  
  
  
void draw() {
 // if () {} else if () {}
 // song1.isPlaying() ;
  //  song1.position() ;
   //   song1.length() ;
    //   song1.play() ;
    //     song1.pause() ; 
      //      song1.rewind() ;
          
  
  
} 



void keyPressed() {
  if (key == 'p' || key == 'P') {
   if ( song[0].isPlaying() ) {
        song[0].pause() ;
   } else if ( song[0].position() == song[0].length()) {
      song[0].rewind() ;
      song[0].play() ;
   } else {
          song[0].play();}
  }
if (key == 's' || key == 'S') {
if ( song[0].isPlaying() ) {
     song[0].rewind() ;
     song[0].pause() ;
         } else {
     song[0].rewind() ;
 }
}
}



void mousePressed() {
  
  
    
}
