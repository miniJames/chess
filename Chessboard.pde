int WHITE=1;
int BLACK=0;
int notMoving = 0;
int moving=1;

class chessBoard {
  ArrayList<chessPiece> takenPieces;
  ArrayList<chessPiece> white;
  ArrayList<chessPiece> black;
  String selected = "";
  chessPiece whiteKing;
  chessPiece blackKing;
  chessPiece selectedPiece;
  int notMoving = 0;
  int moving=1;
  int moveMode =notMoving;
  boolean pieceMoved=false;
  chessBoard() {
    takenPieces = new ArrayList<chessPiece>();
    white = new ArrayList<chessPiece>();
    black = new ArrayList<chessPiece>();
    chessPiece t;
    t=new pawn();
    t.loc="A2";
    t.SetColor(WHITE);
    white.add(t);

    t=new pawn();
    t.loc="A7";
    t.SetColor(BLACK);
    black.add(t);

    t=new pawn();
    t.loc="B2";
    t.SetColor(WHITE);
    white.add(t);
    t=new pawn();
    t.loc="B7";
    t.SetColor(BLACK);
    black.add(t);   

    t=new pawn();
    t.loc="C2";
    t.SetColor(WHITE);
    white.add(t);
    t=new pawn();
    t.loc="C7";
    t.SetColor(BLACK);
    black.add(t);

    t=new pawn();
    t.loc="D2";
    t.SetColor(WHITE);
    white.add(t);
    t=new pawn();
    t.loc="D7";
    t.SetColor(BLACK);
    black.add(t);

    t=new pawn();
    t.loc="E2";
    t.SetColor(WHITE);
    white.add(t);
    t=new pawn();
    t.loc="E7";
    t.SetColor(BLACK);
    black.add(t);

    t=new pawn();
    t.loc="F2";
    t.SetColor(WHITE);
    white.add(t);

    t=new pawn();
    t.loc="F7";
    t.SetColor(BLACK);
    black.add(t);    

    t=new pawn();
    t.loc="G2";
    t.SetColor(WHITE);
    white.add(t);
    t=new pawn();
    t.loc="G7";
    t.SetColor(BLACK);
    black.add(t);

    t=new pawn();
    t.loc="H2";
    t.SetColor(WHITE);
    white.add(t);
    t=new pawn();

    t.loc="H7";
    t.SetColor(BLACK);
    black.add(t);

    t=new queen();
    t.loc = "D1";
    t.SetColor(WHITE);
    white.add(t);
    t=new queen();
    t.loc = "D8";
    t.SetColor(BLACK);
    black.add(t);

    t=new king();
    t.loc = "E1";
    t.SetColor(WHITE);
    whiteKing=t;
    white.add(whiteKing);

    t=new king();
    t.loc = "E8";    
    t.SetColor(BLACK);
    blackKing=t;
    black.add(blackKing);


    t=new knight();
    t.loc = "B1";
    t.SetColor(WHITE);
    white.add(t);

    t=new knight();
    t.loc = "G1";
    t.SetColor(WHITE);
    white.add(t);

    t=new knight();
    t.loc = "B8";    
    t.SetColor(BLACK);
    black.add(t);

    t=new knight();
    t.loc = "G8";    
    t.SetColor(BLACK);
    black.add(t);

    t=new rook();
    t.loc = "A1";
    t.SetColor(WHITE);
    white.add(t);
    t=new rook();
    t.loc = "H1";
    t.SetColor(WHITE);
    white.add(t);

    t=new rook();
    t.loc = "A8";    
    t.SetColor(BLACK);
    black.add(t);
    t=new rook();
    t.loc = "H8";    
    t.SetColor(BLACK);
    black.add(t);

    t=new bishop();
    t.loc = "C1";
    t.SetColor(WHITE);
    white.add(t);
    t=new bishop();
    t.loc = "F1";
    t.SetColor(WHITE);
    white.add(t);

    t=new bishop();
    t.loc = "C8";    
    t.SetColor(BLACK);
    black.add(t);

    t=new bishop();
    t.loc = "F8";    
    t.SetColor(BLACK);

    black.add(t);
  }
  chessBoard(ArrayList<chessPiece> w, ArrayList<chessPiece> b) {
    white=w;
    black=b;
  }
  void show() {
    strokeWeight(1);

    showBoard();
    for (chessPiece cp : white) {

      cp.show();
      cp.generateMoves2(this);
    }
    for (chessPiece cp : black) {

      cp.show();
      cp.generateMoves2(this);
    }    
    mouseOverSquare();
    showSelected();
    if (selectedPiece!=null) {
      //selectedPiece.generateMoves(cb);
      //selectedPiece.generateMoves2(this);

      StringList t = selectedPiece.currentMoves;
      //println(t.get(3) + ":");
      for (int c = 0; c<t.size(); c++) {
        String s=t.get(c);  
        //println(s);
        PVector l = convertLocation(s);
        strokeWeight(5);
        stroke(0, 255, 0);
        rect(l.x, l.y, 100, 100);
      }
      //println(selectedPiece.takePieces);
      for (String take : selectedPiece.takePieces) {
        PVector l = convertLocation(take);
        strokeWeight(5);
        stroke(255, 0, 0);
        rect(l.x, l.y, 100, 100);
      }
    }    
    boolean c = isBoardInCheck( );
    textSize(10);
    text("Board in is check: " + c, 200, 10);
    text("White in check : " + isWhiteInCheck(), 200, 25);
    text("Black in check : " + isBlackInCheck(), 200, 40);
  }

