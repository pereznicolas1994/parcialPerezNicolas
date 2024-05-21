GameObject jugador;
CoinSpawner spawner;
ArrayList<Coin> monedas = new ArrayList<Coin>();
int contadorMonedasTocandoSuelo = 0;
PImage gamepadImage;

// 
void setup() {
  size(400, 400);
  jugador = new GameObject(width / 2, height - 50) {
    void display() {
      fill(0, 0, 255);
      rect(x, y, 50, 50);
    }
    
    void update() {
      // Control del jugador con el gamepad
      if (keyPressed) {
        if (key == CODED) {
          if (keyCode == LEFT && x > 0) {
            x -= 5;
          } else if (keyCode == RIGHT && x < width - 50) {
            x += 5;
          }
        }
      }
    }
  };
  
  spawner = new CoinSpawner(width / 2, 50);
  gamepadImage = loadImage("gamepadImage.png");
}

// 
void draw() {
  background(255);
  
  // 
  jugador.update();
  jugador.display();
  
  // 
  spawner.update();
  
  // Generar nuevas monedas
  if (frameCount % 60 == 0) {
    monedas.add(spawner.spawnCoin());
  }
  
  // 
  for (int i = monedas.size() - 1; i >= 0; i--) {
    Coin moneda = monedas.get(i);
    moneda.update();
    moneda.display();
  }
  
  // 
  image(gamepadImage, width - 70, height - 70, 60, 60);
  
  // Mostrar contador de monedas tocadas suelo
  textSize(20);
  fill(0);
  text("Monedas tocando suelo: " + contadorMonedasTocandoSuelo, 20, 30);
}
