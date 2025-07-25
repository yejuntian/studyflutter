import 'package:flutter/material.dart';

import '1-常用数据类型/1-数字类型.dart';
import '2-面向对象/1.面向对象.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: const [DataType()],
        ),
      ),
    );
  }

  void _oopLearn() {
    print("*********面向对象->工程模式************");
    var log1 = Logger();
    var log2 = Logger();
    print(log1 == log2);
  }
}
