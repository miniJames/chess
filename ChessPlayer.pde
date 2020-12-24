class ChessPlayer {

  int pieceColor = BLACK;

  chessPiece selectedPiece;

  String selectMove(chessBoard cb) {
    selectedPiece=null;
    String rtrn = "";

    ArrayList<chessPiece> mvs = new ArrayList<chessPiece>();

    for (chessPiece cp : cb.black) {
      cp.generateMoves2(cb);
      StringList moves = cp.currentMoves;
      if (cp.takePieces.size() > 0) {
        //if(moves.size()>0){
        mvs.add(cp);
        //}
      }
    }

    if (mvs.size() ==0) {
      for (chessPiece cp : cb.black) {
        //cp.generateMoves2(cb);
        StringList moves = cp.currentMoves;
        if (moves!=null) {
          if (moves.size()>0) {
            mvs.add(cp);
          }
        }
      }
    }

    int itm=floor(random(mvs.size()));



    selectedPiece=mvs.get(itm);
    //selectedPiece.generateMoves2(cb);
    StringList availableMoves=selectedPiece.currentMoves ;
    println(availableMoves);


    if (selectedPiece.takePieces.size() > 0 ) {
      availableMoves=new StringList();
    }
    for (String s : selectedPiece.takePieces) {
      availableMoves.append(s);
    }
    int mv= floor(random(availableMoves.size()));
    rtrn=availableMoves.get(mv);

    println("Player moves to " + selectedPiece +":"+ rtrn);

    return rtrn;
  }
}
