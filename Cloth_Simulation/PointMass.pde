class PointMass{
  float x,y,z;
  float prevx, prevy,prevz;
  float xacc, yacc, zacc;
  float mass;
  boolean isAnchor = false;
  
  PointMass(float x, float y, float z, float m){
    this.x = x;
    this.y = y;
    this.z = z;
    this.prevx = x;
    this.prevy = y;
    this.prevz = z;
    this.mass = m;
    xacc = 0;
    yacc = 0;
    zacc = 0;
  }
  
  void update(float delta){
    if(isAnchor == false){
    this.applyForce(0, mass*980, 0);
    //this.applyForce(100,0,20);
    
    float velX = x - prevx;
    float velY = y - prevy;
    float velZ = z - prevz;
    
    velZ *= .99;
    velX *= .99;
    velY *= .99;
    
    float deltaSq = delta * delta;
    
    float nextX = x + velX + .5 * xacc * deltaSq;
    float nextY = y + velY + .5 * yacc * deltaSq;
    float nextZ = z + velZ + .5 * zacc * deltaSq;
    
    //nextY += .5;
    prevx = x;
    prevy = y;
    prevz = z;
    
    x = nextX;
    y = nextY;
    z = nextZ;
    
    zacc = 0;
    xacc = 0;
    yacc = 0;
    } 
    else{
      prevx = x;
      prevy = y;
      prevz = z;
      xacc = 0;
      yacc = 0;
      zacc = 0;
    }
  }
  
  void paint(){
    noStroke();
    fill(255,255,255);
    ellipse(x,y,10,10);
  }
 
  void Anchor(){
    isAnchor = true;
  }
  
  float getY(){
    return prevy;
  }
  
  void updateInteractions(){
    if(mousePressed){
      float distanceSquared = distPointToSegmentSquared(pmouseX, pmouseY, mouseX, mouseY, x, y);
      if(mouseButton == LEFT){
        if(distanceSquared < 10){
          this.prevx = this.x - (mouseX- pmouseX) * 1.5;
          this.prevy = this.y - (mouseY-pmouseY) * 1.5;
        }
      }
    }
  }
  
  void applyForce(float fx, float fy, float fz){
    xacc += fx/mass;
    yacc += fy/mass;
    zacc += fz/mass;
  }
}
