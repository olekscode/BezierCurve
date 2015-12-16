class PointDrawer {
  public void draw(Point p) {
    stroke(POINTCOLOR);
    fill(POINTCOLOR, 100);
    int sq_size = p.squareSize();
    rect(p.x() - sq_size / 2, p.y() - sq_size / 2, sq_size, sq_size);
  }
}