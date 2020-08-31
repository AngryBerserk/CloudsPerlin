class CityBackground{
  int maxBuildingLength = 4;
  int maxBuildingHeight = 15;
  int minBuildingHeight = 5;
  
  float dx;
  float dy;
  float tx;
  float t = 0.7;
  int xsize = 16;
  int ysize = 16;
  float threshold = 0.5;
  int horizontLevel = 1;
  ArrayList<Integer> heights = new ArrayList<Integer>();
  
  CityBackground(){
    dx = width/xsize;
    dy = height/ysize;
    
  }

  void draw(){
    colorMode(RGB);
    fill(70,70,70);
    pushMatrix();
    translate(-tx,0);
    for (int x = 0; x < dx + 1; x++){
      int d = (int)(tx/xsize); 
      float v = noise((x+d)*t);
      int c = (int)map(v,0,1,minBuildingHeight,maxBuildingHeight);
      noStroke();
      for (int y = height; y > c + horizontLevel; y--){
        rect((x+d)*xsize, y*ysize,xsize,ysize);
      }
    }
    tx += 1;
    popMatrix();
    
  }
}