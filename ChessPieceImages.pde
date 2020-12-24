class ChessPieceImages {

  PImage BKing;
  PImage BQueen;
  PImage BBishop;
  PImage BRook;
  PImage BPawn;
  PImage BKnight;

  PImage WKing;
  PImage WQueen;
  PImage WBishop;
  PImage WRook;
  PImage WPawn;
  PImage WKnight;

  PImage raw;

  ChessPieceImages() {

    raw=loadImage("data\\chessPieces1.png");
    raw.loadPixels();

    float wd = raw.width/6;
    float ht = raw.height/2;
    WKing = createImage((int)wd, (int)ht, ALPHA);
    WKing.loadPixels();
    int wkc =0; 
    BKing = createImage((int)wd, (int)ht, ALPHA);
    BKing.loadPixels();
    int bkc=0;
    WQueen = createImage((int)wd, (int)ht, ALPHA);
    WQueen.loadPixels();
    int wqc =0; 
    BQueen = createImage((int)wd, (int)ht, ALPHA);
    BQueen.loadPixels();
    int bqc=0;

    WBishop = createImage((int)wd, (int)ht, ALPHA);
    WBishop.loadPixels();
    int wbc =0; 
    BBishop = createImage((int)wd, (int)ht, ALPHA);
    BBishop.loadPixels();
    int bbc=0;

    WKnight = createImage((int)wd, (int)ht, ALPHA);
    WKnight.loadPixels();
    int wknc =0; 
    BKnight = createImage((int)wd, (int)ht, ALPHA);
    BKnight.loadPixels();
    int bknc=0;

    WRook = createImage((int)wd, (int)ht, ALPHA);
    WRook.loadPixels();
    int wrc =0; 
    BRook = createImage((int)wd, (int)ht, ALPHA);
    BRook.loadPixels();
    int brc=0;
    WPawn = createImage((int)wd, (int)ht, ALPHA);
    WPawn.loadPixels();
    int wpc =0; 
    BPawn = createImage((int)wd, (int)ht, ALPHA);
    BPawn.loadPixels();
    int bpc=0;
    for (int y=0; y<raw.height; y++) {
      for (int x=0; x<raw.width; x++) {
        int pix = (y * raw.width) + x;
        if (x< wd ) {
          //KING!!!
          if (y> raw.height/2) {
            color cp = raw.pixels[pix];
            BKing.pixels[bkc]= getChessPixel(cp, BLACK);
            bkc++;
          } else if (y < raw.height/2) { 
            color cp = raw.pixels[pix];
            WKing.pixels[wkc]=getChessPixel(cp, WHITE);
            wkc++;
          }
        } else if ( x < wd *2) {
          //Queen
          if (y> raw.height/2) {
            color cp = raw.pixels[pix];
            BQueen.pixels[bqc] = getChessPixel(cp, BLACK);
            bqc++;
          } else if (y < raw.height/2) { 
            color cp = raw.pixels[pix];
            WQueen.pixels[wqc]=getChessPixel(cp, WHITE);
            wqc++;
          }
        } else if ( x < wd *3) {
          //Bishop
          if (y> raw.height/2) {
            color cp = raw.pixels[pix];
            BBishop.pixels[bbc] = getChessPixel(cp, BLACK);
            bbc++;
          } else if (y < raw.height/2) { 
            color cp = raw.pixels[pix];
            WBishop.pixels[wbc]=getChessPixel(cp, WHITE);
            wbc++;
          }
        } else if ( x < wd *4) {
          //knight
          if (y> raw.height/2) {
            color cp = raw.pixels[pix];
            BKnight.pixels[bknc] = getChessPixel(cp, BLACK);
            bknc++;
          } else if (y < raw.height/2) { 
            color cp = raw.pixels[pix];
            WKnight.pixels[wknc]=getChessPixel(cp, WHITE);
            wknc++;
          }
        } else if ( x < wd *5) {
          //Rook
          if (y> raw.height/2) {
            color cp = raw.pixels[pix];
            BRook.pixels[brc] = getChessPixel(cp, BLACK);
            brc++;
          } else if (y < raw.height/2) { 
            color cp = raw.pixels[pix];
            WRook.pixels[wrc]=getChessPixel(cp, WHITE);
            wrc++;
          }
        } else if ( x < wd *6) {
          //Pawn
          if (y> raw.height/2) {
            color cp = raw.pixels[pix];
            BPawn.pixels[bpc] = getChessPixel(cp, BLACK);
            bpc++;
          } else if (y < raw.height/2) { 
            color cp = raw.pixels[pix];
            WPawn.pixels[wpc]=getChessPixel(cp, WHITE);
            wpc++;
          }
        }
      }
    }
    BKing.updatePixels();
    WKing.updatePixels();
  }


  color getChessPixel(color c, int chessPieceColor) {

    color rtrn;
    int base;
    if (chessPieceColor==BLACK) {
      base = 50;
    } else {
      base = 200;
    }

    if ((red(c)==0 && green(c)==0 && blue(c)==0)) {
      rtrn=color(base, 255);//color(red(raw.pixels[pix]), green(raw.pixels[pix]),blue(raw.pixels[pix]),0);
    } else {
      rtrn= color(255, 255, 255, 0);
    } 


    return rtrn;
  }
}
