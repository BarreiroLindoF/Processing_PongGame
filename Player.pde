public class Player {
  
  Paddle paddle;
  int score = 0;
  
  public Player (Paddle paddle) {
    this.paddle = paddle;
  }
  
  public void render() {
    this.paddle.render();
  }
  
  public void goUp() {
     this.paddle.goUp();
  }
  
  public void goDown() {
    this.paddle.goDown();
  }
  
  public void awardPoint() {
    this.score++;
  }

}
