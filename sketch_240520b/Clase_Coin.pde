class Coin extends GameObject {
  Coin(float x, float y) {
    super(x, y);
  }
  
  void display() {
    fill(255, 255, 0);
    ellipse(x, y, 30, 30);
  }
  
  void update() {
    y += 3; // 
    if (y >= height) { // 
      incrementarContadorMonedasTocandoSuelo(); // Incrementar el contador
      monedas.remove(this); // Quitar la moneda del juego
    }
  }
  
  void incrementarContadorMonedasTocandoSuelo() {
    contadorMonedasTocandoSuelo++;
  }
}
