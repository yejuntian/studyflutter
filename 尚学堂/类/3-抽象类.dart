abstract class Parent {
  String? name;

  //默认构造方法
  Parent(this.name);

  //工厂方法返回child实例对象
  factory Parent.getChild(String name) {
    return Child(name);
  }

  void pintName();
}

//继承抽象类Parent
class Child extends Parent {
  Child(super.name);

  @override
  void pintName() {
    print("my name is $name");
  }
}

void main() {
  var parent = Parent.getChild("lisi");
  print("输出实际返回值类型： ${parent.runtimeType}");
  parent.pintName();
}
