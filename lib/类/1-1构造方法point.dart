//如果类的定义使用_开头意味着这个类是private
class Point {
  //使用_开始命名的变量就是java的private
  int _x;
  int y;

  Point(this._x, this.y);

  //重命名多个构造方法
  Point.init()
      : _x = -1,
        y = -2;

  Point.Y(this.y) : _x = 0;

  Point.X(this._x) : y = 1;

  //参数初始化列表-》初始化类的属性
  Point.fromMap(Map map)
      : _x = map['x'],
        y = map['y'];

  //重定向构造方法
  Point.init2(int x) : this(x, 1);
}

class ImmutablePoint {
  final int x;
  final int y;

  //常量构造方法
  const ImmutablePoint(this.x, this.y);
}

void main() {
  //使用const创建对象（前提条件：必须定义常量构造函数），传递参数也一样，创建的对象则是一个编译器常量对象
  var point1 = const ImmutablePoint(1, 1);
  var point2 = const ImmutablePoint(1, 1);
  print(point1.hashCode == point2.hashCode);
  print(point1 == point2);

  //工厂构造函数
  print(Manager.getInstance());
}

//工厂构造方法，必须返回一个实例对象
class Manager {
  //1.工厂构造函数->使用factory关键字命名的构造方法
  //2.工厂构造函数->必须返回它的实力对象，或者它子类对象

  // 用 ? 表示 _instance 可以是 null
  static Manager? _instance;

  factory Manager.getInstance() {
    // 使用 ??= 延迟初始化
    _instance ??= Manager._newInstance();
    // 用 ! 表示“我确认此时不为 null”再返回
    return _instance!;
  }

  Manager._newInstance();
}
