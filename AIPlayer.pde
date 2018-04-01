public class AIPlayer extends Player {
  
  public AIPlayer(Paddle paddle) {
    super(paddle);
  }
  
  public void move() {
    if(ball.position.y - 5 < this.paddle.position.y + this.paddle.paddle_height / 2) {
      this.goUp();
    } else if (ball.position.y + 2 > this.paddle.position.y + this.paddle.paddle_height / 2) {
      this.goDown();
    }
  }
  
}
