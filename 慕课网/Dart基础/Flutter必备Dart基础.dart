import 'package:flutter/material.dart';

import '1-常用数据类型/1-数字类型.dart';
import '2-面向对象/1.面向对象.dart';
import '2-面向对象/2.函数.dart';
import '2-面向对象/3.泛型.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter必备Dart基础",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage("Flutter必备Dart基础"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title;

  MyHomePage(this.title, {super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    _oopLearn();
    _functionLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
            //先注释掉，
            // children: const [DataType()],
            ),
      ),
    );
  }

  void _oopLearn() {
    print("*********面向对象->工程模式************");
    var log1 = Logger();
    var log2 = Logger();
    print(log1 == log2);

    Student.doPrint("_oopLearn");

    //创建Student对象
    Student stu1 = Student("清华", "jack", 18);
    stu1.school = '985';
    print(stu1.toString());

    Student stu2 = Student("北大 ", "Tom", 16, city: '上海', country: '中国');
    print(stu2.toString());

    StudyFlutter studyFlutter = StudyFlutter();
    studyFlutter.study();
  }

  void _functionLearn() {
    print("*********Flutter函数************");
    TestFunction testFunction = TestFunction();
    testFunction.start();

    TestGeneric testGeneric = TestGeneric();
    testGeneric.start();
  }
}
