class Frame{
  int iX;
  int iY;
  Cell[][] Cells;
  
  Frame(int x, int y, Cell[][] Cells){
    iX = x;
    iY = y;
    this.Cells = Cells;
  }
  
  void displayNumber(int num){
    
    if(num == 0){
      Cells[iX][iY].display();
      Cells[iX + 1][iY].display();
      Cells[iX + 2][iY].display();
      for(int i = 1; i < 5; i++){
        Cells[iX][iY + i].display();
        Cells[iX+2][iY + i].display();
      }
      Cells[iX+1][iY+4].display();
      
    }else if(num == 1){
      for(int i = 0; i < 5; i++){
        Cells[iX+1][iY+i].display();
      }
    }else if(num == 2){
    for(int i = 0; i < 5; i++){
      for(int u = 0; u < 3; u++){
        if(i%2 == 0){
          Cells[iX + u][iY + i].display();
          }
        }
      }
      Cells[iX + 2][iY + 1].display();
      Cells[iX][iY + 3].display();
    }else if(num == 3){
    for(int i = 0; i < 5; i++){
      for(int u = 0; u < 3; u++){
        if(i%2 == 0){
          Cells[iX + u][iY + i].display();
          }
        }
      }
      Cells[iX + 2][iY + 1].display();
      Cells[iX + 2][iY + 3].display();
    }else if(num == 4){
    for(int i = 0; i < 3; i++){
      for(int u = 0; u < 3; u++){
        if(i%2 == 0 && !(u==1 && i==0)){
          Cells[iX + u][iY + i].display();
          }
        }
      }
      Cells[iX][iY+1].display();
      Cells[iX+2][iY+1].display();
      Cells[iX + 2][iY + 3].display();
      Cells[iX + 2][iY + 4].display();
    }else if(num == 5){
    for(int i = 0; i < 5; i++){
      for(int u = 0; u < 3; u++){
        if(i%2 == 0){
          Cells[iX + u][iY + i].display();
          }
        }
      }
      Cells[iX][iY + 1].display();
      Cells[iX + 2][iY + 3].display();
    }else if(num == 6){
    for(int i = 0; i < 5; i++){
      for(int u = 0; u < 3; u++){
        if(i%2 == 0){
          Cells[iX + u][iY + i].display();
          }
        }
      }
      Cells[iX][iY + 1].display();
      Cells[iX + 2][iY + 3].display();
      Cells[iX][iY + 3].display();
    }else if(num == 7){
      for(int u = 0; u < 3; u++){
          Cells[iX + u][iY].display();
        }
      
      Cells[iX+2][iY+1].display();
      Cells[iX+2][iY+2].display();
      Cells[iX + 2][iY + 3].display();
      Cells[iX + 2][iY + 4].display();
    }else if(num == 8){
    for(int i = 0; i < 5; i++){
      for(int u = 0; u < 3; u++){
        if(i%2 == 0){
          Cells[iX + u][iY + i].display();
          }
        }
      }
      Cells[iX + 2][iY + 1].display();
      Cells[iX][iY + 1].display();
      Cells[iX + 2][iY + 3].display();
      Cells[iX][iY + 3].display();
    }else if(num == 9){
     for(int i = 0; i < 3; i++){
      for(int u = 0; u < 3; u++){
        if(i%2 == 0){
          Cells[iX + u][iY + i].display();
          }
        }
      }
      Cells[iX][iY+1].display();
      Cells[iX+2][iY+1].display();
      Cells[iX + 2][iY + 3].display();
      Cells[iX + 2][iY + 4].display();
    }
  }
  
  void displayColon(){
    Cells[iX + 1][iY + 1].display();
    Cells[iX + 1][iY + 3].display();
  }
  
  void clearFrame(){
    for(int x = 0; x < 3; x++){
      for(int y = 0; y < 5; y++){
        Cells[x][y].Clear();
      }
    }
  }
}
