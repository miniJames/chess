
class bishop extends chessPiece {


  void show() {
    desc="Bishop";
    calculate();
    fill(c);
    textSize(40);
    //text('B', x+offset, y-offset);
    if (pieceColor==WHITE) {
      image(cpi.WBishop, x+20, y-80 );
    } else if (pieceColor==BLACK) {
      image(cpi.BBishop, x+20, y-80 );
    }
  }



  void generateMoves2(chessBoard cb) {

    takePieces=new StringList();
    currentMoves=new StringList();
    PVector l = convertLocation(loc);
    //diagonals
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
        if ( target==null ) {  
          if (currentMoves.index(ln)<0) {
            currentMoves.append(ln);
            //println("diagonal ADDING : " + ln);
          } 
          yoff+=100;
        } else {  
          target= cb.isSquareOccupied(xoff, yoff, this);
          if (target.pieceColor!=this.pieceColor) {

            takePieces.append(ln);
          } 
          break;
        }    
        if (yoff>=900) break;
      }
    }
    yoff=y-200;
    //up left
    println("UPLEFT START");
    for (float xoff =x-100; xoff>0; xoff-=100) {
      println(xoff);
      if (xoff>= 100 && yoff>0) {
        chessPiece target =cb.isSquareOccupied(xoff, yoff, this);

        String ln=cb.convertXY(xoff/100, yoff/100);
        if (target==null) {
          //rect(xoff+1, yoff+1, 98, 98);
          if (currentMoves.index(ln)<0) {
            currentMoves.append(ln);
          }
        } else { 
          if (target.pieceColor!=this.pieceColor) {

            takePieces.append(ln);
          }
          break;
        }
        yoff-=100;
      }
    }
    println("UPLEFT END");
    yoff=y;
    // down left
    for (float xoff =x-100; xoff>0; xoff-=100) {
      println(yoff);
      if (yoff<900 && xoff<900) {
        chessPiece target =cb.isSquareOccupied(xoff, yoff, this);

        String ln=cb.convertXY(xoff/100, yoff/100);
        if (target==null) {
          //    //rect(xoff+1, yoff+1, 98, 98);
          if (currentMoves.index(ln)<0) {
            currentMoves.append(ln);
          }
        } else { 
          if (target.pieceColor!=this.pieceColor) {

            takePieces.append(ln);
          }
          break;
        }
        yoff+=100;
      }
      //  if (yoff<=0) break;
    }
    //up right
    yoff=y-200;
    for (float xoff =x+100; xoff<900; xoff+=100) {
      println(yoff);
      if (yoff>0 && xoff<900) {
        chessPiece target =cb.isSquareOccupied(xoff, yoff, this);

        String ln=cb.convertXY(xoff/100, yoff/100);
        if (target==null) {
          //    //rect(xoff+1, yoff+1, 98, 98);
          if (currentMoves.index(ln)<0) {
            currentMoves.append(ln);
          }
        } else { 
          if (target.pieceColor!=this.pieceColor) {

            takePieces.append(ln);
          }
          break;
        } 
        yoff-=100;
      }
    }
  }

  //void generateMoves(chessBoard cb) {
  //  PVector l = convertLocation(loc);
  //  println(l);
  //  stroke(0, 255, 0);
  //  //diagonals
  //  //start at location.
  //  float yoff=y-100;

  //  for (float xoff =x; xoff<900; xoff+=100) {
  //    //println(off);
  //    chessPiece target=cb.isSquareOccupied(xoff, yoff, this);
  //    if (target==null) {
  //      rect(xoff, yoff, 100, 100);
  //      yoff+=100;
  //    } else if (target!=this) {        
  //      if (target.c==c) {
  //        break;
  //      } else {
  //        stroke(255, 255, 0);
  //        rect(xoff, yoff, 100, 100);    
  //        stroke(0, 255, 0);
  //        break;
  //      }
  //    }
  //    if (yoff<=0 || yoff>=900) {
  //      break;
  //    }
  //  }
  //  yoff=y-100;

  //  for (float xoff =x; xoff>0; xoff-=100) {
  //    //println(off);
  //    chessPiece target=cb.isSquareOccupied(xoff, yoff, this);
  //    if (target==null) {
  //      rect(xoff, yoff, 100, 100);
  //      yoff-=100;
  //    } else if (target!=this) {
  //      if (target.c==c) {
  //        break;
  //      } else {
  //        stroke(255, 255, 0);
  //        rect(xoff, yoff, 100, 100);    
  //        stroke(0, 255, 0);
  //        break;
  //      }
  //    }      
  //    if (yoff<=0 || yoff>=900) {
  //      break;
  //    }
  //  }
  //  yoff=y-100;
  //  for (float xoff =x; xoff<900; xoff+=100) {
  //    //println(off);
  //    chessPiece target=cb.isSquareOccupied(xoff, yoff, this);
  //    if (target==null) {
  //      rect(xoff, yoff, 100, 100);
  //      yoff-=100;
  //    } else  if (target!=this) {
  //      if (target.c==c) {
  //        break;
  //      } else {
  //        stroke(255, 255, 0);
  //        rect(xoff, yoff, 100, 100);    
  //        stroke(0, 255, 0);
  //        break;
  //      }
  //    }  
  //    if (yoff<=0 || yoff>=900) {
  //      break;
  //    }
  //  }

  //  yoff=y-100;
  //  for (float xoff =x; xoff>0; xoff-=100) {
  //    //println(off);
  //    chessPiece target=cb.isSquareOccupied(xoff, yoff, this);
  //    if (target==null) {
  //      rect(xoff, yoff, 100, 100);
  //      yoff+=100;
  //    } else {
  //      if (target.c==c) {
  //        break;
  //      } else {
  //        stroke(255, 255, 0);
  //        rect(xoff, yoff, 100, 100);    
  //        stroke(0, 255, 0);
  //        break;
  //      }
  //    }
  //    if (yoff<=0 || yoff>=900) {
  //      break;
  //    }
  //  }

  //  stroke(0);
  //}
}
