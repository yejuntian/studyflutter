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
    return Container(child: const Text("常用数据类型请查看控制台输出"));
  }

  //数字类型
  void numType() {
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
}