  void showSelected() {
    if (selected!="") {

      PVector loc = convertLocation(selected);

      //println(loc);
      noFill();
      strokeWeight(3);
      stroke(255, 0, 0);
      rect(loc.x, loc.y, 100, 100);
      stroke(0);
    }
  }
  void mouseOverSquare() {

    float x, y;
    x=floor((mouseX)/100);
    y=floor((mouseY)/100);

    //println("X:"+x+" Y:"+y);

    if (x>0 && y>0 && x < 9 && y < 9) {
      noFill();
      stroke(200, 200, 255);
      strokeWeight(3);
      rect((x*100)+5, (y*100)+5, 90, 90);
      stroke(0);
    }
  }
  void mouseClick() {
    pieceMoved=false;
    float x, y;
    if (moveMode == notMoving) {
      selectedPiece=null;
      x=floor((mouseX)/100);
      y=floor((mouseY)/100);
      String loc = "";

      loc = convertXY(x, y);
      //println("LOC"+loc);
      selected=loc;
      boolean found = false;
      //println(white.size());
      for (chessPiece cp : white) {

        if (cp.loc.equals(loc)) {
          //println(cp.loc);
          //println("white");
          found = true;
          //println(cp.getClass());
          //cp.move();
          //cp.showMoves();
          selectedPiece = cp;
        }
      }
      if (!found) {
        //for (chessPiece cp : black) {
        //  if (cp.loc.equals(loc)) {
        //    //println("black");
        //    //println(cp.getClass());
        //    //cp.move();
        //    //cp.showMoves(); 
        //    selectedPiece = cp;
        //    found=true;
        //  }
        //}
      }
      if (selectedPiece==null) {
        moveMode=notMoving;
        pieceMoved=false;
      } else {
        pieceMoved=false;
        moveMode=moving;
      }
    } else {

      x=floor((mouseX)/100);
      y=floor((mouseY)/100);
      String loc = "";

      loc = convertXY(x, y);
      //println("LOCATION " + loc);
      selectedPiece.generateMoves2(this);
      StringList moves = selectedPiece.currentMoves;
      //boolean found = false;
      for (String match : moves) {
        if (match.equals(loc)) {
          //Move current piece to this location.
          selectedPiece.loc = loc;
          selectedPiece.rules();      
          pieceMoved=true;
        }
      }
      println("Chess board TAKEPIECES : " + selectedPiece.takePieces);
      for (String take : selectedPiece.takePieces) {
        //println("TAKE:"+take);
        if (loc.equals(take)) {
          //find target piece.
          //println("Finding target");
          if (selectedPiece.pieceColor==BLACK) {
            //println("Finding target:BLACK");
            for (chessPiece i : white) {
              if (i.loc.equals(take)) {
                selectedPiece.loc = take;
                white.remove(i);
                //println("Finding target:BLACK:taken white piece");
                selectedPiece.rules();      
                pieceMoved=true;
                break;
              }
            }
          } else if (selectedPiece.pieceColor==WHITE) {
            println("Finding target:WHITE");
            for (chessPiece i : black) {
              if (i.loc.equals(take)) {
                selectedPiece.loc = take;
                println("Finding target:WHITE:taken black piece");
                black.remove(i);
                pieceMoved=true;
                selectedPiece.rules();
                break;
              }
            }
          }
        }
      }

      ////if(!found){
      moveMode=notMoving;
      selectedPiece=null; 
      ////}
    }
    //println("WHITE IN CHECK:" + isWhiteInCheck());
    //println("BLACK IN CHECK:" + isBlackInCheck());
  }
  //boolean isSquareOccupied2(float x, float y, chessPiece ignore ) {
  //    String loc = convertXY(x/100, y/100);

