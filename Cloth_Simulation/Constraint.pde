class Constraint{
  PointMass p1;
  PointMass p2;
  
  float restingDistance;
  float tearDistance;
  float stiffness = 1;
  
  Constraint(PointMass p1, PointMass p2, float rest){
    this.p1 = p1;
    this.p2 = p2;
    this.restingDistance = rest;
  }
  
  void solve(){
    float diffX = this.p1.x - this.p2.x;
    float diffY = this.p1.y - this.p2.y;
    float diffZ = this.p1.z - this.p2.z;
    
    float d = sqrt((diffX * diffX) + (diffY * diffY) + (diffZ * diffZ));
   // print(diffX * diffX + diffY + diffY);
    //print(p1.y, ", " + p2.y);
   // print(diffY);
     //print(p2.x + ", " + p2.y + ", " + d);
    float im1 = 1 / p1.mass;
    float im2 = 1/p2.mass;
    float scalarP1 = (im1 / (im1 + im2)) * stiffness;
    float scalarP2 = stiffness - scalarP1;
    float difference = (restingDistance - d)/d;
    
    float translateX = diffX *  difference;
    float translateY= diffY  * difference;
    float translateZ = diffZ * difference;
    
   //print(difference + "                   ");
    //print(d + " ");
    
    if(p1.isAnchor == false){
      //p1.prevx = p1.x;
      //p1.prevy = p1.y;
      p1.x += (translateX * scalarP1);
      p1.y += (translateY * scalarP1);
      p1.z += (translateZ * scalarP1);
      
    }
    if(p2.isAnchor == false){
      //p2.prevx = p2.x;
      //p2.prevy = p2.y;
      p2.x -= (translateX * scalarP2);
      p2.y -= (translateY * scalarP2);
      p2.z -= (translateZ * scalarP2);
    }
  }
  
  void paint(){
   stroke(255,255,255);
   line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
  }
  
}
