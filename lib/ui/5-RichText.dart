import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 如果需要显示更为丰富样式的文本(比如一段文本中文字不同颜色),可以使用`RichText`或者`Text.rich`
 */
void main() {
  runApp(const RichTextApp());
}

class RichTextApp extends StatelessWidget {
  const RichTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Text演示",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Text"),
        ),
        body: const _RichTextBody(),
      ),
    );
  }
}

class _RichTextBody extends StatelessWidget {
  const _RichTextBody({super.key});

  @override
  Widget build(BuildContext context) {
    var textSpan = const TextSpan(
        text: "hello",
        style: TextStyle(
          color: Colors.red,
        ),
        children: [
          TextSpan(text: "flu", style: TextStyle(color: Colors.blue)),
          TextSpan(text: "ter", style: TextStyle(color: Colors.yellow)),
        ]);
    return RichText(text: textSpan);
  }
}
