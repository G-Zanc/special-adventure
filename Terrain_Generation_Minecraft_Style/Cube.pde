class Cube{
float x,y,z;
color c;

Cube(float x, float y, float z){
  this.x = x;
  this.y = y;
  this.z = z;
  c = color(0,255,0);
}

Cube(float x, float y, float z, color c){
  this.x = x;
  this.y = y;
  this.z = z;
  this.c = c;
}  
  
void display(){
  stroke(0);
  fill(this.c);
  //fill(255);
  //if(c == 0){
    //noFill();
  //}
    //else{
      //fill(c);
   // }
  beginShape(QUADS);
  
  vertex(x,y,z);
  vertex(x + 20, y, z);
  vertex(x + 20, y - 20, z);
  vertex(x, y - 20, z);
  
  vertex(x + 20, y, z);
  vertex(x + 20, y - 20, z);
  vertex(x + 20, y - 20, z - 20);
  vertex(x + 20, y, z - 20);
  
  vertex(x, y, z);
  vertex(x, y - 20, z);
  vertex(x, y - 20, z - 20);
  vertex(x, y, z - 20);
  
  vertex(x,y,z);
  vertex(x,y,z-20);
  vertex(x+20,y,z-20);
  vertex(x+20,y,z);
  
  vertex(x,y-20,z);
  vertex(x,y-20,z-20);
  vertex(x+20,y-20,z-20);
  vertex(x+20,y-20,z);
  
  vertex(x,y,z-20);
  vertex(x,y-20,z-20);
  vertex(x+20,y-20,z-20);
  vertex(x+20,y,z-20);
  endShape();
  }
  
}
