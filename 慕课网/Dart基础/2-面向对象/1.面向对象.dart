//定义一个Dart类，所有的类都继承Object

class Person {
  String name;
  int age;

  //标准的构造方法
  Person(this.name, this.age);

  //重新父类的方法
  @override
  String toString() {
    return 'name:$name,age:$age';
  }
}

class Student extends Person {
  //定义类的变量
  String? _school; //通过下划线来标识私有字段（变量）
  String? city;
  String? country;

  //通过this._school初始化自有参数
  //name,age 交给父类进行初始化
  //city为可选参数
  //country为默认参数
  Student(this._school, String inputName, int age,
      {this.city, this.country = 'China'})
      : super(inputName, age) {
    //实例化实例变量，不同变量之间用；分隔开
    name = '$country.$city';

    //super之后用{}就是构造方法，构造方法体不是必须的
    print("构造方法体不是必须的");
  }

  //命名构造方法：[类名+.+方法名]
  //使用命名构造方法为类实现多个构造方法
  Student.cover(Student stu) : super(stu.name, stu.age) {
    print("命名构造方法");
  }
}

class Logger {
  static Logger? _logger;

  /**
      工厂构造方法：
      不仅仅是构造方法，更是一种模式，有时候返回一个之前已经创建的缓存对象，原始的构造方法不能满足要求，
      那么可以使用工厂模式来定义构造方法。
   */
  factory Logger() {
    _logger ??= Logger._internal();
    return _logger!;
  }

  Logger._internal();

  void log(String message) {
    print(message);
  }

}
