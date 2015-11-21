// TODO: Create class Point and redesign class Points

class Points {
  private int[] _x_arr;
  private int[] _y_arr;
  private int _size;
  private int _capacity;
  
  public Points() {
    _capacity = 3;
    _x_arr = new int[_capacity];
    _y_arr = new int[_capacity];
    _size = 0;
  }
  
  public int size() {
    return _size;
  }
  
  public int capacity() {
    return _capacity;
  }
  
  public void shrink_to_fit() {
    _resize_arrays(_size);
  }
  
  public void append(int x, int y) {
    _extend();
    _x_arr[_size] = x;
    _y_arr[_size] = y;
    ++_size;
  }
  
  public int getX(int index) {
    return _x_arr[index];
  }
  
  public int getY(int index) {
    return _y_arr[index];
  }
  
  public void update(int index, int x, int y) {
    _x_arr[index] = x;
    _y_arr[index] = y;
  }
  
  public void remove(int index) {
    for (int i = index; i < _size - 1; ++i) {
      _x_arr[i] = _x_arr[i + 1];
    }
    --_size;
    _shrink();
  }
  
  private void _extend() {
    // TODO: Find a better algorithm
    if (_size == _capacity) {
      _capacity *= 2;
      _resize_arrays(_capacity);
    }
  }
  
  private void _shrink() {
    // TODO: Find a better algorithm
    if (_size * 2 < _capacity) {
      _capacity /= 2;
      _resize_arrays(_capacity);
    }
  }
  
  private void _resize_arrays(int cap) {
    if (cap >= _size) {
      _capacity = cap;
      int[] new_x_arr = new int[_capacity];
      int[] new_y_arr = new int[_capacity];
      
      for (int i = 0; i < _size; ++i) {
        new_x_arr[i] = _x_arr[i];
        new_y_arr[i] = _y_arr[i];
      }
      
      _x_arr = new_x_arr;
      _y_arr = new_y_arr;
    }
    else {
      // TODO: Create an exception
      println("ERROR: Arrays won't be resized as there may be a loss of data.");
    }
  }
}