  //    chessPiece rtrn = null;
  //    for (chessPiece cp : white) {

  //      //println("LOCATION "+loc);
  //      //println("White CHESSPIECELOCATION "+cp.loc);
  //      if (!cp.equals(ignore) ){
  //        if (cp.loc.equals(loc)  ) {
  //          rtrn=cp;
  //         return true;
  //        }

  //      }
  //      //println("no");
  //    }

  //    for (chessPiece cp : black) {   
  //      //println("LOCATION "+loc);
  //      //println("Black CHESSPIECELOCATION "+cp.loc);
  //      //if (cp==ignore) return cp;
  //      if (!cp.equals(ignore)) {
  //        if (cp.loc.equals(loc)) {
  //          //println("TRUE");rtrn=cp;
  //          //println("YES");
  //          return true;
  //        }
  //      }
  //    }
  //    if(y>900 || y<100 || x < 100 || x > 900){
  //      return true;
  //    }
  //    return false;
  //  }
  chessPiece isSquareOccupied(float x, float y, chessPiece ignore ) {
    String loc = convertXY(x/100, y/100);
    if (y>900 || y<100 || x < 100 || x > 900) {
      return new chessPiece();
    }
    //println("LOCATION "+loc);
    chessPiece rtrn = null;
    for (chessPiece cp : white) {

      //println("LOCATION "+loc);
      //println("White CHESSPIECELOCATION "+cp.loc);
      if (!cp.equals(ignore) ) {
        if (cp.loc.equals(loc)  ) {
          rtrn=cp;
          return rtrn;
        }
      }
      //println("no");
    }

    for (chessPiece cp : black) {   
      //println("LOCATION "+loc);
      //println("Black CHESSPIECELOCATION "+cp.loc);
      //if (cp==ignore) return cp;
      if (!cp.equals(ignore)) {
        if (cp.loc.equals(loc)) {
          //println("TRUE");rtrn=cp;
          //println("YES");
          return cp;
        }
      }
    }
    //println("no");
    return null;
  }
  String convertXY(float x, float y) {

    String rtrn = "";
    if (x>0&&y>0&&x<9&&y<9) {
      //println(x);
      rtrn = rtrn + char((int)x+64);
      rtrn = rtrn + "" + (int)abs(y-9);
    }
    //println("CONVERTXY");
    //println("X " + x);
    //println("Y " + y);
    //println("RESULT " + rtrn);
    return rtrn;
  }
  PVector convertLocation(String loc) {
    PVector rtrn = new PVector();
    //println("loc:" + loc);
    //println(loc.toCharArray()[0] );
    rtrn.x= (((float)loc.toCharArray()[0] - 64)*100);
    rtrn.y=(abs(((float)loc.toCharArray()[1]-48)-9 )*100);


    return rtrn;
  }
  void showBoard() {
    stroke(0);
    for (int c=0; c<8; c++) {

      for (int d=0; d<8; d++) {
        if (c%2==0) {
          if (d%2==0) {
            fill(255);
          } else {
            fill(0);
          }
        } else {
          if (d%2==0) {
            fill(0);
          } else {
            fill(255);
          }
        }
        rect((c*100) + 100, (d*100) +100, 100, 100);
        ///println(d);
      }
    }
  }


