int xsize = 16;
int ysize = 16;
float timeOfDay = 100;
float timeSpeed = 0.1;
float t = 0;
float density = 5;
PerlinClouds clouds;
CityBackground cityBack;
ArrayList<Building> buildings = new ArrayList<Building>();
ArrayList<Building> toKill = new ArrayList<Building>();

void setup(){
  size(800,600);
  clouds = new PerlinClouds();
  cityBack = new CityBackground();
  initBuildings();
}

void initBuildings(){
  Building b = new Building(10);
  buildings.add(b);
}

void keyPressed(){
  if (key == 'q')
    timeOfDay++;
    if (key == 'a')
    timeOfDay--;
    timeOfDay =  constrain(timeOfDay,-200,200);
    println(timeOfDay);
}

void draw(){
 clouds.draw(timeOfDay); 
 cityBack.draw(); 
 for(Building b : buildings){
   b.draw(timeOfDay,t);
   if (b.isAway)
     toKill.add(b);
 }
 t+=2;
 if ((int)(t*4 % xsize) == 0 && (int)random(1,density)==1){
   Building b = new Building(width/xsize+(int)t);
   if ((int)random(1,3)==1)
     buildings.add(0,b);
     else
     buildings.add(b);
 }
 cleanup();
 if (int(abs(timeOfDay)) == 200)
   timeSpeed *= -1;
 timeOfDay+=timeSpeed;
}

void cleanup(){
   for(Building b : toKill)
     buildings.remove(b);
   toKill.clear();
}