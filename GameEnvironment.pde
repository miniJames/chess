class GameEnvironment {

  chessBoard cb;
  ChessPlayer cp;


  int white = 255;
  int black = 0;
  int gameState = 0;
  int preGame=0;
  int player1=1;
  int player2=2;


  GameEnvironment() {
    cpi=new ChessPieceImages();

    //noLoop();
    cb=new chessBoard();
    cp=new ChessPlayer();
  }

  void show() {

    if (gameState==0) {
      //pregame. 
      background(0);

      text("<s> to start", 200, 200);
    } else if (gameState == player1) {

      cb.show();
    } else if (gameState==player2) {
      //move the player selected piece to the destination.
      String dest =cp.selectMove(cb);
      chessPiece pc = cp.selectedPiece;

      pc.loc=dest;

      //remove the item in that place on the chess board.
      //for (chessPiece cp : cb.black) {
      //  if (cp.loc.equals(dest)) {
      //    // 
      //    cb.black.remove(cp);
      //    //takenPieces.add(cp);
      //    break;

      //  }

      //}
      for (chessPiece cp : cb.white) {
        if (cp.loc.equals(dest)) {
          //
          cb.white.remove(cp);
          cb.takenPieces.add(cp);
          break;
        }
      }
      cb.show();


      gameState=player1;
    }
    int count = 0;
    for (chessPiece t : cb.takenPieces) {
      textSize(10); 
      stroke(0);
      text(count + ":" + t.desc + ":" + t.pieceColor, 10, 10+ (10*count));
      count++;
    }
  }
  void keyDown(char k) {

    if (gameState==0) {
      if (key== 's'  || key == 'S') {
        gameState=player1;
      }
    }
  }
  void mouseClick() {
    if (gameState==0) {
    } else if (gameState==player1) {

      cb.mouseClick();

      if (cb.moveMode==notMoving && cb.pieceMoved) {
        gameState=player2;
      }
    }
  }
}
