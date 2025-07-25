import 'package:flutter/material.dart';

/**
    Material widget库中提供了多种按钮Widget如ElevatedButton、TextButton、OutlinedButton等，
    它们都是直接或间接对RawMaterialButton的包装定制，所以他们大多数属性都和`RawMaterialButton`一样。
    所有Material 库中的按钮都有如下相同点：

    1. 按下时都会有“水波动画”。
    2. 有一个`onPressed`属性来设置点击回调，当按钮按下时会执行该回调，如果不提供该回调则按钮会处于禁用状态，禁用状态不响应用户点击。
 */
void main() {
  //"漂浮"按钮，它默认带有阴影和灰色背景
  runApp(const _ElevatedButton());
}

class _ElevatedButton extends StatelessWidget {
  const _ElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ElevatedButton",
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
            onPressed: () => {},
            child: const Text("Normal"),
          ),
        ),
      ),
    );
  }
}
