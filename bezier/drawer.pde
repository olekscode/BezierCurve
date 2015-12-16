class Drawer {
  private Points _points;
  private PointDrawer _pointDrawer;
  private BezierCurve _bezierCurve;
  
  public Drawer(Points points) {
    _points = points;
    _pointDrawer = new PointDrawer();
    _bezierCurve = new BezierCurve(_points);
    
  }
  
  public void drawPoint(int index) {
    Point p = _points.getPoint(index);
    _pointDrawer.draw(p);
  }
  
  public void drawEverything() {
    clear();
    
    if (_points.size() > 0) {
      drawPoint(0);
      
      for (int i = 1; i < _points.size(); ++i) {
        drawPoint(i);
        _draw_line(_points.getPoint(i - 1), _points.getPoint(i));
      }
      
      if (_points.size() == 4) {
        Point p1 = _points.getPoint(0);
        Point p2 = _points.getPoint(1);
        Point p3 = _points.getPoint(2);
        Point p4 = _points.getPoint(3);
        
        stroke(BLUE);
        fill(BLUE, 100);
        bezier(p1.x(), p1.y(), p2.x(), p2.y(), p3.x(), p3.y(), p4.x(), p4.y());
      }
      
      if (_points.size() == 4) {
        Point p1 = _points.getPoint(0);
        Point p2 = _points.getPoint(1);
        Point p3 = _points.getPoint(2);
        Point p4 = _points.getPoint(3);
        
        stroke(BLUE);
        fill(BLUE, 30);
        bezier(p1.x(), p1.y(), p2.x(), p2.y(), p3.x(), p3.y(), p4.x(), p4.y());
      }
      
      //if (_points.size() >= 4) {
      //  _bezierCurve.draw();
      //}
    }
  }
  
  public void clear() {
    background(BACKGROUNDCOLOR);
  }
  
  private void _draw_line(Point p1, Point p2) {
    line(p1.x(), p1.y(), p2.x(), p2.y());
  }
}