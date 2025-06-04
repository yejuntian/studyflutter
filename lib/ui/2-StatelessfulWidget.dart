import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
    （1）
    StatelessWidget和StatefulWidget是flutter的基础组件，日常开发中自定义`Widget`都是选择继承这两者之一。也是在往后的开放中，我们最多接触的Widget：

    StatelessWidget：无状态的，展示信息，面向那些始终不变的UI控件；

    StatefulWidget：有状态的，可以通过改变状态使得 UI 发生变化，可以包含用户交互(比如弹出一个 dialog)。

    （2）
    StatefulWidget是动态的，添加了一个新的接口`createState()`用于创建和Stateful widget相关的状态`State`，
    它在Stateful widget的生命周期中可能会被多次调用。

    当State被改变时，可以手动调用其`setState()`方法通知Flutter framework状态发生改变，
    Flutter framework在收到消息后，会重新调用其`build`方法重新构建widget树，从而达到更新UI的目的。

 **/
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

  //当Widget第一次插入到Widget树时会被调用initState()方法，对于每一个State对象，Flutter framework只会调用一次该回调
  @override
  void initState() {
    debugPrint("只会调用一次改回调！");
  }

  MyAppState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      data = "你说的对，我很帅！";

      //用来修改状态，刷新UI，会重新调用build方法更新UI
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
