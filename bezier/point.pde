class Point {
  private int _x;
  private int _y;
  private int _square_size = 10;
  
  public Point(int x, int y) {
    _x = x;
    _y = y;
  }
  
  public int x() {
    return _x;
  }
  
  public int y() {
    return _y;
  }
  
  public int squareSize() {
    return _square_size;
  }
  
  public boolean isUnderCursor() {
    return (abs(mouseX - _x) <= _square_size / 2
         && abs(mouseY - _y) <= _square_size / 2);
  }
}