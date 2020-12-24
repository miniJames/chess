GameEnvironment chess; //<>//
int white = 255;
int black = 0;
ChessPieceImages cpi;
void setup() {

  size(1000, 1000);
  cpi=new ChessPieceImages();
  //noLoop();
  
  chess=new GameEnvironment();
}

void draw() {
  background(128);
  chess.show();
}
void keyPressed(){
  chess.keyDown(key);  
}
void mousePressed() {
  chess.mouseClick();
}
