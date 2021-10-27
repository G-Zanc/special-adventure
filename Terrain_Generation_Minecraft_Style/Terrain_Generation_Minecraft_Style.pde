int cols,rows;
int scl = 20;
float yoffset;
float speed = 0;
Cube[][] topterrain;
ArrayList<Cube> cubes;
void setup(){
  size(1000,1000, P3D);
  
  int w = 1000;
  int h = 1000;
  cubes = new ArrayList<Cube>(0);
  cols = w/scl;
  rows = h/scl;
  topterrain = new Cube[cols][rows];
  for(int x = 0; x < cols; x++){
    for(int y = 0; y < rows; y++){
      fill(0,255,0);
      topterrain[x][y] = new Cube(x*scl, 800, -y*scl, color(0,255,0));
      //cubes.add(topterrain[x][y]);
    }
  }
  
  for(int x = 0; x < cols; x++){
    float xoffset = 0;
    for(int y = 0; y < rows; y++){
      float noise = map(noise(xoffset, yoffset), 0,1,-100,150);
      int amount = (int)noise/20;
      print(amount + " ");
      int adjustment = amount * 20;
      Cube[] column;
      topterrain[x][y].y += adjustment;
      topterrain[x][y].c = color(0,255,0);
      if(amount > 0){
        column = new Cube[amount];
      }else{
        column = new Cube[5];
      }
      for(int i = 0; i < column.length; i++){
        //fill(255);
        column[i] = new Cube(topterrain[x][y].x, topterrain[x][y].y, topterrain[x][y].z);
        cubes.add(column[i]);
      }
      
      for(int i = 0; i < column.length; i++){
        column[i].y += 20 * i;
    
      }
      xoffset += 0.15;
    }
    yoffset += .15;
  }
  yoffset = 0;
}

void draw(){
  background(0);
  translate(50,0);
  translate(width/2, height/2);
   rotateY(frameCount * .02);
   translate(-width/2, -height/2);
   
   for(int x = 0; x < cols; x++){
     for(int y = 0; y < rows; y++){
       //fill(0,255,0);
       topterrain[x][y].display();
     }
   }
   
  for(int i = 0; i < cubes.size(); i++){
    //fill(255);
   cubes.get(i).display();
  }
  //speed += .01;
}
