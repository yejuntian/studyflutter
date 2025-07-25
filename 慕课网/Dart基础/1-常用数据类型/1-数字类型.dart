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
    mapType();
    tips();
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

  void mapType() {
    print("************mapType**************");
    //Map初始化
    //第一种初始化方式
    Map names = {'xiaoming': '小明', "xiaohong": "小红"};
    print(names);

    //第二种初始化方式
    Map ages = {};
    ages['xiaoming'] = 16;
    ages['xiaohong'] = 18;
    print(ages);

    print("************map遍历方式一**************");
    ages.forEach((key, value) {
      print("key = $key value = $value");
    });
    print("************map遍历方式二**************");
    for (var key in ages.keys) {
      print("key = $key value = ${ages[key]}");
    }

    print("************迭代成新的Map**************");
    Map newMap = ages.map((key, value) {
      //迭代成新的m ap
      return MapEntry(value, key);
    });
    print(newMap);
  }

  void tips() {
    /**
        dynamic:私活所有Dart对象的基础类型，在大多数情况下，通常不会使用它，
        通过它定义的变量会关闭类型检查，这意味着dynamic x='hal' 因为x并没有foo()方法，
        这段代码静态类型检查不会报错，但是运行时会crash,所以建议大家在编程时不要直接使用dynamic。

        var:是一个关键字，意思是'我不关心这里的类型是什么'；系统会自动推断类型runtimeType;

        Object:是Dart对象的基类，当你定义：Object obj=xxx,时这时候系统认为obj是一个对象，
        你可以调用obj的toString()和hashCode()方法，因为Object提供了这些方法，但是当你调用obj.foo()方法时，静态类型检查会报错。

        综上所述：dynamic和Object最大的区别在于静态类型检查上。
     */
    print("************dynamic、var、Object三者区别**************");
    //dynamic 动态数据类型，运行的时候才确定
    dynamic x = 'hal';
    print(x.runtimeType);
    print(x);

    x = 124;
    print(x.runtimeType);
    print(x);

    //var 编译器可以推断它的数据类型
    var a = 'hal';
    print(a.runtimeType);
    print(a);

    //object
    Object obj = '111';
    print(obj.runtimeType);
    print(obj);
  }
}
