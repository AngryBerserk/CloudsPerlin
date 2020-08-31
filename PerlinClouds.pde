class PerlinClouds{
  float dx;
  float dy;
  float xsize = 16;
  float ysize = 16;
  float t;
  float tx;
  float ty;
  float threshold = 90;
  PImage background;
  
  PerlinClouds(){
    colorMode(HSB);
    dx = width/xsize;
    dy = height/ysize;
    t = 0.01 * 5;
    tx = t;
    ty = t;
    setupBackground();  
  }
  
  void setupBackground(){
   background = new PImage(width, height);
   background.loadPixels();
   for (int i = 0; i<1000; i++)
     background.pixels[(int)random(background.pixels.length)] = color(random(255),random(255),random(255));
   background.updatePixels();
  }

  void draw(float dt){
    colorMode(HSB);
    fill(0,0,0,255);
    image(background,0,0);
    pushMatrix();
    translate(-tx,0);
    noStroke();  
    for (int y = 0; y < dy; y++)
      for (int x = 0; x < dx+1; x++){
       float d = tx/xsize;
       float v = noise((x+d)*t,y*t,tx/400); 
       float c = map(v,0,1,0,255);
       float a = constrain((255 - c)+dt,0,255);
       if (c< threshold){
         //dence cloud
         c = 0;
       }
       else{ 
         c = constrain(c - threshold,0,255);
       }
       fill(126,c,255,a);
       rect((x+d)*xsize,y*ysize,xsize,ysize);
      }
    tx += 0.1;
    popMatrix();
  }
  
}