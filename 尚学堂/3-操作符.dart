void main() {
  /**
   * 操作符

      1.类型判定操作符
      as、 is、 和 is! 操作符是在运行时判定对象 类型的操作符
      | 操作符 | 解释                           |
      | ------ | ------------------------------ |
      | `as`   | 类型转换                       |
      | `is`   | 如果对象是指定的类型返回 True  |
      | `is!`  | 如果对象是指定的类型返回 False |

      as 操作符把对象转换为特定的类型，但是如果无法完成转换则会抛出一个异常
      is 和Java中的 `instanceof` 相同

      2.赋值操作符
      =、+=、\=、*=这些不必多说，还有一个 ??= 操作符用来指定 值为 null 的变量的值

      3.条件表达式
      （1）condition ? expr1 : expr2
      如果 *condition 是 true，执行 expr1 (并返回执行的结果)； 否则执行 expr2 并返回其结果。
      (2) expr1 ?? expr2
      如果 expr1 不为null，返回其值； 否则执行 expr2 并返回其结果。

      4.级联操作符..
      可以在同一个对象上 连续调用多个函数以及访问成员变量。 使用级联操作符可以避免创建 临时变量
      eg:
      StringBuffer write就是Java的append
      var sb = new StringBuffer();
      sb..write('foo')..write('bar');

      5.安全操作符 ?
      `?`操作符。左边的操作对象 如果 为 null 则返回 null
      String? sb;
      //空指针
      print(sb?.length);
   */

  print("************ 类型判断操作符 ************");
  num i = 13;
  int j = i as int;
  print("类型转换结果：$j");

  Object a1 = 12;
  var result = a1 is int;
  print("类型判断结果： result = $result");

  if (a1 is! String) {
    print("使用 is! 进行类型判断");
  }

  print("************ ??=赋值操作符 ************");
  var a;
  //安全赋值操作符，如果a有值就是用本身值，如果为null则进行赋值
  a ??= "3";
  print(a);

  print("************ 条件表达式 ************");
  String? a3 = "456";
  var result2 = a3 ?? "123";
  print("a3 不为null 返回a3 的值 $result2");

  a3 = null;
  result2 = a3 ?? "123";
  print("a3 为null 返回新赋值的结果 $result2");


  print("************ 级联操作符 ************");
  var sb = StringBuffer();
  sb..write('foo')..write('bar');
  print(sb);


  print("************ 安全操作符 ************");
  String? sb6;
  //空指针
  print(sb6?.length);
}
