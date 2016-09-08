PImage textimg;
PImage img;
int pos;
color c;

String textimgName = "moji.png";
String imgName = "watashi.jpg";
//set text color (0, 0, 0).
//and it background color must be (255, 255, 255);



void setup() {
  size(768, 1024); //same image size
  background(255, 255, 255);
  noStroke();
}

void draw() {
  int buffsize = width * height;
  int[] flag = new int[buffsize];
  textPosition(flag);
  background(255);
  RePixel(flag);
  save("sample_out.png");
  noLoop();
}

void textPosition(int[] f) {
  textimg = loadImage(textimgName);
  image(textimg, 0, 0);
  loadPixels();
  //pixel check
  for(int y = 0 ; y < height ; y++){
    for(int x = 0; x < width ; x++){
      pos = x + y * width;
      c = pixels[pos];
      //when black(0, 0, 0)
      if(red(c) == 0 && blue(c) == 0 && green(c) == 0) {
        f[pos] = 1;
      } else {
        f[pos] = 0;
      }
    }
  }
}

void RePixel(int[] f) {
  img = loadImage(imgName);
  image(img, 0, 0);
  loadPixels();
  for(int y = 0 ; y < height ; y++){
    for(int x = 0; x < width ; x++){
      pos = x + y * width;
      c = pixels[pos];
      int r = (int)red(c);
      int g = (int)green(c);
      int b = (int)blue(c);
      if(f[pos] == 1) {
        r =  r - (r % 2) + 1; 
        g =  g - (g % 2) + 1;
        b =  b - (b % 2) + 1;
      } else {
        r = r - (r % 2);
        g = g - (g % 2);
        b = b - (b % 2); 
      }
      fill(r,g,b);
      rect(x, y, 1, 1);
    }
  }
}

void mousePressed() {
  float r, g, b;
  color c = color(mouseX, mouseY);
  r = red(c);
  g = green(c);
  b = blue(c);
  println(r + ", " + g + ", " + b);
}

void test() {
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
      } else {
        fill(r,g,b,a / 2);
      }
      rect(x, y, 1, 1);
    }
  }
}
