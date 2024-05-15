void main() {
  /**
   * 变量
   *  1.变量是一个引用,未初始化的变量值是null
   *  2.可以使用object、var、dynamic声明任何变量类型，背后原理不同。
   *   (1)object：与java类中的Object一样，是所有类的基类，Object声明的变量可以是任何类型。(在dart中数字、方法和'null'都是对象，比如int。)
   *      object a=1;
   *      a="a";
   *
   *   (2) var:变量赋值那一刻决定了它是什么类型。
   *   //a 已经确定为num，不能再赋值字符串，编译错误
   *   var a=1;
   *   a = "a";
   *
   *    //正确
   *    var b;
   *    b = 1;
   *    b = "b";
   *
   *    (3)dynamic:不是在编译时候确定类型，而是在运行时，dynamic声明的变量行为与object一样，使用一样，但是原理不同。
   *
   *  3.final与const ：如果不打算改变一个变量，可以使用final和const，它们可以替代任何类型，只能在声明时初始化，且不能改变。
   *    区别：final是运行时常量，而const是编译器常量，它的值在编译期就可以确定，编译时常量能够让代码运行的更高效
   *
   *    eg:
   *    //正确，已经确定的值
   *    const a = 1;
   *    const b = a + 1;
   *
   *    //错误,final不能在编译时确定值，因此const也不能确定值
   *    final a = 1;
   *    const c = a + 1;
   *
   *   //正确
   *   const a = 1;
   *   final b = a + 1;
   */
  Object name1 = 'Lance';
  var name2 = 'Lance';
  dynamic name3 = 'Lance';
  print('$name1 $name2 $name3');

  const a = 1;
  final b = a + 1;
  print(b);
}
