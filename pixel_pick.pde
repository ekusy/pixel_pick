import processing.video.*;

Capture cam;

final int rgb = 1;
final int hsv = 2;
int colorMode = rgb;

boolean CLICK = false;

color pixel = color(255, 255, 255);


void setup() {
  String[] cams = Capture.list();

  if (cams.length == 0) {
    println("error not find camera");
    exit();
  } else {
    for (int i=0; i<cams.length; i++) {
      println(cams[i]);
    }
    cam = new Capture(this, cams[0]);
    cam.start();
    size(cam.width+160, cam.height);
  }
}

void draw() {
  if (cam.available() == false) {
    println("error camera not available");
    exit();
  } else {
    cam.read();
    image(cam, 0, 0);

    if (CLICK == false) {
      setColorData();
    }
  }
}

void mouseClicked() {
  if (CLICK == true) {
    if ( mouseButton == LEFT) {
      setColorData();
    }
  }
  if (mouseButton == RIGHT) {
    CLICK=!CLICK;
  }
}

void setColorData() {
  int x = mouseX;
  int y = mouseY; 
  if (x<cam.width) {
    pixel = pixels[y*width+x];
    fill(pixel);
  }
}

void drawColorData() {
  if (CLICK == false)
    text("CLICK = FALSE", cam.width+40, 20);
  else
    text("CLICK = TRUE", cam.width+40, 20);
  rect(cam.width+60, 40, 40, 40);

  text("R:"+red(pixel), cam.width+60, 90);
  text("G:"+green(pixel), cam.width+60, 100);
  text("B:"+blue(pixel), cam.width+60, 110);
  text("H:"+hue(pixel), cam.width+60, 120);
  text("S:"+saturation(pixel), cam.width+60, 130);
  text("V:"+brightness(pixel), cam.width+60, 140);
  text("a:"+alpha(pixel), cam.width+60, 150);
}

