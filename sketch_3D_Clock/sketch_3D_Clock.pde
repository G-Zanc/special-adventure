int cols,rows;
int scl = 100;
int rh;
int w = 1800;
int h = 700;
float speed;
float rate = .005;
Cell [][] coordinate;
void setup(){
  background(0);
  size(1800, 700, P3D);
  cols = w/scl;
  rows = h/scl;
  coordinate = new Cell[cols][rows];
  
  for(int x = 0; x < cols; x++){
    for(int y = 0; y < rows; y++){
      coordinate[x][y] = new Cell(x*scl, y*scl);
    }
  }
  
  
  }
  

void draw(){
  background(0);
  /*for(int x = 0; x < cols; x++){
    for(int y = 0; y < rows; y++){
      coordinate[x][y].display();
    }
  }
  */
  //coordinate[1][1].c = 255;
  translate(width/2, height/2 );
  rotateY(speed);
  translate(-width/2, -height/2);
  
  Frame ColonFrame = new Frame(7,1,coordinate);
  ColonFrame.displayColon();
  
  Frame Mframe1 = new Frame(14,1,coordinate);
  Frame Mframe2 = new Frame(10,1,coordinate);
  int m = minute();
  Mframe1.displayNumber(m%10);
  Mframe2.displayNumber(m/10);
  
  int h = hour();
  if(h < 13 && h > 0){
    h = rh;
  }else if(h > 12){
    rh = h - 12;
  }else if(h == 0){
    rh = 12;
  }
  
  Frame Hframe1 = new Frame(0,1,coordinate);
  Frame Hframe2 = new Frame(4,1,coordinate);
  
  if(rh/10 > 0){
    Hframe1.displayNumber(rh/10);
  }else{
    Hframe1.clearFrame();
  }
  Hframe2.displayNumber(rh%10);
  
  speed += rate;
  
  if(speed > 1 && rate > 0){
      rate = -rate;
    }else if(speed < -1 && rate < 0){
      rate = -rate;
    }
  }
