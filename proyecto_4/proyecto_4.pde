import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
Detector detect;
int scene=0;
Movie movie0,movie1;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  detect = new Detector(video,opencv);
  movie0 = new Movie(this, "video0.mp4");
  movie1 = new Movie(this, "video1.mp4");
}

void draw(){
   int t;
   
   switch(scene){
     case 0: 
             scale(2);
             background(0);
             fill(255);
             textSize(39);
             text("FEAR",115,75);
             fill(255);
             textSize(32);
             text("Inicio",120,120);
             fill(255);
             textSize(12);
             text("De click en la ventana para continuar",50,145);
             break;
     case 1: 
             scale(2);
             background(102);
             fill(0);
             textSize(12);
             text("Observe el  video  que  se  muestra en pantalla",20,80);
             text("Si la cámara lo pierde de vista, se reproducirá",20,100);
             text("una escena diferente",20,120);
             text("De click en la ventana para continuar",40,160);
             break;
     case 2: scale(1);
             t=detect.FindFaces(video,opencv);
             if(t==1){
               movie0.play();
               movie1.pause();
               image(movie0, 0, 0, width, height);
             }
             else{ 
               movie0.pause();
               movie1.play();
               image(movie1, 0, 0, width, height);
             }
   }
   
}

void movieEvent(Movie m) {
  m.read();
}

void mouseClicked(){
  scene=scene+1;
  if(scene>2)scene=2;
}

void captureEvent(Capture c) {
  c.read();
}