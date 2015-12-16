class BezierCurve {
  public Points _points;
  
  public BezierCurve(Points points) {
    _points = points;
  }
  
  public Point B(double t) {
    Point res = new Point(0, 0);
    int n = _points.size();
    
    for (int i = 0; i < n; ++i) {
      res.setX((int) (res.x() + _combination(i, n) * points.getPoint(i).x() * Math.pow(1 - t, n - i) * Math.pow(t, i)));
      res.setY((int) (res.y() + _combination(i, n) * points.getPoint(i).y() * Math.pow(1 - t, n - i) * Math.pow(t, i)));
    }
    return res;
  }
  
  public void draw() {
    //for (int i = 1; i < _points.size() - 2; ++i) {
    //  Point p1 = _points.getPoint(0);
    //  Point p2 = _points.getPoint(i);
    //  Point p3 = _points.getPoint(i + 1);
    //  Point p4 = _points.getPoint(_points.size() - 1);
      
    //  _drawMidPoints(p1, p2, p3, p4, 5);
      
    //  stroke(BLUE);
    //  fill(BLUE, 100);
    //  bezier(p1.x(), p1.y(), p2.x(), p2.y(), p3.x(), p3.y(), p4.x(), p4.y());
    //}
    
    Point prev = _points.getPoint(0);
    
    double step = 0.0001;
    for (double i = step; i < 1; i += step) {
      Point curvePoint = _deCasteljauPoint(_points, i);
      _drawCurvePoint(curvePoint);
      //_drawCurveLine(prev, curvePoint);
      prev = curvePoint;
    }
  }
  
  //private void _drawMidPoints(Point p1, Point p2, Point p3, Point p4, int depth) {
  //  if (depth == 0) {
  //    return;
  //  }
    
  //  Point midPoint1 = _middle(p1, p2);
  //  Point midPoint2 = _middle(p2, p3);
  //  Point midPoint3 = _middle(p3, p4);
    
  //  Point midPoint4 = _middle(midPoint1, midPoint2);
  //  Point midPoint5 = _middle(midPoint2, midPoint3);
    
  //  midPoint2 = _middle(midPoint4, midPoint5);
    
  //  _drawCurvePoint(midPoint2);
  //  _drawMidPoints(p1, midPoint1, midPoint4, midPoint2, depth - 1);
  //  _drawMidPoints(midPoint2, midPoint5, midPoint3, p4, depth - 1);
  //}
  
  // TODO: Move to BezierCurveDrawer
  private void _drawCurvePoint(Point p) {
    stroke(CURVECOLOR);
    fill(CURVECOLOR);
    //ellipse(p.x(), p.y(), 2, 2);
    point(p.x(), p.y());
  }
  
  private void _drawCurveLine(Point p1, Point p2) {
    stroke(CURVECOLOR);
    strokeWeight(2);
    line(p1.x(), p1.y(), p2.x(), p2.y());
    strokeWeight(1);
  }
  
  private Point _deCasteljauPoint(Points points, double u) {
    if (points.size() == 1) {
      return points.getPoint(0);
    }
    
    Points nextPoints = new Points();
    for (int i = 1; i < points.size(); ++i) {
      nextPoints.append(_ratioPoint(points.getPoint(i - 1), points.getPoint(i), u));
    }
    
    return _deCasteljauPoint(nextPoints, u);
  }
  
  private Point _ratioPoint(Point p1, Point p2, double u) {
    int x = (int) (p1.x() + (p2.x() - p1.x()) * u);
    int y = (int) (p1.y() + (p2.y() - p1.y()) * u);
    return new Point(x, y);
  }
  
  //private Point _middle(Point p1, Point p2) {
  //  int x = (p1.x() + p2.x()) / 2;
  //  int y = (p1.y() + p2.y()) / 2;
  //  return new Point(x, y);
  //}
  
  private double _combination(int n, int k) {
    return _factorial(n) / (_factorial(k) * _factorial(n - k));
  }
  
  private int _factorial(int n) {
    int res = 1;
    
    for (int i = 2; i < n; ++i) {
      res *= i;
    }
    return res;
  }
}