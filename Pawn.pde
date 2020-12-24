class pawn extends chessPiece {

  boolean firstMove = true;
  void show() { 
    desc="Pawn";

    calculate();
    fill(c);
    textSize(40);
    //text('P', x+offset, y-offset);
    if (pieceColor==WHITE) {
      image(cpi.WPawn, x+20, y-80 );
    } else if (pieceColor==BLACK) {
      image(cpi.BPawn, x+20, y-80 );
    }
  }


  void rules() {
    println("FIRSTMOVE=" + firstMove);
    if (firstMove) {
      firstMove=false;
    }
  }
  void generateMoves2(chessBoard cb) {
    PVector l = convertLocation(loc);
    takePieces=new StringList();
    currentMoves=new StringList();
    if (c<(128)) {
      dir= 1;
    } else {
      dir=-1;
    }

    int yoff = 100*dir;
    //StringList rtrn = new StringList();
    takePieces=new StringList();
    if (firstMove) {
      chessPiece dest = cb.isSquareOccupied(l.x, l.y+ yoff, this);
      if (firstMove && dest==null) {
        yoff = 200*dir;

        currentMoves.append(cb.convertXY(l.x/100, (l.y+yoff)/100));
        println ("HERE1");
        //yoff = 100*dir;
        //dest = cb.isSquareOccupied(l.x, l.y+ yoff, this);
        //if (dest==null) {
        //  currentMoves.append(cb.convertXY(l.x/100, (l.y+yoff)/100));
        //}
      }
    }  
    yoff = 100*dir;
    if (l.y>100 &&l.y<800) {
      yoff = 100*dir;
      chessPiece dest= cb.isSquareOccupied(l.x, l.y+ yoff, this);

      if ( dest==null ) {
        currentMoves.append(cb.convertXY(l.x/100, (l.y+yoff)/100));
      }
    }

    ////check diagonal one piece for opposite colour piece take.

    chessPiece dest= cb.isSquareOccupied(l.x+100, l.y+yoff, this);
    if (dest!=null) {

      if (dest.pieceColor!=this.pieceColor) {

        takePieces.append(cb.convertXY((l.x+100)/100, (l.y+yoff)/100));
      }
      //rect(l.x+100+1, l.y+yoff+1, 98, 98);
    } 
    if (l.x>100) {
      dest = cb.isSquareOccupied(l.x-100, l.y+yoff, this);
    } else {
      dest=null;
    }
    if (dest!=null) {
      if (dest.pieceColor!=this.pieceColor) {
        takePieces.append(cb.convertXY( (l.x-100)/100, (l.y+yoff)/100));
      }
      //rect(l.x-100+1, l.y+yoff+1, 98, 98);
      println("YES2");
    }

    //if (cb.isSquareOccupied(l.x+100, l.y+yoff, this, occupied)) {
    //  println("YES3");
    //  rect(l.x+100+1, l.y+yoff+1, 98, 98);
    //}
    //if ( cb.isSquareOccupied(l.x-100, l.y+yoff, this, occupied)) {
    //  rect(l.x-100+1, l.y+yoff+1, 98, 98);
    //  println("YES4");
    //}

    println("PAWN:" + currentMoves);
  }
  void generateMoves(chessBoard cb) {
    //set the colour of the available moves to green.
    //pawns direction depends on its colour.

    //multiply the location by the dir.
    println("pawn, show moves");
    //add condition for the first move of the game.
    //later

    //println("X:"+x +" Y:"+y);
    strokeWeight(7);
    PVector l = convertLocation(loc);
    println(l);
    println((c));
    if (c<(128)) {
      dir= 1;
    } else {
      dir=-1;
    }
    stroke(0, 255, 0);
    int yoff = 100*dir;

    println("YOFF:"+yoff);
    if (firstMove) {
      chessPiece dest = cb.isSquareOccupied(l.x, l.y+ yoff, this);
      if (dest==null) {
        yoff = 200*dir;
        rect(l.x, l.y+yoff, 100, 100);
        yoff = 100*dir;
      } else {
        if (dest.c ==c) {
          //break;
        } else {
          stroke(255, 255, 0);
          rect(l.x + 1, l.y+yoff +1, 98, 98);
        }
      }
    }
    println("l:"+l);
    println(l.x+100);
    println(l.y+yoff);
    //check diagonal one piece for opposite colour piece take.

    chessPiece dest = cb.isSquareOccupied(l.x+100, l.y+yoff, this);
    if (dest!=null) {
      stroke(255, 255, 0);
      rect(l.x+100+1, l.y+yoff+1, 98, 98);
      println("YES1");
    } 
    dest = cb.isSquareOccupied(l.x-100, l.y+yoff, this);
    if (dest!=null) {
      stroke(255, 255, 0);
      rect(l.x-100+1, l.y+yoff+1, 98, 98);
      println("YES2");
    }
    stroke(0);
    //if (cb.isSquareOccupied(l.x+100, l.y+yoff, this, occupied)) {
    //  println("YES3");
    //  rect(l.x+100+1, l.y+yoff+1, 98, 98);
    //}
    //if ( cb.isSquareOccupied(l.x-100, l.y+yoff, this, occupied)) {
    //  rect(l.x-100+1, l.y+yoff+1, 98, 98);
    //  println("YES4");
    //}     
    strokeWeight(1);
    stroke(0);
  }
}
