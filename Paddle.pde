public class Paddle {
  
  PVector position;
  int paddle_width = 20;
  int paddle_height = 200;
  int paddle_speed = 5;
  
  public Paddle(PVector position, int paddle_width, int paddle_height) {
    this.position = position;
    this.paddle_width = paddle_width;
    this.paddle_height = paddle_height;
  }
  
  public void render() {
    rect(this.position.x, this.position.y, this.paddle_width, this.paddle_height);
  }
  
  public void goUp() {
    if (this.position.y <= 0) return;
    this.position.y -= this.paddle_speed;
  }
  
  public void goDown() {
    if (this.position.y + paddle_height >= height) return;
    this.position.y += this.paddle_speed;
  }
  
}
