/*
  私有成员：
  1.以 _ 开头的变量、方法或构造函数
  2.在同一个 Dart 文件中，私有成员是可以访问的
*/
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

  //操作符重载,定义"+"操作符
  Point operator +(Point other) {
    var point = Point();
    point._x = (_x! + other._x!);
    return point;
  }

  //随意重载运算符返回值类型

  String operator -(int value) {
    return "${_x! - value}";
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

  print("************操作符重载操作************");
  var point1 = Point();
  point1._x = 10;
  var point2 = Point();
  point2._x = 2;
  var point3 = point1 + point2;
  print("point3.x = ${point3._x}");

  point3 = point1 + point2 + point3;
  print("point3.x = ${point3._x}");

  var result = point1 - 1;
  print("result = $result");
}
