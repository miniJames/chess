class king extends chessPiece {

  void show() {
    desc="King";
    calculate();
    //fill(c);
    textSize(40);
    if (pieceColor==WHITE) {
      image(cpi.WKing, x+20, y-80 );
    } else if (pieceColor==BLACK) {
      image(cpi.BKing, x+20, y-80 );
    }
    //text('K', x+offset, y-offset);
  }
  void generateMoves2(chessBoard cb) {
    PVector l = convertLocation(loc);
    //println("TEST");
    takePieces=new StringList();
    currentMoves=new StringList();
    //StringList rtrn= new StringList();
    //vertical up
    //for (float yoff =l.y; yoff>l.y-200; yoff-=100) {
    if (l.y>100) {
      chessPiece target = cb.isSquareOccupied(l.x, l.y-100, this);
      String ln=  cb.convertXY(l.x/100, (l.y-100)/100);
      if (target == null) {
        //String targetLoc = ln;
        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=this.pieceColor) {

          takePieces.append(ln);
        }

        //break;
      }
    }
    //}    
    //vertical up - left
    if (l.y>100 && l.x > 100) {
      chessPiece target = cb.isSquareOccupied(l.x-100, l.y-100, this);
      String ln=  cb.convertXY((l.x-100)/100, (l.y-100)/100); 
      if (target == null) {

        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=this.pieceColor) {

          takePieces.append(ln);
        }
        //break;
      }
    }
    //vertical down

    if (l.y<800) {
      //println("down");
      chessPiece target = cb.isSquareOccupied(l.x, l.y+100, this);
      String ln=  cb.convertXY(l.x/100, (l.y+100)/100) ;
      if (target== null) {
        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=this.pieceColor) {

          takePieces.append(ln);
        }

        //break;
      }
    }

    ////down left

    if (l.y<800 && l.x > 100) {
      chessPiece target = cb.isSquareOccupied(l.x-100, l.y+100, this);
      String ln=  cb.convertXY((l.x-100)/100, (l.y+100)/100);
      if (target== null) {
        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=this.pieceColor) {

          takePieces.append(ln);
        }

        //break;
      }
    }

    //left
    if (l.x>100) {
      chessPiece target =cb.isSquareOccupied(l.x-100, l.y, this);
      String ln=  cb.convertXY((l.x-100)/100, l.y/100);
      if (target==null) {
        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=this.pieceColor) {

          takePieces.append(ln);
        }

        //break;
      }
    }

    //right
    if (l.x < 800) {

      chessPiece target =cb.isSquareOccupied(l.x+100, l.y, this);
      String ln=  cb.convertXY((l.x+100)/100, l.y/100);
      if (target==null) {
        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=this.pieceColor) {

          takePieces.append(ln);
        }
        //break;
      }
    }

    ////right - up
    if (l.x<800 &&  l.y>100) {
      chessPiece target=cb.isSquareOccupied(l.x+100, l.y-100, this);
      String ln=  cb.convertXY((l.x+100)/100, (l.y-100)/100);
      if (target==null) {
        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=this.pieceColor) {

          takePieces.append(ln);
        }
        //break;
      }
    }


    //right - down
    if (l.x<800 && l.y<800) {
      chessPiece target =cb.isSquareOccupied(l.x+100, l.y+100, this);
      String ln= cb.convertXY((l.x+100)/100, (l.y+100)/100);
      if (target==null) {
        currentMoves.append(ln);
      } else {
        if (target.pieceColor!=this.pieceColor) {

          takePieces.append(ln);
        }
        // break;
      }
    }
  }
  //void generateMoves(chessBoard cb) {
  //  PVector l = convertLocation(loc);
  //  //println(l);
  //  stroke(0, 255, 0);
  //  //vertical up
  //  for (float yoff =l.y; yoff>l.y-200; yoff-=100) {
  //    //println("CONVERTED LOCATION:"+loc);
  //    if (l.y>100) {
  //      chessPiece target = cb.isSquareOccupied(l.x, yoff, this);
  //      if (target == null) {
  //        //println(off);
  //        rect(l.x, yoff, 100, 100);
  //      } else {
  //        if (target.c==c) {
  //          break;
  //        } else {

  //          stroke(255, 255, 0);
  //          rect(l.x, yoff, 100, 100);
  //          stroke(0, 255, 0);
  //          break;
  //        }
  //      }
  //    }
  //  }
  //  //vertical down
  //  for (float yoff =l.y; yoff<l.y+200; yoff+=100) {
  //    //println("CHECKING: "+l.x + " " + yoff );
  //    if (l.y<800) {
  //      chessPiece target = cb.isSquareOccupied(l.x, yoff, this);
  //      if (target== null) {

  //        //println("NO");
  //        //println(yoff);
  //        //println(l.x);
  //        rect(l.x, yoff, 100, 100);
  //      } else {
  //        if (target.c==c) {
  //          break;
  //        } else {
  //          stroke(255, 255, 0);
  //          rect(l.x, yoff, 100, 100);
  //          stroke(0, 255, 0);
  //          break;
  //        }
  //      }
  //    }
  //  }
  //  //horizontal
  //  for (float off =l.x; off>l.x-200; off-=100) {
  //    //println(off);
  //    if (l.x>100) {
  //      chessPiece target =cb.isSquareOccupied(off, l.y, this);
  //      if (target==null) {
  //        rect(off, l.y, 100, 100);
  //      } else {
  //        if (target.c==c) {
  //          break;
  //        } else {
  //          stroke(255, 255, 0);
  //          rect(off, l.y, 100, 100);
  //          stroke(0, 255, 0);
  //          break;
  //        }
  //      }
  //    }
  //  }
  //  for (float off =l.x; off<l.x+200; off+=100) {
  //    //println(off);
  //    if (l.x<800) {
  //      chessPiece target=cb.isSquareOccupied(off, l.y, this);
  //      if (target==null) {
  //        rect(off, l.y, 100, 100);
  //      } else {
  //        if (target.c ==c) {
  //          break;
  //        } else {
  //          stroke(255, 255, 0);
  //          rect(off, l.y, 100, 100);
  //          stroke(0, 255, 0);
  //          break;
  //        }
  //      }
  //    }
  //  }
  //  stroke(0);
  //}
}
