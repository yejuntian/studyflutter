/*
  Mixins是一种多类继承中重用一个类代码的方法。

  注意事项：
  1.A 和 B 必须是普通类，且 不能有构造函数
  2.A 和 B 不能继承其他有构造函数的类
  3.声明为 mixin 以避免歧义
*/

mixin class A {
  void a() {
    print("A a()");
  }
}

mixin class B {
  void b() {}
}

class C with B, A {
  void c() {}

  void a() {
    print("C a()");
  }
}

//如果不需要自己的方法，可以这样写(D相当于A和B的混合类)
class D = Object with A, B;

void main() {
  var c = C();
  //优先调用自己类的a方法
  c.a();
  c.b();
  c.c();

  var d = D();
  //调用混和类的a方法
  d.a();
  d.b();
}
