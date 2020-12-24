
class gamePiece {
}

class chessPiece extends gamePiece {
  PImage img;
  String loc;
  color c;
  float x, y;
  int dir;
  int pieceColor;
  int offset = 10;
  StringList takePieces;
  StringList currentMoves;
  String desc;
  chessPiece( ) {
    currentMoves=new StringList();
    takePieces=new StringList();
  }
  chessPiece(color col) {
    c=col;
    if (col==color(0)) {

      pieceColor=0;  //black
    } else {
      pieceColor=1; //white
    }
    takePieces=new StringList();
  }

  void SetColor(int col) {
    if (col==WHITE) {
      c=200;
      pieceColor=WHITE;
    } else if (col==BLACK) {
      c=50;
      pieceColor=BLACK;
    }
  }
  void move() {
  }

  void show() {
  }
  void generateMoves(chessBoard cb) {
  }
  void generateMoves2(chessBoard cb) {
  }
  void rules() {
  }
  void calculate() {    
    println("CALCULATE: " + loc);
    println(desc   +":" + pieceColor);
    x= (((float)loc.toCharArray()[0] - 64)*100);
    y=(abs(((float)loc.toCharArray()[1]-48)-10 )*100);
  }
  PVector convertLocation(String loc) {
    PVector rtrn = new PVector();

    //println(loc.toCharArray()[0] );
    rtrn.x= (((float)loc.toCharArray()[0] - 64)*100);
    rtrn.y=(abs(((float)loc.toCharArray()[1]-48)-9 )*100);


    return rtrn;
  }
  boolean takePiece(chessPiece t) {
    if (t.pieceColor!=pieceColor) {
      return true;
    }
    return false;
  }
}
