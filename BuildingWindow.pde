class BuildingWindow{
  float dx;
  float dy;
  float x;
  float y;
  int xsize = 16;
  int ysize = 16;
  
  int turnOnSpread = (int)random(1,20);
  float chanceOfColor = 10;
  int c = 40;
 
  
  BuildingWindow(int _x, int _y){
      dx = width/xsize;
      dy = height/ysize;
      x = _x;
      y = _y;
      if (random(1,chanceOfColor)<2)
        c = (int)random(255);
  }
  
  void draw(float dt){
     noStroke();
     colorMode(HSB);
     int b = 0;
     if (dt<50+turnOnSpread && dt>-120+turnOnSpread)
       b = 255;
      else
       b = 0;
     fill(c,240,b,255);
     rect(x*xsize,y*ysize,xsize,ysize);
  }
}