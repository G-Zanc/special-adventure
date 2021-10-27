
ArrayList<PointMass> pmasses = new ArrayList<PointMass>();
ArrayList<Constraint> constraints = new ArrayList<Constraint>();
//PointMass p;
//PointMass p2;
//Constraint c;
GrappleHook Hook;
float w = 20;
int clothWidth = 1;
int clothHeight = 15;
float mouseInfluenceSize = 20;
float MIScalar = 5;
Ragdoll Player;
PointMass lastOne;
void setup(){
  size(1000,1000, P3D);
  
  /*for(int i = 0; i < clothWidth; i++){
    for(int j = 0; j < clothHeight; j++){
    PointMass p = new PointMass(100 + i*w, 200 + j*w, 0, 1);
    pmasses.add(p);
    lastOne = p;
     }
  }
 for(int i = 0; i < clothWidth; i++){
    for(int j = 0; j < clothHeight - 1; j++){
      constraints.add(new Constraint(pmasses.get((i * clothHeight) + j), pmasses.get((i * 30) + j + 1), w));
      if(i > 0){
        constraints.add(new Constraint(pmasses.get(((i - 1) * clothHeight) + j), pmasses.get((i * 30) + j), w));
      }
    }
  }
  */
  Player = new Ragdoll(100, 200);
  //Constraint k = new Constraint(Player.LeftHand, lastOne, 20);
  //constraints.add(k);
}

void draw(){
  background(0);
  //pmasses.get(0).Anchor();
  //pmasses.get(pmasses.size() - 29).Anchor();
  Player.drawHead();
  //Player.Neck.Anchor();
  
  if(keyPressed){
    if(key == 'h'){
    /*Hook = new GrappleHook(Player.LeftHand, mouseX, mouseY, mouseX, mouseY);
    pmasses.add(Hook);
    Hook.Anchor();
    Hook.SolveLength();*/
    
    //for(int i = 0; i < 10; i++){
        //Hook.x = lerp(Hook.x, Hook.DesY, i);
        //Hook.y = lerp(Hook.y, Hook.DesY, i);
      //}
    }
  }
  
  for(PointMass p : pmasses){
    p.updateInteractions();
    p.update(1/frameRate);
    //p.paint()
  }
  for(Constraint c : constraints){
      c.paint();
    }
  
  for(int i = 0; i < 10; i++){
    for(Constraint c : constraints){
      c.solve();
    }
  }
  
}

float distPointToSegmentSquared(float lineX1, float lineY1, float lineX2, float lineY2, float pointX, float pointY) {
  float vx = lineX1 - pointX;
  float vy = lineY1 - pointY;
  float ux = lineX2 - lineX1;
  float uy = lineY2 - lineY1;
  
  float len = ux*ux + uy*uy;
  float det = (-vx * ux) + (-vy * uy);
  if ((det < 0) || (det > len)) {
    ux = lineX2 - pointX;
    uy = lineY2 - pointY;
    return min(vx*vx+vy*vy, ux*ux+uy*uy);
  }
  
  det = ux*vy - uy*vx;
  return (det*det) / len;
}

void mouseClicked(){
  if(mouseButton == RIGHT){
    Hook = new GrappleHook(Player.LeftHand, mouseX, mouseY, mouseX, mouseY);
    Hook.SolveLength();
    Constraint c = new Constraint(pmasses.get(pmasses.size() - 1), Hook, 20);
    constraints.add(c);
    pmasses.add(Hook);
    float yeetX = Hook.x;
    float yeetY = Hook.y;
    Hook.Anchor();
    
  }
}
