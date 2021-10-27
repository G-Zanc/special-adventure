class Ragdoll{
  float xPos, yPos;
  PointMass Neck;
  //PointMass Shoulder;
  PointMass LeftElbow;
  PointMass RightElbow;
  PointMass LeftHand;
  PointMass RightHand;
  PointMass Pelvis;
  PointMass RightKnee;
  PointMass LeftKnee;
  PointMass RightFoot;
  PointMass LeftFoot;
  
  Constraint LeftShoulder;
  Constraint RightShoulder;
  Constraint LeftForeArm;
  Constraint RightForeArm;
  Constraint Torso;
  Constraint LeftThigh;
  Constraint RightThigh;
  Constraint LeftShin;
  Constraint RightShin;
  
  Ragdoll(float x, float y){
    this.xPos = x;
    this.yPos = y;
    Neck = new PointMass(xPos, yPos + 5, 0, 4);
    LeftElbow = new PointMass(xPos + 10, yPos + 5, 0, 2);
    RightElbow = new PointMass(xPos - 10, yPos + 5, 0, 2);
    LeftHand = new PointMass(xPos + 20, yPos + 10, 0, 2);
    RightHand = new PointMass(xPos - 20, yPos + 10, 0, 2);
    Pelvis = new PointMass(xPos, yPos + 25, 0, 15);
    LeftKnee = new PointMass(xPos + 10, yPos + 30, 0, 10);
    RightKnee = new PointMass(xPos - 10, yPos + 30, 0, 10);
    LeftFoot = new PointMass(xPos + 20, yPos + 35, 0, 5);
    RightFoot = new PointMass(xPos - 20, yPos + 35, 0, 5);
    
    pmasses.add(Neck);
    pmasses.add(LeftElbow);
    pmasses.add(RightElbow);
    pmasses.add(LeftHand);
    pmasses.add(RightHand);
    pmasses.add(Pelvis);
    pmasses.add(LeftKnee);
    pmasses.add(RightKnee);
    pmasses.add(LeftFoot);
    pmasses.add(RightFoot);
    
    LeftShoulder = new Constraint(Neck, LeftElbow, 11);
    RightShoulder = new Constraint(Neck, RightElbow, 11);
    LeftForeArm = new Constraint(LeftElbow, LeftHand, 11);
    RightForeArm = new Constraint(RightElbow, RightHand, 11);
    Torso = new Constraint(Neck, Pelvis, 20);
    LeftThigh = new Constraint(Pelvis, LeftKnee, 11);
    RightThigh = new Constraint(Pelvis, RightKnee, 11);
    LeftShin = new Constraint(LeftKnee, LeftFoot, 11);
    RightShin = new Constraint(RightKnee, RightFoot, 11);
    
    constraints.add(LeftShoulder);
    constraints.add(RightShoulder);
    constraints.add(LeftForeArm);
    constraints.add(RightForeArm);
    constraints.add(Torso);
    constraints.add(LeftThigh);
    constraints.add(RightThigh);
    constraints.add(LeftShin);
    constraints.add(RightShin);
    
  }
 
 void drawHead(){
   ellipse(Neck.x,Neck.y,5,5);
 }
}
