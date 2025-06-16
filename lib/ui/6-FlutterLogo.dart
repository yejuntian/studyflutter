import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * FlutterLogo:这个Widget用于显示Flutter的logo
 */
void main() {
  runApp(const _FlutterLogo());
}

class _FlutterLogo extends StatelessWidget {
  const _FlutterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const FlutterLogo(
      //大小
      size: 100,
      //logo上文字颜色
      textColor: Colors.red,
      //markOnly：只显示logo，horizontal：logo右边显示flutter文字，stacked：logo下面显示文字
      style: FlutterLogoStyle.stacked,
    );
  }
}
