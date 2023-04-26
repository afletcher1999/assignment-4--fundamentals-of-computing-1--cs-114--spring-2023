void setup() {
  size(500, 500);
  initializeBoard();
}

void draw() { //moving this to void keyPressed() was causing strange responsiveness issues and graphical bugs, so I moved the contents back to void draw()
  background(255);
  drawBoard();
  drawShapes();
}

void keyPressed() { 
  handleKeyPress(key);
}
