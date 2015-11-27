import processing.video.*;

Capture cam;

void setup {
  size(800, 480);
  String[] cams = Capture.list();

  if (cams.length == 0) {
    println("error not find camera");
  } else {
    for (int i=0; i<cams.length; i++) {
      println(cams[i]);
    }
    cam = new Capture(this,cams[0]);
    cam.start();
  }
}

