import 'package:flutter/material.dart';

/**
    当使用默认`Image` widget显示图片时，您可能会注意到它们在加载完成后会直接显示到屏幕上。
    这可能会让用户产生视觉突兀。如果最初显示一个占位符，然后在图像加载完显示时淡入，
    我们可以使用`FadeInImage`来达到这个目的！
 */
void main() {
  //在sd卡中放入一张图片。然后利用**path_provider**库获取sd卡根目录
  runApp(_FadeInImage());
}

class _FadeInImage extends StatefulWidget {
  const _FadeInImage({super.key});

  @override
  State<_FadeInImage> createState() => _FadeInImageState();
}

class _FadeInImageState extends State<_FadeInImage> {
  @override
  Widget build(BuildContext context) {
    return const FadeInImage(
      placeholder: AssetImage("assets/banner.png"),
      image: NetworkImage(
          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
      fit: BoxFit.fitWidth,
      fadeInDuration: Duration(seconds: 1),
    );
  }
}
