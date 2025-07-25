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
    return Container(child: const Text("常用数据类型请查看控制台输出"));
  }

  void numType() {
    num num1 = -1.0; //是数字类型的父类
    num num2 = 2; //是数字类型的父类

    int int1 = 3; //只能是整数
    double d1 = 1.68; //双精度

    print("num:$num1 num2:$num2 int:$int1 double:$d1");
    print(  num1.abs()); //求绝对值
    print(num1.toInt()); //转成int类型
    print(num1.toDouble()); //转成Double类型
  }
}
