class Car {
  constructor(x, y) {
    this.x = x;
    this.y = y;
    this.unitX = 0;
    this.unitY = 1;
    this.width = 40;
    this.height = 80;
    this.wheelBase = 160;
    this.speed = 0;
    this.accX = 0
    this.accY = 0;
    this.velX = 0;
    this.speed = 0;
    this.velY = 0;
    this.rotation = 90;
    this.steeringAngle = 15;
    this.turn = 0;
    this.acceleration = 0;
  }

  show() {
    fill(100);
    stroke(0);
    push();
    translate(this.x, this.y);
    rotate(this.rotation);
    rect(0, 0, this.height, this.width);
    pop();
  }

  update() {
      this.unitX = Math.cos(this.rotation * (PI / 180));
      this.unitY = Math.sin(this.rotation * (PI / 180));
  }

  move() {
    this.velX += this.acceleration * this.unitX
    this.x += this.velX
    this.velY += this.acceleration * this.unitY
    this.y += this.velY;
    this.speed = Math.sqrt(Math.pow(this.velY, 2) + Math.pow(this.velX, 2));
  }
}
