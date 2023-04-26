char[][] board;
boolean gameEnded = false;

void initializeBoard() {
  board = new char[BOARD_SIZE][BOARD_SIZE]; 
  for (int row = 0; row < BOARD_SIZE; row++) {
    for (int col = 0; col < BOARD_SIZE; col++) {
      board[row][col] = '-';
    }
  }
  computerMove();
}

void handleKeyPress(char key) {
  if (!gameEnded) {
    int cell = key - '0';
    if (cell >= 0 && cell <= 8) {
      int row = cell / BOARD_SIZE;
      int col = cell % BOARD_SIZE;
      if (board[row][col] == '-') {
        board[row][col] = 'O';
        checkGameState();
        if (!gameEnded) {
          computerMove();
          checkGameState();
        }
      } else {
        println("The cell is already occupied. Try another cell.");
      }
    } else {
      println("Incorrect key. Press a key between 0 and 8.");
    }
  } else {
    println("The game has ended. Restart the application to play again.");
  }
}

void computerMove() { //allows the computer to play, while also randomizing computer selection of cells
  int row;
  int col;  
  do {
    row = int(random(BOARD_SIZE));
    col = int(random(BOARD_SIZE));
  } while (board[row][col] != '-');  
  board[row][col] = 'X';
}

void checkGameState() {
  char winner = checkWinner();
  if (winner == 'X' || winner == 'O') {
    gameEnded = true;
    println(winner + " has won!");
  } else if (isBoardFull()) {
    gameEnded = true;
    println("It's a draw!");
  } else {
    println("The game is still in play.");
  }
}

boolean isBoardFull() {
  for (int row = 0; row < BOARD_SIZE; row++) {
    for (int col = 0; col < BOARD_SIZE; col++) {
      if (board[row][col] == '-') {
        return false;
      }
    }
  }
  return true;
}

char checkWinner() {
  for (int[] combination : WINNING_COMBINATIONS) {
    char a = board[combination[0] / BOARD_SIZE][combination[0] % BOARD_SIZE];
    char b = board[combination[1] / BOARD_SIZE][combination[1] % BOARD_SIZE];
    char c = board[combination[2] / BOARD_SIZE][combination[2] % BOARD_SIZE];    
    if (a == b) {
      if(b == c) {
        if(a != '-') {
          return a;
        }
      }
    } 
  }
  return '-';
}
