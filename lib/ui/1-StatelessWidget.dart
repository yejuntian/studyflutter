import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
    Stateless Widget

    StatelessWidget用于不需要维护状态的场景，它通常在`build`方法中通过嵌套其它Widget来构建UI，
    在构建过程中会递归的构建其嵌套的Widget。

    BuildContext`表示构建widget的上下文，它是操作widget在树中位置的一个句柄，
    它包含了一些查找、遍历当前Widget树的一些方法。每一个widget都有一个自己的context对象。
 */
void main() {
  runApp(const MyApp());
}

//StatelessWidget 不支持状态的动态更新
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  //在build方法中通过嵌套其它Widget来构建UI，在构建过程中会递归的构建其嵌套的Widget
  Widget build(BuildContext context) {
    //嵌套 MaterialApp：封装了应用程序实现Material Design所需要的一些widget
    return MaterialApp(
        //标题,显示在recent时候的标题
        title: "Widget演示",
        //主页面
        //Scaffold : Material Design布局结构的基本实现。
        home: Scaffold(
          //android中的ToolBar/ActionBar
          appBar: AppBar(title: const Text("哈哈😄")),
          body: const Center(child: Text("我很帅")),
        ));
  }
}
