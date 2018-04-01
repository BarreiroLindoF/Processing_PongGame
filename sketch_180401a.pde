Player player;
AIPlayer cpu;
Ball ball;

void setup() {
  size(400,400);
  player = new Player(new Paddle(new PVector(10,height/2-50),10, 50));
  cpu = new AIPlayer(new Paddle(new PVector(width-20,height/2-50),10, 50));
  ball = new Ball(new PVector(width/2, height/2));
}

void draw() {
  // reset canvas
  background(0);
  stroke(255);
  
  
  // render objects
  player.render();
  cpu.render();
  ball.render();
  
  // move objects
  ball.move();
  cpu.move();
  
  if (ball.hasTouchedWall()) {
    if (ball.touched == Touched.RIGHT) {
       player.awardPoint();
    } else if (ball.touched == Touched.LEFT) {
       cpu.awardPoint();
    }
    ball.reset();
  }
  renderScores();
  
}

void renderScores() {
  text("Player score: " + player.score, 20,20);
  String cpuScore = "CPU score: " + cpu.score;
  text(cpuScore, width - 20 - textWidth(cpuScore), 20);
}

void keyPressed() {
  if (keyCode == UP) {
    player.goUp();
  } else if (keyCode == DOWN) {
    player.goDown();
  }
}
