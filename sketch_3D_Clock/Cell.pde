class Cell{
int x,y;
float c;

Cell(int x, int y){
  this.x = x;
  this.y = y;
  c = 0;
}

Cell(int x, int y, float c){
  this.x = x;
  this.y = y;
  this.c = c;
}  
  
void display(){
  stroke(255);
  //fill(255);
  //if(c == 0){
    //noFill();
  //}
    //else{
      //fill(c);
   // }
  push();
  translate(x,y);
  box(100);
  pop();
  
  }
  
void Clear(){
  stroke(0);
  fill(0);
  push();
  translate(x,y);
  box(100);
  pop();
}
}
