class Point {
  //每个实例属性  变量都有一个隐士的get，非final 还有set
  int? _x;
  int? y;

  // 自定义 getter（公开访问 _x）
  int? get x => _x;

  // 自定义 setter（设置 _x）
  set x(int? x) {
    _x = x;
  }
}

void main() {
  var point = Point();
  point.x = 12;
  point.y = 2;

  //get
  var x = point.x;

  //set
  var y = point.y;
  print("point.x = $x point.y = $y");
}
