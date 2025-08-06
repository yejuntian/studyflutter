import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TextApp());
}

class TextApp extends StatelessWidget {
  const TextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Text演示",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Text"),
        ),
        body: _TextBody(),
      ),
    );
  }
}

/**
 * 在使用`Text`显示文字时候，可能需要对文字设置各种不同的样式，类似Android的 `android:textColor/Size`等
 */
class _TextBody extends StatelessWidget {
  const _TextBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Hello Fultter",
      style: TextStyle(
        //颜色
        color: Colors.red,
        //默认字号14
        fontSize: 18,
        //粗体
        fontWeight: FontWeight.w800,
        //斜体
        fontStyle: FontStyle.italic,
        //underline：下划线，overline：上划线，lineThrough：删除线
        decoration: TextDecoration.lineThrough,
        decorationColor: Colors.black,
        //solid：实线，double：双线，dotted：点虚线，dashed：横虚线，wavy：波浪线
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }
}
