let car;
function setup() {
  createCanvas(700, 550);
  car = new Car(width / 2, height / 2);
  rectMode(CENTER);
  angleMode(DEGREES);
}

function draw() {
  background(0);
  car.show();
  car.update();
  car.move();
  console.log(car.unitX + " " + car.unitY);
}

/*function keyPressed() {
  switch(keyCode) {
  //  case RIGHT_ARROW:
    //car.rotation += 1;
  //  console.log("RIGHT");
    //  break;
    case LEFT_ARROW:
    car.rotation += -1;
      break;
    case DOWN_ARROW:
    car.speed += -.1;
      break;
    case UP_ARROW:
    car.speed += .1
      break;
  }
*/

  kd.RIGHT.down(function () {
   car.rotation += 2;
  });

  kd.RIGHT.up(function () {
  });

  kd.LEFT.down(function () {
    car.rotation += -2;
  });

  kd.LEFT.up(function () {
  });

  kd.UP.down(function () {
    if(car.speed < .05) {
      car.acceleration += -.01;
    }
  });
  kd.UP.up(function () {
    //while(car.speed > 0) {
      //car.acceleration -= .01;
    //}
  });
  kd.DOWN.down(function () {
    if(car.speed != .0) {
    car.acceleration += .01;
  }
  });
  // This update loop is the heartbeat of Keydrown
  kd.run(function () {
    kd.tick();
  });
