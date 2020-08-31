class Building{
  float x;
  int w;
  int h;
  float dx;
  float dy;
  int xsize = 16;
  int ysize = 16;
  Boolean isAway = false;
  int c = (int)random(255);
  ArrayList<BuildingWindow> windows = new ArrayList<BuildingWindow>(); 
  
  Building(int _x){
    dx = width/xsize;
    dy = height/ysize;
    x = _x;
    h = (int)random(5,30);
    if (h % 3 == 0) h+=2;
    w = (int)random(5,7);
    if (w % 2 == 0) w++;
    setupWindows();
  }
  
  void setupWindows(){
    for (int _x = 1; _x <= w/2; _x++){
        for (int _y = 1; _y <= (h-1)/3; _y++){
          windows.add(new BuildingWindow((int)x-1+_x*2, (int)dy + 1 - _y*3));
        }
    }
  }
 
  void draw(float dt, float t){
     pushMatrix();
     translate(-t,0);
     colorMode(HSB);
     noStroke();
     fill(c,255,dt,255);
     rect(x*xsize,height-h*ysize,w*xsize,h*ysize);
     for(BuildingWindow b : windows)
       b.draw(dt);
     popMatrix();
     if ((x+w)*xsize - t < 0){
       isAway = true;
     }
  }
}