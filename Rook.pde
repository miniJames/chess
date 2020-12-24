
class rook extends chessPiece {


  void show() { 
    desc="Rook";
    calculate();
    fill(c);
    textSize(40);

    if (pieceColor==WHITE) {
      image(cpi.WRook, x+20, y-80 );
    } else if (pieceColor==BLACK) {
      image(cpi.BRook, x+20, y-80 );
    }
  }

  void generateMoves2(chessBoard cb) {
    //StringList rtrn = new StringList();
    takePieces=new StringList();
    currentMoves = new StringList();
    PVector l = convertLocation(loc);
    //println("this PIECECOL:"+this.pieceColor);
    //vertical up
    //println("STart");

    takePieces=new StringList();


    ////vertical up
    for (float yoff=l.y-100; yoff>0; yoff-=100) {
      //println("CONVERTED LOCATION:"+loc);

      chessPiece target=cb.isSquareOccupied(l.x, yoff, this );

      if (!(target==this)) {
        if (target==null) {
          String ln=  cb.convertXY(l.x/100, yoff/100);
          //println(currentMoves.index(ln));
          if (currentMoves.index(ln)<0) {
            //println("ADDING1 : " + ln);


            //before sending the piece there, check.
            //chessBoard c = new chessBoard();
            //c=cb.createClone();



            currentMoves.append(ln);
          }

          //rect(l.x+1, yoff+1, 98, 98);
        } else {   
          if (target.pieceColor!=this.pieceColor) {

            takePieces.append(cb.convertXY(l.x/100, yoff/100));
          }

          break;
        }
      }
    }
    //vertical down
    for (float yoff =l.y+100; yoff<900; yoff+=100) {
      //println("CHECKING: "+l.x + " " + yoff );
      chessPiece target =  cb.isSquareOccupied(l.x, yoff, this);

      if (!(target==this)) {
        if (target==null) {
          String ln=cb.convertXY(l.x/100, yoff/100);
          if (currentMoves.index(ln)<0) {
            //println("ADDING2 : " + ln);
            currentMoves.append(cb.convertXY(l.x/100, yoff/100));
          }
        } else {   
          if (target.pieceColor!=this.pieceColor) {

            takePieces.append(cb.convertXY(l.x/100, yoff/100));
          }
          break;
        }
      }
    }
    //horizontal
    for (float off =l.x-100; off>0; off-=100) {
      //println(off + " **************");
      chessPiece target = cb.isSquareOccupied(off, l.y, this);
      String ln=cb.convertXY(off/100, l.y/100);
      if (!(target==this)) {
        if (target==null) { 
          //rect(off+1, l.y+1, 98, 98);
          if (currentMoves.index(ln)<0) {
            //println("ADDING3 : " + ln);
            currentMoves.append(ln);
          }
        } else {   
          if (target.pieceColor!=this.pieceColor) {

            takePieces.append(cb.convertXY(off/100, l.y/100));
          }
          break;
        }
      }
    }

    for (float off =l.x+100; off<900; off+=100) {
      //println(off);
      chessPiece target =cb.isSquareOccupied(off, l.y, this);
      if (!(target==this)) {
        String ln=cb.convertXY(off/100, l.y/100);
        if (target==null) {        
          //rect(off+1, l.y+1, 98, 98);
          if (currentMoves.index(ln)<0) {
            //println("ADDING4 : " + ln);
            currentMoves.append(cb.convertXY(off/100, l.y/100));
          }
        } else { 
          if (target.pieceColor!=this.pieceColor) {

            takePieces.append(cb.convertXY(off/100, l.y/100));
          }
          break;
        }
      }
    }
  }
}
