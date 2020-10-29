import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variable
Minim minim;
int numberofSongs = 5 ;
AudioPlayer[] song = new AudioPlayer[numberofSongs];

color white = #FFFFFF ;
color black = #030303;
color blue = #FFF985 ;
AudioMetaData[] songMetaData = new AudioMetaData[numberofSongs];
//
String Soong = "MusicPlayer" ;
String Plaay =  "Play" ;
String Neext = "Next" ;
String Baack = "Back" ;
String Foorward = "Forward" ;
String Reewind = "Rewind" ;
String Looop = "Loop" ;
PFont Song ;
PFont Play;
PFont Next ;
PFont Back ;
PFont Forward ;
PFont Rewind ;
PFont Loop ;

int currentSong=  0 ;
int loopNum = 1 ;
float playButtonX, playButtonY, playButtonWidth, playButtonHeight ;
int stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight ;
int rewindButtonX, rewindButtonY, rewindButtonWidth, rewindButtonHeight ;
int forwardButtonX, forwardButtonY, forwardButtonWidth, forwardButtonHeight ;
int LoopButtonX, LoopButtonY, LoopButtonWidth, LoopButtonHeight ;
int BackButtonX, BackButtonY, BackButtonWidth, BackButtonHeight ;
int NextButtonX, NextButtonY, NextButtonWidth, NextButtonHeight ;
int NameButtonX, NameButtonY, NameButtonWidth, NameButtonHeight ;
color buttonColour ;
//

void setup() {
  Song = createFont ("Harrington", 885);
  Play = createFont ("Harrington", 885);
  Next = createFont ("Harrington", 885);
  Back = createFont ("Harrington", 885);
  Next = createFont ("Harrington", 885);
  Forward = createFont ("Harrington", 885);
  Rewind = createFont ("Harrington", 885);
  
  background(51);
  size(500, 600) ;
  quitButtonSetup();
  minim = new Minim(this);
  song[0] = minim.loadFile("Robots_a_Cometh.mp3") ;
  song[1] = minim.loadFile("Death_Impact_Yell_Single.mp3") ;
  song[2] = minim.loadFile("Spring Thaw - Asher Fulero.mp3") ;
  song[3] = minim.loadFile("Cover - Patrick Patrikios.mp3") ;
  song[4] = minim.loadFile("Cold Water - Patrick Patrikios.mp3") ;
  /*
  songMetaData[0] = song[0].getMetaData();
   songMetaData[1] = song[1].getMetaData();
   songMetaData[2] = song[2].getMetaData();
   songMetaData[3] = song[3].getMetaData();
   songMetaData[4] = song[4].getMetaData();
   */
  for (int i=0; i<song.length; i++) {
    songMetaData[i] = song[i].getMetaData();
  }
  println("Start of Console");
  println("Click the Canvas to Finish Starting this App");
  println("Press P to play and pause");
  println("Press S to Stop and Rewind");
  println("Press L to loop");
  println("Press F to fast Forward");
  println("Press R to Skip BackWards");
  println("\n\nVerifying MetaData") ;
  println( "File Name:", songMetaData[currentSong].fileName() );
  println( "Song Length (in milliseconds):", songMetaData[currentSong].length() );
  println( "Song Length (in seconds):", songMetaData[currentSong].length()/1000 );
  println( "Song Length (in minutes & seconds):", (songMetaData[currentSong].length()/1000)/60, "minutes", (songMetaData[currentSong].length()/1000)-((songMetaData[currentSong].length()/1000)/60 * 60), "seconds");
  println("Title : ", songMetaData[currentSong].title() );
  println("Author : ", songMetaData[currentSong].author() );
  println("Composer : ", songMetaData[currentSong].composer() );
  println("Orchestra : ", songMetaData[currentSong].orchestra() );
  println("Album : ", songMetaData[currentSong].album() );
  println("Disc : ", songMetaData[currentSong].disc() );
  println("Publisher : ", songMetaData[currentSong].publisher() );
  println("Date Release : ", songMetaData[currentSong].date() );
  println("Copyright : ", songMetaData[currentSong].copyright() );
  println("Comment : ", songMetaData[currentSong].comment() );
  println("Lyrics : ", songMetaData[currentSong].lyrics() );
  println("Track : ", songMetaData[currentSong].track() );
  println("Genre : ", songMetaData[currentSong].genre() );
  println("Encoded : ", songMetaData[currentSong].encoded() );
  playButtonX = width*1/3;
  playButtonY = height*1/2;
  playButtonWidth = width*166.6/500;
  playButtonHeight = height*1/5;
  stopButtonX = width*1/4;
  stopButtonY = height*1/2;
  stopButtonWidth = width*1/10 ;
  stopButtonHeight = height*1/10 ;
  rewindButtonX = width*1/20;
  rewindButtonY = height*4/8;
  rewindButtonWidth = width*2/10;
  rewindButtonHeight = height*2/10; 
  forwardButtonX = width*3/4;
  forwardButtonY = height*4/8;
  forwardButtonWidth = width*2/10;
  forwardButtonHeight = height*2/10;
  LoopButtonX = width*0/20;
  LoopButtonY = height*0/20; 
  LoopButtonWidth = width*1/20 ;
  LoopButtonHeight = height*1/20;  
  BackButtonX = width*1/20 ;
  BackButtonY = height*6/8 ;
  BackButtonWidth = width*2/10 ;
  BackButtonHeight = height*2/20 ;
  NextButtonX = width*3/4;
  NextButtonY = height*6/8; 
  NextButtonWidth = width*2/10;
  NextButtonHeight = height*2/20;
  NameButtonX = width*1/5 ;
  NameButtonY = height*3/20 ;
  NameButtonWidth = width*6/10 ;
  NameButtonHeight = height*5/20 ;
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
}  

