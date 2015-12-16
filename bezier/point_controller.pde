class PointController {
  private Points _points;
  private Drawer _drawer;
  private int _captured_point_id = -1;
  
  public PointController(Points points, Drawer drawer) {
    _points = points;
    _drawer = drawer;
  }
  
  public void addPoint(Point p) {
    _points.append(p);
    _drawer.drawEverything();
  }
  
  public void moveCapturedUnderCursor() {
    if (_captured_point_id != -1) {
      _points.update(_captured_point_id, new Point(mouseX, mouseY));
      _drawer.drawEverything();
    }
  }
  
  public void capture(int index) {
    _captured_point_id = index;
  }
  
  public void release() {
    _captured_point_id = -1;
  }
}