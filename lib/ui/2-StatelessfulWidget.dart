import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//StatelessWidget 不支持状态的动态更新
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String data = "我很帅";

  MyAppState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      data = "你说的对，我很帅！";

      //用来修改状态，刷新UI，重新调用build方法
      setState(() {});
    });

    //不能再构造方法中刷新状态，因为state还没有创建完成，如何刷新？？
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("哈哈"),
        ),
        body: Center(child: Text(data)),
      ),
    );
  }
}
