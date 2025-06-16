import 'package:flutter/material.dart';

/**
    主要用来显示用户的头像，任何图片都会被剪切为圆形。
 */
void main() {
  //在sd卡中放入一张图片。然后利用**path_provider**库获取sd卡根目录
  runApp(_CircleAvatar());
}

class _CircleAvatar extends StatefulWidget {
  const _CircleAvatar({super.key});

  @override
  State<_CircleAvatar> createState() => _CircleAvatarState();
}

class _CircleAvatarState extends State<_CircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      //半径，控制大小
      radius: 50.0,
      //图片提供者 ImageProvider
      backgroundImage: AssetImage("assets/banner.png"),
    );
  }
}
