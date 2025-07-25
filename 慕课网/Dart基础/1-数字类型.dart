import 'package:flutter/material.dart';

class DataType extends StatefulWidget {
  const DataType({super.key});

  @override
  State<DataType> createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    numType();
    stringType();
    boolType();
    listType();
    return Container(child: const Text("常用数据类型请查看控制台输出"));
  }

  //数字类型
  void numType() {
    print("************numType**************");
    num num1 = -1.0; //是数字类型的父类
    num num2 = 2; //是数字类型的父类

    int int1 = 3; //只能是整数
    double d1 = 1.68; //双精度

    print("num:$num1 num2:$num2 int:$int1 double:$d1");
    print(num1.abs()); //求绝对值
    print(num1.toInt()); //转成int类型
    print(num1.toDouble()); //转成Double类型
  }

  //字符串
  void stringType() {
    print("************stringType**************");
    //字符串定义
    String str1 = '字符串', str2 = "双引号";

    //字符串拼接
    String str3 = 'str1:$str1 str2:$str2';

    //字符串拼接
    String str4 = 'str1:' + str1 + ' str2:' + str2;

    print(str3);
    print(str4);

    //常用方法
    String str5 = "常用数据类型，请看控制台输出";

    //常用方法

    //字符串截取
    print(str5.substring(1, 5));
    //获取指定字符串位置
    print(str5.indexOf("类型"));
  }

  //布尔类型， Dart 是强 bool类型检查，只有bool类型的值是true才被认为是true
  void boolType() {
    print("************boolType**************");
    bool success = true, fail = false;
    print(success);
    print(fail);

    //输出true
    print(success || fail);

    //输出false
    print(success && fail);
  }

  //List集合
  void listType() {
    print("************listType**************");
    //集合初始化方式
    List list = [1, 3, 5, "集合"];
    print(list);

    List<int> list2 = [1, 3, 4];
    // list2 = list;  错误做法，类型转换错误

    List list3 = [];
    list3.add('list3'); //通过add方法添加元素
    list3.addAll(list);
    print(list3);

    //集合的生成函数用法，利用index生成新的集合，且新的list元素个数为3
    List list4 = List.generate(3, (index) => {index * 3});
    print(list4);

    //集合遍历方式
    print("************集合遍历的方式(1)**************");
    //第一种方式
    for (int i = 0; i < list.length; i++) {
      print(list[i]);
    }
    print("************集合遍历的方式(2)**************");
    //第二种方式
    for (var result in list) {
      print(result);
    }
    print("************集合遍历的方式(3)**************");
    //第三种方式
    list.forEach((result) {
      print(result);
     });
  }
}