  boolean isWhiteInCheck() {

    //find all moves for black.
    //if the king location part of the available moves is true then return true; 

    StringList allBlackMoves=new StringList();
    //println("ALL BLACK MOVES: " + allBlackMoves);
    for (chessPiece cp : black) {
      //cp.generateMoves2(this);
      for (String tp : cp.takePieces) {
        allBlackMoves.append(tp);
        if (whiteKing.loc.equals(tp)) {
          println("White CHECK!");
          return true;
        }
      }
    }
    return false;
  }
  boolean isBlackInCheck() {
    boolean rtrn = false;
    StringList allWhiteMoves=new StringList();
    //println("ALL WHITE MOVES: " + allWhiteMoves);
    for (chessPiece cp : white) {
      //cp.generateMoves2(this);
      for (String tp : cp.takePieces) {
        allWhiteMoves.append(tp);
        if (blackKing.loc.equals(tp)) {
          println("Black CHECK!");
          return true;
        }
      }
    }
    println("IS BLACK IN CHECK end");
    return rtrn;
  }
  boolean isBoardInCheck() {
    boolean w, b;
    w=isWhiteInCheck();
    b=isBlackInCheck();
    return w||b;
  }

  chessBoard createClone() {
    chessBoard rtrn = new chessBoard();
    rtrn.black=new ArrayList<chessPiece>();
    rtrn.white=new ArrayList<chessPiece>();
    for (chessPiece cp : black) {

      chessPiece newCP = new chessPiece();
      println(cp);
      println(cp.loc);
      newCP.c = cp.c;
      newCP.desc= cp.desc;
      newCP.dir = cp.dir;
      newCP.img = cp.img;
      newCP.loc=cp.loc;
      newCP.offset = cp.offset;
      newCP.pieceColor = cp.pieceColor;
      newCP.takePieces = cp.takePieces;
      newCP.currentMoves = cp.currentMoves;
      rtrn.black.add(newCP);
      if (newCP.desc.equals("King")) {
        rtrn.blackKing = newCP;
      }
    }
    for (chessPiece cp : white) {
      chessPiece newCP = new chessPiece();

      newCP.c = cp.c;
      newCP.desc=cp.desc;
      newCP.dir = cp.dir;
      newCP.img = cp.img;
      newCP.loc=cp.loc;
      newCP.offset = cp.offset;
      newCP.pieceColor = cp.pieceColor;
      newCP.takePieces = cp.takePieces;
      newCP.currentMoves = cp.currentMoves;
      rtrn.black.add(newCP);
      if (newCP.desc.equals("King")) {
        rtrn.whiteKing = newCP;
      }
    }
    return rtrn;
  }

  chessPiece findPiece(int col, String type) {
    chessPiece rtrn = null;

    for (chessPiece cp : white) {
      if (cp.pieceColor==col && cp.desc.equals(type)) {
        rtrn= cp;
      }
    }
    for (chessPiece cp : black) {
      if ((cp.pieceColor==col && cp.desc.equals(type))) {
        rtrn= cp;
      }
    }
    return rtrn;
  }
}
