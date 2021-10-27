class GrappleHook extends PointMass{
  PointMass ConnectingPoint;
  PointMass Origin;
  float DesX, DesY;
  PointMass previousPoint;
  GrappleHook(PointMass p, float x, float y, float dx, float dy){
    super(x,y,0,1);
    ConnectingPoint = p;
    this.previousPoint = ConnectingPoint;
    this.DesX = dx;
    this.DesY = dy;
  }
  
  void SolveLength(){
    float d = sqrt(sq(ConnectingPoint.x - DesX) + sq(ConnectingPoint.y - DesY));
    int numOfPoints = (int)(d/20);
    print(numOfPoints);
    for(int i = 0; i < numOfPoints; i++){
      PointMass p = new PointMass(ConnectingPoint.x, ConnectingPoint.y, ConnectingPoint.z, 1);
      pmasses.add(p);
        Constraint c = new Constraint(previousPoint, p, 20);
        constraints.add(c);
        previousPoint = p;
      }
    }
  }
