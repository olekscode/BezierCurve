Points points = new Points();
Drawer drawer = new Drawer(points);
PointController pCtrl = new PointController(points, drawer);

void setup() {
  size(750, 600);
  background(0);
}

void draw() {
  pCtrl.moveCapturedUnderCursor();
}

void mousePressed() {
  int k = points.pointUnderCursor();

  if (mouseButton == LEFT) {
    if (k > -1) {
      pCtrl.capture(k);
    }
    else {
      pCtrl.addPoint(new Point(mouseX, mouseY));
      pCtrl.capture(points.size() - 1);
    }
  }
  else {
    if (k > -1) {
      points.remove(k);
      drawer.drawAllPoints();
    }
  }
}

void mouseReleased() {
  pCtrl.release();
}