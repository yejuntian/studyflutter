void main() {
  /**
   * 内置的类型:
   *   与Java的八大内置基本数据类型不同，Dart 内置支持下面这些类型：
   *   Number:数字类型
   *   String:字符串类型
   *   boolean:布尔类型
   *   list:列表类型(也被称为arrays)
   *   Map:映射类型
   *   Runes:符文类型(用在字符串中表示unicode字符)
      如果需要获得特殊字符的Unicode编码，或者需要将32位的Unicode编码转换为字符串，就可以借助Runes类。
      Dart表达Unicode代码点的常用方法是\uXXXX，其中XXXX是4位十六进制值。要指定多于或少于4个十六进制数字，
      需要将值放在大括号中。
   *   Symbol:标识符
   *
   */
  print("*********** number ***********");
  int i = 10;
  print(i.runtimeType);
  print(i.bitLength);

  print("*********** String ***********");
  //2字符串格式化
  String str = "快扶我去大保健！";

  int num = 11;
  String text = '${str}我要去找$num技师';
  print(text);

  //2.1单引号声明
  String test = '"test"';
  print(test);
  String test2 = "'test2'";
  print(test2);

  //2.2提供一个 `r` 前缀可以创建一个 “原始 raw” 字符串
  print(r"换行符：\n");
  print("换行符：\\n");

  print("*********** list ***********");
  var list = [1, 2, 3];
  //Lists 的下标索引从 0 开始，第一个元素的索引是 0. list.length - 1 是最后一个元素的索引
  print(list[list.length - 1]);

  //修改元素
  list[0] = 2;
  print(list);
  print("数组遍历");
  for (var i in list) {
    print(i);
  }

  //在 list 字面量之前添加 const 关键字，可以 定义一个不变的 list 对象（编译时常量）
  var list3 = const [1, 2, 3];
  //list3.add(2);
  //print(list3);

  //const 标识变量不可修改
  const list4 = [3, 4, 5];
  //错误写法
  //list4.add(1);
  //print(list4);

  print("*********** map ***********");
  //直接声明，用{}表示，里面写key和value，每组键值对中间用逗号隔开
  var companys = {'a': '阿里巴巴', 't': '腾讯', 'b': '百度'};
  //添加元素
  companys['j'] = '京东';
  //获取与修改元素
  var c = companys['c']; //没有对应的key返回null
  companys['a'] = 'alibaba';
  print(companys);
  print("没对应key获取的 value = $c");

  var companys2 = new Map();
  companys2['a'] = '阿里巴巴';
  companys2['c'] = '腾讯';
  companys2['b'] = '百度';
  print(companys2);

  print("map遍历");
  for (var i in companys2.entries) {
    print("key = ${i.key} value = ${i.value}");
  }

  print("key集合");
  print(companys2.keys);
  print("value集合");
  print(companys2.values);

  print("*********** runes特殊字符 ***********");
  var clapping = '\u{1f44f}';

  ///5个16进制 需要使用{}
  print(clapping); //👏
  //获得 16位代码单元
  print(clapping.codeUnits); //[55357, 56399]
  //获得unicode代码
  print(clapping.runes.toList()); //[128079]

  //fromCharCode 根据字符码创建字符串
  print(String.fromCharCode(128079));
  print(String.fromCharCodes(clapping.runes));
  print(String.fromCharCodes([55357, 56399]));
  print(String.fromCharCode(0x1f44f));

  Runes input =
      Runes('\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(String.fromCharCodes(input));

  print("*********** Symbol ***********");
  var a = #A; //常量
  print(a);
  switch (a) {
    case #A:
      print("A");
      break;
    case #B:
      print("B");
      break;
  }
  var b = new Symbol("b");
  print(b);
  print(#b == b); //true
}
