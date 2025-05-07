//如果类的定义使用_开头意味着这个类是private
class Point {
  //使用_开始命名的变量就是java的private
  int _x;
  int y;

  Point(this._x, this.y);

  //命名多个构造方法
  Point.init()
      : _x = -1,
        y = -2;

  Point.Y(this.y) : _x = 0;

  Point.X(this._x) : y = 1;
}
