//int max_num = 100;
//int[] x_arr = new int[max_num + 1];
//int[] y_arr = new int[max_num + 1];
//int num = 0;

Points points = new Points();

int rect_size = 10;
int circle_size = 100;

boolean captured = false;
int captured_point_i;

void setup() {
  size(750, 600);
  background(0);
}

void draw() {
  if (captured) {
    // TODO: Hide a point instead of redrawing the whole canvas
    redrawCanvas();
    drawPoint(mouseX, mouseY);
  }
}

void mousePressed() {
  int mx = mouseX;
  int my = mouseY;
  
  int k = pointUnderCursor(mx, my);

  if (mouseButton == LEFT) {
    if (k > -1) {
      capturePoint(k);
    }
    else {
      addPoint(mx, my);
      drawPoint(mx, my);
      capturePoint(num - 1);
    }
  }
  else {
    if (k > -1) {
      deletePoint(k);
      redrawCanvas();
    }
  }
}

void mouseReleased() {
  if (captured) {
    captured = false;
    setPoint(captured_point_i, mouseX, mouseY);
    redrawCanvas();
  }
}

int pointUnderCursor(int x, int y) {
  for (int i = 0; i < num; ++i) {
    if (abs(x - x_arr[i]) < rect_size / 2 && abs(y - y_arr[i]) < rect_size / 2) {
      return i;
    }
  }
  return -1;
}

void capturePoint(int index) {
  captured_point_i = index;
  captured = true;
}

void setPoint(int index, int x, int y) {
  x_arr[index] = x;
  y_arr[index] = y;
}

void addPoint(int x, int y) {
  if (num < max_num) {
    setPoint(num++, x, y);
  }
}

void deletePoint(int index) {
  --num;
  for (int i = index; i < num; ++i) {
    x_arr[i] = x_arr[i + 1];
    y_arr[i] = y_arr[i + 1];
  }
}

void drawPoint(int x, int y) {
  stroke(200, 170, 2);
  fill(200, 170, 2, 100);
  rect(x - rect_size / 2, y - rect_size / 2, rect_size, rect_size);
}

void redrawCanvas() {
  background(0);
  drawPoint(x_arr[0], y_arr[0]);
  
  for (int i = 1; i < num; ++i) {
    drawPoint(x_arr[i], y_arr[i]);
    line(x_arr[i], y_arr[i], x_arr[i-1], y_arr[i-1]);
  }
}