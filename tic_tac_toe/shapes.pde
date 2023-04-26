void drawBoard() {
  strokeWeight(5);
  for (int i = 1; i < BOARD_SIZE; i++) {
    line(i * CELL_SIZE, 0, i * CELL_SIZE, height);
    line(0, i * CELL_SIZE, width, i * CELL_SIZE);
  }
}

void drawShapes() {
  for (int i = 0; i < BOARD_SIZE; i++) {
    for (int j = 0; j < BOARD_SIZE; j++) {
      if (board[i][j] == 'X') {
        drawX(j, i);
      } else if (board[i][j] == 'O') {
        drawO(j, i);
      }
    }
  }
}

void drawO(int x, int y) {
  noFill();
  strokeWeight(5);
  ellipse(x * CELL_SIZE + CELL_SIZE / 2, y * CELL_SIZE + CELL_SIZE / 2, CELL_SIZE * 0.8, CELL_SIZE * 0.8);
}

void drawX(int x, int y) {
  strokeWeight(5);
  line(x * CELL_SIZE + CELL_SIZE * 0.2, y * CELL_SIZE + CELL_SIZE * 0.2, (x + 1) * CELL_SIZE - CELL_SIZE * 0.2, (y + 1) * CELL_SIZE - CELL_SIZE * 0.2);
  line((x + 1) * CELL_SIZE - CELL_SIZE * 0.2, y * CELL_SIZE + CELL_SIZE * 0.2, x * CELL_SIZE + CELL_SIZE * 0.2, (y + 1) * CELL_SIZE - CELL_SIZE * 0.2);
}
