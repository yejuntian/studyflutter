import 'dart:ui';

import 'package:flutter/cupertino.dart';
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

    fit属性相当于android中的scaletype，定义如下：
    | fit              | 说明                                                         | 效果                                                         |
    | ---------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
    | BoxFit.fill      | 填充，忽略原有的宽高比，填满为止                             | ![基础Widget_Image_Fill](图片/基础Widget_Image_Fill.png)     |
    | BoxFit.contain   | 包含，不改变原有比例让容器包含整个图片，容器多余部分填充背景 | ![基础Widget_Image_Fill](图片/基础Widget_Image_Contain.png)  |
    | BoxFit.cover     | 覆盖，不改变原有比例，让图片充满整个容器，图片多余部分裁剪   | ![基础Widget_Image_Fill](图片/基础Widget_Image_Cover.png)    |
    | BoxFit.fitWidth  | 横向图片填充                                                 | ![基础Widget_Image_Fill](图片/基础Widget_Image_FitWidth.png) |
    | BoxFit.fitHeight | 纵向图片填充                                                 | ![基础Widget_Image_Fill](图片/基础Widget_Image_FitHeight.png) |
    | BoxFit.none      | 原始大小居中                                                 | ![基础Widget_Image_Fill](图片/基础Widget_Image_none.png)     |
    | BoxFit.scaleDown | 图片大小小于容器事相当于none，图片大小大于容器时缩小图片大小实现contain | ![基础Widget_Image_Fill](图片/基础Widget_Image_ScaleDown.png) |
 */
void main() {
  runApp(const _FlutterIcon());
}

class _FlutterIcon extends StatelessWidget {
  const _FlutterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ImageView",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Image"),
        ),
        body: Image.asset("assets/banner.png"),
      ),
    );
  }
}
