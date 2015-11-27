import processing.video.*;

Capture cam;

final int rgb = 1;
final int hsv = 2;
int colorMode = rgb;

boolean CLICK = false;

color pixel = color(255, 255, 255);


void setup() {
  size(800, 480);
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
    colorMode(RGB);
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
  if (x<640) {
    pixel = pixels[y*width+x];
    fill(pixel);
  }
}

void drawColorData() {
  if (CLICK == false)
    text("CLICK = FALSE", 680, 20);
  else
    text("CLICK = TRUE", 680, 20);
  rect(700, 40, 40, 40);

  text("R:"+red(pixel), 700, 90);
  text("G:"+green(pixel), 700, 100);
  text("B:"+blue(pixel), 700, 110);
  text("H:"+hue(pixel), 700, 120);
  text("S:"+saturation(pixel), 700, 130);
  text("V:"+brightness(pixel), 700, 140);
  text("a:"+alpha(pixel), 700, 150);
}

