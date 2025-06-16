import 'package:flutter/material.dart';

/**
    输入框。
 */
void main() {
  //可点击的Icon。
  runApp(const Demo2());
}

class Demo1 extends StatelessWidget {
  const Demo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ElevatedButton",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("输入框"),
        ),
        body: const Center(
          //线性布局，垂直方向
          child: Column(
            children: [
              TextField(
                //自动获得焦点
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或密码",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextField(
                //隐藏正在编辑的文本
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//我们可能大多数情况下需要将下划线更换为矩形边框，这时候可能就需要组合widget来完成:
class Demo2 extends StatelessWidget {
  const Demo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "demo2",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("自定义输入框"),
        ),
        //容器 设置一个控件的尺寸、背景、margin
        body: Container(
          margin: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            // 边框红色，宽度1像素
            border: Border.all(
              color: Colors.red,
              width: 1.0,
            ),
            //圆角
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: const TextField(
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或密码",
              prefixIcon: Icon(Icons.person),
              //隐藏下划线
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