void draw() {
  quitButtonDraw();
  rect(NameButtonX, NameButtonY, NameButtonWidth, NameButtonHeight);
  fill(purple);
  textAlign (CENTER, CENTER);
  textFont(Song, 30);
  text(Soong, NameButtonX, NameButtonY, NameButtonWidth, NameButtonHeight);
  fill(255);
  //
  rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  fill(purple);
  textAlign (CENTER, CENTER);
  textFont(Play, 30);
  text(Plaay, playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  fill(255);
  //
  rect(BackButtonX, BackButtonY, BackButtonWidth, BackButtonHeight);
  fill(purple);
  textAlign (CENTER, CENTER);
  textFont(Back, 30);
  text(Baack, BackButtonX, BackButtonY, BackButtonWidth, BackButtonHeight);
  fill(255);
  //
  rect(NextButtonX, NextButtonY, NextButtonWidth, NextButtonHeight);
  fill(purple);
  textAlign (CENTER, CENTER);
  textFont(Next, 30);
  text(Neext, NextButtonX, NextButtonY, NextButtonWidth, NextButtonHeight);
  fill(255);
  //
   rect(forwardButtonX, forwardButtonY, forwardButtonWidth, forwardButtonHeight);
  fill(purple);
  textAlign (CENTER, CENTER);
  textFont(Forward, 25);
  text(Foorward, forwardButtonX, forwardButtonY, forwardButtonWidth, forwardButtonHeight);
  fill(255);
  //
  rect(rewindButtonX, rewindButtonY, rewindButtonWidth, rewindButtonHeight);
  fill(purple);
  textAlign (CENTER, CENTER);
  textFont(Rewind, 25);
  text(Reewind, rewindButtonX, rewindButtonY, rewindButtonWidth, rewindButtonHeight);
  fill(255);
  //
    rect(LoopButtonX, LoopButtonY, LoopButtonWidth, LoopButtonHeight);
  fill(purple);
  textAlign (CENTER, CENTER);
  textFont(Play, 10);
  text(Looop, LoopButtonX, LoopButtonY, LoopButtonWidth, LoopButtonHeight);
  fill(255);
  
}

void keyPressed() {
  if (key == 'p' || key == 'P') {
    if (song[currentSong].isPlaying() ) {
      song[currentSong].pause() ;
    } else if (song[currentSong].position() == song[currentSong].length()) {
      song[currentSong].rewind() ;
      song[currentSong].play() ;
    } else {
      song[currentSong].play();
    }
  }
  if (key == 's' || key == 'S') {
    if (song[currentSong].isPlaying() ) {
      song[currentSong].rewind() ;
      song[currentSong].pause() ;
    } else {
      song[currentSong].rewind() ;
    }
  }
  if ( key == 'l' || key == 'L' ) song[currentSong].loop(loopNum);
  if ( key == 'f' || key == 'F' ) song[currentSong].skip(5000);
  if ( key == 'r' || key == 'R' ) song[currentSong].skip(-5000); 
  //
  println ("Current Song before the next or back button, ", "Number: "+currentSong); 
  if (key == 'n' || key == 'N') { 
    if (song[currentSong].isPlaying()) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberofSongs - 1 ) {
        println ("Current Song is the last song, ", "Number: " + currentSong);
        currentSong = numberofSongs - numberofSongs;
        println ("Current Song is now the first song, ", "Number: " + currentSong);
      } else {
        currentSong += 1; // Equivalent code: currentSong = currentSong + 1
        println ("Current Song after the next or back button, but not the last song", "\tNumber: "+currentSong);
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if ( currentSong == numberofSongs - 1 ) {
        println ("Current Song is the last song, ", "Number: " + currentSong); 
        currentSong = numberofSongs - numberofSongs;
        println ("Current Song is now the first song or song, ", "Number: " + currentSong);
      } else {
        currentSong += 1; 
        println ("Current Song after the next or back button, but not the last song, ", "Number: " + currentSong); //For Debugging
      }
    }
  }
  if (key == 'b' || key == 'B') {
    if (song[currentSong].isPlaying()) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberofSongs - numberofSongs ) {
        println ("Current Song is the first song, ", "Number: " + currentSong);
        currentSong = numberofSongs - 1;
        println ("Current Song is now the last song, ", "Number: " + currentSong);
      } else {
        currentSong -= 1;
        println ("Current Song after the next or back button, but not the first song", "\tNumber: " + currentSong);
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if ( currentSong == numberofSongs - numberofSongs ) {
        println ("Current Song is the first song, ", "Number: " + currentSong); 
        currentSong = numberofSongs - 1;
        println ("Current Song is now the last song, ", "Number: " + currentSong);
      } else {
        currentSong -= 1; 
        println ("Current Song after the next or back button, but not the first song, ", "Number: "+currentSong);
      }
    }
  }
} 

