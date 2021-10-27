var Engine = Matter.Engine,
    Render = Matter.Render,
    World = Matter.World,
    Bodies = Matter.Bodies;

var engine = Engine.create();

var render = Render.create({
                element: document.body,
                engine: engine,
                options: {
                    width: 800,
                    height: 400,
                    wireframes: false
                }
             });

var boxA = Bodies.rectangle(400, 200, 80, 80);
var ballA = Bodies.circle(380, 100, 40, 10);
var ballB = Bodies.circle(460, 10, 40, 10);
var ground = Bodies.rectangle(400, 380, 810, 60, { isStatic: true });
engine.world.gravity.y = 0;
World.add(engine.world, [boxA, ballA, ballB, ground]);
Matter.Body.applyForce(ballA, {x: ballA.position.x, y: ballA.position.y}, {x: .05, y:0});
Matter.Body.applyForce(ballB, {x: ballB.position.x, y: ballB.position.y}, {x: 0, y:.05});

kd.RIGHT.down(function () {
 Matter.Body.applyForce(ballA, {x: ballA.position.x, y: ballA.position.y}, {x: .005, y:0});
});

kd.RIGHT.up(function () {

});

kd.LEFT.down(function () {
  Matter.Body.applyForce(ballA, {x: ballA.position.x, y: ballA.position.y}, {x: -.005, y:0});
});

kd.LEFT.up(function () {

});

kd.UP.down(function () {
  Matter.Body.applyForce(ballA, {x: ballA.position.x, y: ballA.position.y}, {x: 0, y: -.005});
});

kd.UP.up(function () {

});

kd.DOWN.down(function () {
  Matter.Body.applyForce(ballA, {x: ballA.position.x, y: ballA.position.y}, {x: 0, y:.005});
});
// This update loop is the heartbeat of Keydrown
kd.run(function () {
  kd.tick();
});

Engine.run(engine);
Render.run(render);
