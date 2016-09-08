PImage img;
String imgName = "sample_out.png";
int graylevel = 40;

void setup() {
  size(768, 1024);
  background(255, 255, 255);
  noStroke();
}

void draw() {
  img = loadImage(imgName);
  image(img, 0, 0);
  loadPixels();
  for(int y = 0 ; y < height ; y++){
    for(int x = 0; x < width ; x++){
      int pos = x + y * width;
      color c = pixels[pos];
      //when black(0, 0, 0)
      int r = (int)red(c);
      int g = (int)green(c);
      int b = (int)blue(c);
      int a = (int)alpha(c);
      if(r % 2 == 1 && g % 2 == 1 && b % 2 == 1 ) {
        fill(255, 255, 255);
        println("done");
      } else {
        fill(r - graylevel, g - graylevel, b - graylevel);
      }
      rect(x, y, 1, 1);
    }
  }
  save("sample_result.png");
  noLoop();
}
