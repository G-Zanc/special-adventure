let w = 10;
let rows, cols;
let grid = [];
let stack = [];
let current;
let mazeButton;
let pathButton;
let path = [];
let v = 0;

function setup() {
  createCanvas(700, 550);
  rows = floor(550/w);
  cols = floor(550/w);

  mazeButton = new Clickable(width - 125, 100);
  mazeButton.text = "Generate Maze";
  pathButton = new Clickable(width - 125, 200);
  pathButton.text = "Show Path";

  for (var i = 0; i < rows; i++) {
    grid[i] = [];
    for (var j = 0; j < cols; j++) {
      grid[i].push(new Cell(i, j));
    }
  }
}


function draw() {
  background(51);
  mazeButton.draw();
  pathButton.draw();

  mazeButton.onRelease = function() {
    createMaze();
  }

  pathButton.onRelease = function() {
    path = findPath(grid[1][1], grid[rows - 2][cols - 2]);
    path.reverse();
    v = 0;
  }

  for (var i = 0; i < rows; i++) {
    for (var j = 0; j < cols; j++) {
      grid[i][j].show();
    }
  }

  if (path.length > 0 && v < path.length) {
    path[v].type = "solve";
    v++;
  }
}

function Cell(i, j) {
  this.i = i;
  this.j = j;
  this.h = 0;
  this.g = 0;
  this.parent = null;

  this.type = "none";

  this.show = function() {
    noStroke();
    if (this.type == "wall") {
      fill(0, 0, 0);
      rect(i*w, j*w, w, w);
    } else if (this.type == "path") {
      fill(255, 255, 255);
      rect(i*w, j*w, w, w);
    } else if (this.type == "none") {
      fill(51);
      rect(i*w, j*w, w, w);
    } else if (this.type == "solve") {
      fill(255, 255, 0)
        rect(i*w, j*w, w, w);
    }
  }

  this.getfCost = function() {
    return this.g + this.h;
  }

  this.checkNeighbors = function() {
    var neighbors = [];
    var top;
    var right;
    var left;
    var bottom;

    if (i - 2 > 0) {
      top = grid[i - 2][j];
    }
    if (i + 2 < rows - 1) {
      bottom = grid[i + 2][j];
    }
    if (j - 2 > 0) {
      left = grid[i][j - 2];
    }
    if (j + 2 < cols - 1) {
      right = grid[i][j + 2];
    }

    if (top && top.type == "none") {
      neighbors.push(top);
    }
    if (right && right.type == "none") {
      neighbors.push(right);
    }
    if (bottom && bottom.type == "none") {
      neighbors.push(bottom);
    }
    if (left && left.type == "none") {
      neighbors.push(left);
    }

    if (neighbors.length > 0) {
      var r = floor(random(0, neighbors.length));

      return neighbors[r];
    } else {
      return undefined;
    }
  }
}

function findCellBetween(a, b) {
  var y = a.i - b.i;
  var x = a.j - b.j;
  var cell;
  if (x < 0) {
    cell = grid[a.i][a.j + 1];
  } else if (x > 0) {
    cell = grid[a.i][a.j - 1];
  }

  if (y < 0) {
    cell = grid[a.i + 1][a.j];
  } else if (y > 0) {
    cell = grid[a.i - 1][a.j];
  }

  return cell;
}

function addWalls(a, b) {
  var y = a.i - b.i;
  var x = a.j - b.j;
  if (y != 0) {
    if (grid[a.i][a.j - 1].type != "path") {
      grid[a.i][a.j - 1].type = "wall";
    }
    if (grid[a.i][a.j + 1].type != "path") {
      grid[a.i][a.j + 1].type = "wall";
    }
  }
  if (x != 0) {
    if (grid[a.i - 1][a.j].type != "path") {
      grid[a.i - 1][a.j].type = "wall";
    }
    if (grid[a.i + 1][a.j].type != "path") {
      grid[a.i + 1][a.j].type = "wall";
    }
  }
}

function createMaze() {
  let completed = false;
  for (var i = 0; i < rows; i++) {
    for (var j = 0; j < cols; j++) {
      grid[i][j].type = "none";
    }
  }

  current = grid[1][1];
  while (!completed) {
    current.type = "path";
    var next = current.checkNeighbors();
    if (next) {
      next.type = "path";
      var cellB = findCellBetween(current, next);
      cellB.type = "path";
      //addWalls(cellB, next);
      //stack.push(cellB);
      stack.push(current);
      //addWalls(current, next);
      current = next;
    } else if (stack.length > 0) {
      current = stack.pop();
    }

    if (stack.length == 0 && next == undefined && completed == false) {
      completed = true;
      for (var x = 0; x < rows; x++) {
        for (var y = 0; y < cols; y++) {
          if (grid[x][y].type == "none") {
            grid[x][y].type = "wall";
          }
        }
      }

      var numPaths = cols;
      var k = 0;
      while (k < numPaths) {
        var c = grid[floor(random(1, rows - 1))][floor(random(1, cols - 1))];
        if (c.type == "wall" && ((grid[c.i-1][c.j].type == "path" && grid[c.i+1][c.j] == "path" && grid[c.i][c.j-1].type == "wall" && grid[c.i][c.j+1].type == "wall") || (grid[c.i][c.j-1].type == "path" && grid[c.i][c.j+1].type == "path" && grid[c.i-1][c.j].type == "wall" && grid[c.i+1][c.j].type == "wall"))) {
          c.type = "path";
          k++;
        }
      }
    }
  }
}

function findNeighbors(n) {
  let neighbors = [];
  if (n.j > 0) {
    neighbors.push(grid[n.i][n.j-1]);
  }
  if (n.j < cols) {
    neighbors.push(grid[n.i][n.j+1]);
  }
  if (n.i > 0) {
    neighbors.push(grid[n.i -1][n.j]);
  }
  if (n.i < rows) {
    neighbors.push(grid[n.i + 1][n.j]);
  }

  return neighbors;
}

function getDistance(a, b) {
  return floor(sqrt(pow(a.i - b.i, 2) + pow(a.j - b.j, 2)));
}

function findPath(start, end) {
  let open = [];
  let closed = [];
  let path = [];
  let currNode;
  open.push(start);

  while (open.length > 0) {
    let curNode = open[0];
    for (var i = 1; i < open.length; i++) {
      if (open[i].getfCost() < curNode.getfCost() || open[i].getfCost == curNode.getfCost() && open[i].h < curNode.h) {
        curNode = open[i];
      }
    }

    open.splice(open.indexOf(curNode), 1);
    closed.push(curNode);

    if (curNode == end) {
      currNode = end;
    }
    curNeighbors = findNeighbors(curNode);
    for ( let neighbor of curNeighbors) {
      if (neighbor.type == "wall" || closed.indexOf(neighbor) != -1) {
        continue;
      }

      let newCostToNeighbor = curNode.g + getDistance(curNode, neighbor);
      if (newCostToNeighbor < neighbor.g || open.indexOf(neighbor) == -1) {
        neighbor.gCost = newCostToNeighbor;
        neighbor.hCost = getDistance(neighbor, end);
        neighbor.parent = curNode;

        if (open.indexOf(neighbor) == -1) {
          open.push(neighbor);
        }
      }
    }
  }

  while (currNode != start) {
    path.push(currNode);
    currNode = currNode.parent;
  }
  path.push(start);
  return path;
}
