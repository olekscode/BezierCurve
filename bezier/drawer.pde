class Drawer {
  private Points _points;
  
  public Drawer(Points points) {
    _points = points;
  }
  
  public void drawPoint(Point p) {
    _set_colors_yellow();
    int sq_size = p.squareSize();
    rect(p.x() - sq_size / 2, p.y() - sq_size / 2, sq_size, sq_size);
  }
  
  public void drawPoint(int index) {
    Point p = _points.getPoint(index);
    drawPoint(p);
    _draw_connections(index);
  }
  
  public void drawAllPoints() {
    clear();
    drawPoint(0);
    
    for (int i = 1; i < _points.size(); ++i) {
      drawPoint(i);
      _draw_line(_points.getPoint(i - 1), _points.getPoint(i));
    }
  }
  
  public void clear() {
    background(0);
  }
  
  private void _draw_line(Point p1, Point p2) {
    line(p1.x(), p1.y(), p2.x(), p2.y());
  }
  
  private void _draw_connections(int index) {
    Point p = _points.getPoint(index);
    
    if (index > 0) {
      _draw_line(p, _points.getPoint(index - 1));
    }
    if (index < _points.size() - 1) {
      _draw_line(p, _points.getPoint(index + 1));
    }
  }
  
  private void _set_colors_yellow() {
    stroke(200, 170, 2);
    fill(200, 170, 2, 100);
  }
  
  private void _set_colors_black() {
    stroke(0);
    fill(0);
  }
  
  //private void _set_colors_yellow_active() {
  //  stroke(200, 170, 2);
  //  fill(200, 170, 2);
  //}
}