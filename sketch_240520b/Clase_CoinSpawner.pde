class CoinSpawner {
  float x, y;
  
  CoinSpawner(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  Coin spawnCoin() {
    return new Coin(x, y);
  }
  
  void update() {
    // 
    x += random(-3, 3);
    if (x < 0) {
      x = 0;
    } else if (x > width) {
      x = width;
    }
  }
}
