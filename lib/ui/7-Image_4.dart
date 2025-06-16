import 'package:flutter/material.dart';

/**
    显示图片的`Widget`。图片常用的格式主要有bmp,jpg,png,gif,webp等，Android中并不是天生支持gif和webp动图，
    但是这一特性在flutter中被很好的支持了。
    | 方式          | 解释                                                        |
    | ------------- | ----------------------------------------------------------- |
    | Image()       | 使用ImageProvider提供图片，如下方法本质上也是使用的这个方法 |
    | Image.asset   | 加载资源图片                                                |
    | Image.file    | 加载本地图片文件                                            |
    | Image.network | 加载网络图片                                                |
    | Image.memory  | 加载内存图片                                                |

 */
void main() {
  //在sd卡中放入一张图片。然后利用**path_provider**库获取sd卡根目录
  runApp(_ImageState());
}

class _ImageState extends StatefulWidget {
  const _ImageState({super.key});

  @override
  State<_ImageState> createState() => _ImageStateState();
}

class _ImageStateState extends State<_ImageState> {
  Image? image;

  @override
  void initState() {
    super.initState();
    // 设置网络图片地址
    image = Image.network(
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
      // 示例图片，可替换为你自己的 URL
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        return const Text("图片加载失败");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Image演示",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Image"),
        ),
        body: Center(
          child: image ?? const Text('图片未加载或权限未授予'),
        ),
      ),
    );
  }
}
