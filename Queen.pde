
class queen extends chessPiece {

  void show() { 
    desc="Queen";
    calculate();
    fill(c);
    textSize(40);
    //text('Q', x+offset, y-offset);
    if (pieceColor==WHITE) {
      image(cpi.WQueen, x+20, y-80 );
    } else if (pieceColor==BLACK) {
      image(cpi.BQueen, x+20, y-80 );
    }
  }

  void generateMoves2(chessBoard cb) {
    println("Queen GenerateMoves Start");
    //StringList rtrn = new StringList();
    currentMoves = new StringList();
    takePieces=new StringList();
    PVector l = convertLocation(loc);

    //vertical up
    for (float yoff=l.y-100; yoff>0; yoff-=100) {
      //println("CONVERTED LOCATION:"+loc);

      chessPiece target=cb.isSquareOccupied(l.x, yoff, this );

      if (!(target==this)) {
        if (target==null) {
          String ln=  cb.convertXY(l.x/100, yoff/100);
          //println(currentMoves.index(ln));
          if (currentMoves.index(ln)<0) {
            //println("ADDING1 : " + ln);
            currentMoves.append(ln);
          }

          //rect(l.x+1, yoff+1, 98, 98);
        } else {   
          //          if (target.pieceColor!=this.pieceColor) {
          if (takePiece(target)) {
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
          //if (target.pieceColor!=this.pieceColor) {
          if (takePiece(target)) {

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
          //if (target.pieceColor!=this.pieceColor) {
          if (takePiece(target)) {
            takePieces.append(ln);
          }
          break;
        }
      }
    }


    for (float off =l.x+100; off<900; off+=100) {
      //println(off + " **************");
      chessPiece target = cb.isSquareOccupied(off, l.y, this);
      String ln=cb.convertXY(off/100, l.y/100);
      if (!(target==this)) {
        if (target==null) { 

          if (currentMoves.index(ln)<0) {
            //println("ADDING3 : " + ln);
            currentMoves.append(ln);
          }
        } else {   
          //if (target.pieceColor!=this.pieceColor) {
          if (takePiece(target)) {
            takePieces.append(ln);
          }
          break;
        }
      }
    }

    //diagonals 
    //down right
    //start at location.
    float yoff=y  ;
    //println("X" + x);
    //float xoff =x+100;
    for (float xoff =x+100; xoff<900; xoff+=100) {
      //println("Xoff:" + xoff);
      //println("Yoff:" + yoff);
      if (yoff<900 && xoff < 900) {
        chessPiece target =cb.isSquareOccupied (xoff, yoff, this);
        String ln=cb.convertXY(xoff/100, yoff/100);
        //println("DIAGONAL TEsT " + ln);
        if (target==null ) {  
          if (currentMoves.index(ln)<0) {
            currentMoves.append(ln);
            //println("diagonal ADDING : " + ln);
          } 
          yoff+=100;
        } else {  
          target= cb.isSquareOccupied(xoff, yoff, this);
          //if (target.pieceColor!=this.pieceColor) {
          if (takePiece(target)) {
            takePieces.append(ln);
          }
          break;
        }    
        if (yoff>=900) break;
      }
    }
    yoff=y-200;
    //up left
    for (float xoff =x-100; xoff>0; xoff-=100) {
      //println(xoff);
      if (xoff>= 100 && yoff>100) {
        chessPiece target =cb.isSquareOccupied(xoff, yoff, this);

        String ln=cb.convertXY(xoff/100, yoff/100);
        if (target==null) {
          //rect(xoff+1, yoff+1, 98, 98);
          if (currentMoves.index(ln)<0) {
            currentMoves.append(ln);
          }

          yoff-=100;
        } else { 
          //if (target.pieceColor!=this.pieceColor) {
          if (takePiece(target)) {
            takePieces.append(cb.convertXY(xoff/100, yoff/100));
          }
          break;
        }
        if (yoff<=0) break;
      }
    }

    yoff=y;
    // down left
    for (float xoff =x-100; xoff>0; xoff-=100) {
      //println(yoff);
      if (yoff<900 && xoff<900) {
        chessPiece target =cb.isSquareOccupied(xoff, yoff, this);

        String ln=cb.convertXY(xoff/100, yoff/100);
        if (target==null) {
          //    //rect(xoff+1, yoff+1, 98, 98);
          if (currentMoves.index(ln)<0) {
            currentMoves.append(ln);
          }
          yoff+=100;
        } else { 
          //if (target.pieceColor!=this.pieceColor) {
          if (takePiece(target)) {
            takePieces.append(cb.convertXY(xoff/100, yoff/100));
          }
          break;
        }
      }
      //  if (yoff<=0) break;
    }
    //up right
    yoff=y-200;
    for (float xoff =x+100; xoff<900; xoff+=100) {
      //println(yoff);
      if (yoff>0 && xoff<900) {
        chessPiece target =cb.isSquareOccupied(xoff, yoff, this);

        String ln=cb.convertXY(xoff/100, yoff/100);
        if (target==null) {
          //    //rect(xoff+1, yoff+1, 98, 98);
          if (currentMoves.index(ln)<0) {
            currentMoves.append(ln);
          }
          yoff-=100;
        } else { 
          //if (target.pieceColor!=this.pieceColor) {
          if (takePiece(target)) {
            takePieces.append(cb.convertXY(xoff/100, yoff/100));
          }
          break;
        }
      }
      //  if (yoff<=0) break;
    }
    //println(":");
    println("Queen GenerateMoves END");
    println("Queen takepieces: " + takePieces);
  }
}
