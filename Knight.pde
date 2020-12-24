
class knight extends chessPiece {
   
  //void generateMoves() {

  //  // ----------------------------
  //  //                                                          
  //  //                             
  //  //         H     A              
  //  //                             
  //  //      G            B          
  //  //            Kn                 
  //  //                             
  //  //      F            C          
  //  //                             
  //  //        E       D             
  //  //                             
  //  //                             
  //  //                             

  //}
  void show() {
    desc = "Knight";
    calculate();
    fill(c);
    textSize(40);
    //text("Kn", x+offset, y-offset);
    if (pieceColor==WHITE) {
      image(cpi.WKnight, x+20, y-80 );
    } else if (pieceColor==BLACK) {
      image(cpi.BKnight, x+20, y-80 );
    }
  }

  void generateMoves2(chessBoard cb) {

    //StringList rtrn = new StringList();
    currentMoves=new StringList();
    takePieces=new StringList();
    PVector l=convertLocation(loc);
    //A
    println("A-Start");
    println(l);
    if (l.y>200 && l.x < 800) {
      chessPiece target = cb.isSquareOccupied(l.x + 100, l.y - 200, this)  ; 
      String ln=  cb.convertXY((l.x + 100)/100, (l.y - 200)/100);
      if (target==null) {
        currentMoves.append(ln);
      } else {
        //if (target.pieceColor!=pieceColor) {
        if (takePiece(target)) {
          takePieces.append(ln);
        }
      }
    }
    println("A-End");
    //H
    println("H-Start");
    println(l);
    if (l.y>=300 && l.x > 100) {
      chessPiece target = cb.isSquareOccupied(l.x - 100, l.y - 200, this)  ; 
      String ln=  cb.convertXY((l.x-100)/100, (l.y-200)/100);
      if (target==null) {
        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=pieceColor) {
          takePieces.append(ln);
        }
      }
    }
    println("H-End");
    //B
    if (l.y > 100 && l.y<=900 && l.x <   700) {
      println("B-Start");
      println(l);

      chessPiece target = cb.isSquareOccupied(l.x + 200, l.y - 100, this)  ;
      String ln=  cb.convertXY((l.x+200)/100, (l.y-100)/100);
      if (target==null) {
        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=pieceColor) {
          takePieces.append(ln);
        }
      }
      println("B-End");
    }
    //G
    println("G-Start");
    println(l);
    if (l.y > 100 && l.y<=900 && l.x > 200 ) {
      chessPiece target = cb.isSquareOccupied(l.x - 200, l.y - 100, this)  ; 
      String ln=  cb.convertXY((l.x-200)/100, (l.y-100)/100);
      if (target==null) {
        currentMoves.append(cb.convertXY((l.x-200)/100, (l.y-100)/100));
      } else {
        if (target.pieceColor!=pieceColor) {
          takePieces.append(ln);
        }
      }
    }
    println("G-End");


    //C
    println("C-Start");
    println(l);
    if (l.y<800 && x < 700 ) {
      chessPiece target = cb.isSquareOccupied(l.x + 200, l.y + 100, this)  ;
      String ln= cb.convertXY((l.x+200)/100, (l.y+100)/100);
      if (target==null) {
        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=pieceColor) {
          takePieces.append(ln);
        }
      }
    }
    println("C-End");

    //F
    println("F-Start");
    println(l);
    if (l.y<800 && l.x > 200) {
      chessPiece target = cb.isSquareOccupied(l.x - 200, l.y + 100, this)  ;
      String ln= cb.convertXY((l.x-200)/100, (l.y+100)/100);
      if (target==null) {
        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=pieceColor) {
          takePieces.append(ln);
        }
      }
    }
    println("F-End");
    //D
    println("D-Start");
    if (  l.y< 700 &&   l.x < 800) {

      println(l);

      chessPiece target = cb.isSquareOccupied(l.x + 100, l.y + 200, this)  ;
      String ln= cb.convertXY((l.x+100)/100, (l.y+200)/100);
      if (target==null) {
        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=pieceColor) {
          takePieces.append(ln);
        }
      }
    }
    println("D-End");
    //E
    println("E-Start");
    if (  l.y<700 && l.x > 100   ) {

      println(l);
      String ln= cb.convertXY((l.x-100)/100, (l.y+200)/100);
      chessPiece target = cb.isSquareOccupied(l.x - 100, l.y + 200, this)  ; 
      if (target==null) {
        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=pieceColor) {
          takePieces.append(ln);
        }
      }
    }
    println("E-End");
  }
}
