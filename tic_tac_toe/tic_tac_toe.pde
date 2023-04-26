void setup() {
  size(500, 500);
  initializeBoard();
}

void draw() { 
  background(255);
  drawBoard();
  drawShapes();
}

void keyPressed() { 
  handleKeyPress(key);
}
