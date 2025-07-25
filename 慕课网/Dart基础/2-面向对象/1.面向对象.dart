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
  final String? city;
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
  Student.cover(Student stu, this.city) : super(stu.name, stu.age) {
    print("命名构造方法");
  }

  //命名工厂构造方法：factory[类名+.+方法名]
  //它可以有返回值，并且不需要将类的final变量作为命名工厂构造方法 的参数。
  factory Student.stu(Student student) {
    return Student(student._school, student.name, student.age);
  }

//可以为私有字段设置getter来让外界获取到私有字段
  String? get school => _school;

  //可以为私有字段设置setter来让外界对私有字段进行修改
  set school(String? value) {
    _school = value;
  }

  //静态方法
  static doPrint(String message) {
    print("print:$message");
  }

  @override
  String toString() {
    return "name:$name school:${this._school},city:$city,country:$country ${super.toString()}";
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

//使用abstract修饰符来定义一个抽象类，该类不能被实例化。抽象类在定义接口的时候非常有用，
//实际上抽象类中也包含一些实现。
abstract class Study {
  void study();
}

//继承抽象类要实现它的抽象方法，否则也需要将自己定义为抽象类
class StudyFlutter extends Study {
  @override
  void study() {
    print("Learning Flutter");
  }
}

//使用mixin关键字定义类
mixin Study2 {
  // 抽象方法可以定义在 mixin 中
  void study();
}

//mixins 是在多个类层次结构中重用代码的一种方式
//要使用mixins，在with关键字后面跟上一个或多个mixin的名字(名字用逗号分隔),并且with要用在extents关键字之后
//mixins的特征:实现mixins就创建一个集成Object类的子类(不能继承其他类),不声明任何构造方法,不调用super
class Test extends Person with Study2 {
  Test(super.name, super.age);

  @override
  void study() {}
}
