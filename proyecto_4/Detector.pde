class Detector{
  int persons;
  OpenCV open;
  Capture vid;
  Detector(Capture vid, OpenCV op) {  
    op.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
    vid.start();
  } 
  int FindFaces(Capture vid, OpenCV op){ 
    op.loadImage(vid);
    /*image(vid, 0, 0 );
    noFill();
    stroke(0, 255, 0);
    strokeWeight(3);*/
    Rectangle[] faces = op.detect();
    println(faces.length);
    /*for (int i = 0; i < faces.length; i++) {
      println(faces[i].x + "," + faces[i].y);
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }*/
    return(faces.length);
  } 
} 