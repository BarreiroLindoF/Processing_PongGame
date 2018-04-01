public class Ball {

  PVector position;
  PVector direction;
  int ballSize = 10;
  Touched touched = Touched.NOT_TOUCHED;
  
  public Ball(PVector position) {
    this.position = position;
    this.direction = this.getRandomDirection();
  }
  
  public void render() {
    ellipse(this.position.x, this.position.y, ballSize, ballSize);
  }
  
  public void move() {
    this.position.add(direction);
    if (this.hitPlayersPaddle() || this.hitCpuPaddle()) {
      this.revertXDirection();
    }
    if (this.position.y <= 0 || this.position.y >= height-1) {
      this.revertYDirection();
    }
  }
  
  public boolean hasTouchedWall() {
    if (this.position.x <= 0) {
      this.touched = Touched.LEFT;
      return true;
    }
    if (this.position.x >= width - 1 ) {
      this.touched = Touched.RIGHT;
      return true;
    }
    return false;
  }
  
  public void reset() {
    this.position = new PVector(height /2, width /2);
    this.direction = this.getRandomDirection();
    this.touched = Touched.NOT_TOUCHED;
  }
  
  private PVector getRandomDirection() {
    float xValue = random(2,3);
    if (Math.random() <= 0.5) {
      xValue = xValue * -1;
    }
    return new PVector(xValue , random(-1,1));
  }
  
  private boolean hitPlayersPaddle() {
    if (this.position.x <= player.paddle.position.x + player.paddle.paddle_width) {
      // it reached the players paddle
      if (this.position.y < player.paddle.position.y) {
        // the ball is above the players paddle
        return false;
      }
      if (this.position.y > player.paddle.position.y + player.paddle.paddle_height) {
        // the ball is bellow the players paddle
        return false;
      }
      // the ball has touched the paddle
      return true;
    }
    // the ball has not reached the players paddle yet
    return false;
  }
  
  private boolean hitCpuPaddle() {
    if (this.position.x + this.ballSize >= cpu.paddle.position.x) {
        // it reached the players paddle
        if (this.position.y < cpu.paddle.position.y) {
          // the ball is above the players paddle
          return false;
        }
        if (this.position.y > cpu.paddle.position.y + cpu.paddle.paddle_height) {
          // the ball is bellow the players paddle
          return false;
        }
        // the ball has touched the paddle
        return true;
      }
      // the ball has not reached the players paddle yet
      return false;
  }
  
  private void revertXDirection() {
    this.direction.x = this.direction.x * -1;
  }
  
  private void revertYDirection() {
    this.direction.y = this.direction.y * -1;
  }
  
}
