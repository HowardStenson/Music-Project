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
  AudioMetaData[] songMetaData = new AudioMetaData[numberofSongs];
  int currentSong=  1 ;
  int loopNum = 1 ;
  //GUI
  int playButtonX, playButtonY, playButtonWidth, playButtonHeight ;
  int stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight ;
  int rewindButtonX, rewindButtonY, rewindButtonWidth, rewindButtonHeight ;
  int forwardButtonX, forwardButtonY, forwardButtonWidth, forwardButtonHeight ;
  //GUI End
void setup() {
  size(500, 600) ;
  minim = new Minim(this);
  song[0] = minim.loadFile("Robots_a_Cometh.mp3") ;
  song[1] = minim.loadFile("Death_Impact_Yell_Single.mp3") ;
  song[2] = minim.loadFile("Spring Thaw - Asher Fulero.mp3") ;
  song[3] = minim.loadFile("Cover - Patrick Patrikios.mp3") ;
  song[4] = minim.loadFile("Cold Water - Patrick Patrikios.mp3") ;
  //
  /*
  songMetaData[0] = song[0].getMetaData();
  songMetaData[1] = song[1].getMetaData();
  songMetaData[2] = song[2].getMetaData();
  songMetaData[3] = song[3].getMetaData();
  songMetaData[4] = song[4].getMetaData();
  */
  for (int i=0; i<song.length ;i++) {
    songMetaData[i] = song[i].getMetaData();
}// End Song MetaData
//
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
//println(" : ", songMetaData[currentSong]. );
//GUI 
playButtonX = width*1/2;
playButtonY = height*1/2;
playButtonWidth = width*1/5 ;
playButtonHeight = height*1/5 ;
stopButtonX = width*1/4;
stopButtonY = height*1/2;
stopButtonWidth = width*1/10 ;
stopButtonHeight = height*1/10 ;
rewindButtonX = width*1/4 ;
rewindButtonY = height*4/8 ;
rewindButtonWidth = width*1/10 ;
rewindButtonHeight = height*2/10 ; 
forwardButtonX = width*3/4;
forwardButtonY = height*4/8 ;
forwardButtonWidth = width*2/10 ;
forwardButtonHeight = height*2/10 ;
//GUI end
}
  
void draw() {
 background(white);
 rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
 //rect(stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight);
 rect(forwardButtonX, forwardButtonY, forwardButtonWidth, forwardButtonHeight);
 rect(rewindButtonX, rewindButtonY, rewindButtonWidth, rewindButtonHeight);        
} 

void keyPressed() {
  if (key == 'p' || key == 'P') {
   if ( song[currentSong].isPlaying() ) {
        song[currentSong].pause() ;
   } else if ( song[currentSong].position() == song[currentSong].length()) {
      song[currentSong].rewind() ;
      song[currentSong].play() ;
   } else {
          song[0].play();}
  }
if (key == 's' || key == 'S') {
if ( song[currentSong].isPlaying() ) {
     song[currentSong].rewind() ;
     song[currentSong].pause() ;
         } else {
     song[currentSong].rewind() ;
 }
}
if( key == 'l' || key == 'L' ) song[currentSong].loop(loopNum);
if( key == 'f' || key == 'F' ) song[currentSong].skip(5000);
if( key == 'r' || key == 'R' ) song[currentSong].skip(-5000); 
}

void mousePressed() {  
  if (mouseX>playButtonX && mouseX<playButtonX+playButtonWidth && mouseY>playButtonY && mouseY<playButtonY+playButtonHeight) {
  if ( song[currentSong].isPlaying() ) {
        song[currentSong].pause() ;
   } else if ( song[currentSong].position() == song[currentSong].length()) {
      song[currentSong].rewind() ;
      song[currentSong].play() ;
   } else {
     song[currentSong].play();}
  }
  if (mouseX>rewindButtonX && mouseX<rewindButtonX+rewindButtonWidth && mouseY>rewindButtonY && mouseY<rewindButtonY+rewindButtonHeight) {
  song[currentSong].skip(-5000);
  }
  if (mouseX>forwardButtonX && mouseX<forwardButtonX+forwardButtonWidth && mouseY>forwardButtonY && mouseY<forwardButtonY+forwardButtonHeight) {
  song[currentSong].skip(5000);
  }
  //playButtonX, playButtonY, playButtonWidth, playButtonHeight
}