void mousePressed() { 
  quitButtonMouseClicked();
  if (mouseX>playButtonX && mouseX<playButtonX+playButtonWidth && mouseY>playButtonY && mouseY<playButtonY+playButtonHeight) {                                                                                                                 
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause() ;
    } else if ( song[currentSong].position() == song[currentSong].length()) {
      song[currentSong].rewind() ;
      song[currentSong].play() ;
    } else {
      song[currentSong].play();
    }
  }
  if (mouseX>rewindButtonX && mouseX<rewindButtonX+rewindButtonWidth && mouseY>rewindButtonY && mouseY<rewindButtonY+rewindButtonHeight) {
    song[currentSong].skip(-5000);
  }
  if (mouseX>forwardButtonX && mouseX<forwardButtonX+forwardButtonWidth && mouseY>forwardButtonY && mouseY<forwardButtonY+forwardButtonHeight) {
    song[currentSong].skip(5000);
  }
  if (mouseX>LoopButtonX && mouseX<LoopButtonX+LoopButtonWidth && mouseY>LoopButtonY && mouseY<LoopButtonY+LoopButtonHeight) {
    song[currentSong].loop(loopNum);
  }
  if (mouseX>NextButtonX && mouseX<NextButtonX+NextButtonWidth && mouseY>NextButtonY && mouseY<NextButtonY+NextButtonHeight) {
    if (song[currentSong].isPlaying()) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberofSongs - 1 ) {
        println ("Current Song is the last song, ", "Number: " + currentSong);
        currentSong = numberofSongs - numberofSongs;
        println ("Current Song is now the first song, ", "Number: " + currentSong);
      } else {
        currentSong += 1; // Equivalent code: currentSong = currentSong + 1
        println ("Current Song after the next or back button, but not the last song", "\tNumber: "+currentSong);
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if ( currentSong == numberofSongs - 1 ) {
        println ("Current Song is the last song, ", "Number: " + currentSong); 
        currentSong = numberofSongs - numberofSongs;
        println ("Current Song is now the first song or song, ", "Number: " + currentSong);
      } else {
        currentSong += 1; 
        println ("Current Song after the next or back button, but not the last song, ", "Number: " + currentSong); //For Debugging
      }
    }
  }
  if (mouseX>BackButtonX && mouseX<BackButtonX+BackButtonWidth && mouseY>BackButtonY && mouseY<BackButtonY+BackButtonHeight) {
    if (song[currentSong].isPlaying()) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberofSongs - numberofSongs ) {
        println ("Current Song is the first song, ", "Number: " + currentSong);
        currentSong = numberofSongs - 1;
        println ("Current Song is now the last song, ", "Number: " + currentSong);
      } else {
        currentSong -= 1;
        println ("Current Song after the next or back button, but not the first song", "\tNumber: " + currentSong);
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if ( currentSong == numberofSongs - numberofSongs ) {
        println ("Current Song is the first song, ", "Number: " + currentSong); 
        currentSong = numberofSongs - 1;
        println ("Current Song is now the last song, ", "Number: " + currentSong);
      } else {
        currentSong -= 1; 
        println ("Current Song after the next or back button, but not the first song, ", "Number: "+currentSong);
      }
    }
  }
}
