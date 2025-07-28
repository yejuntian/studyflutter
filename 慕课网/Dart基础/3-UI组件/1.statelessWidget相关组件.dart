import 'package:flutter/material.dart';

void main() {
  runApp(const LessGroupPage());
}

class LessGroupPage extends StatelessWidget {
  const LessGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 20);
    return MaterialApp(
      title: "StatelessWidget与基础组件",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('StatelessWidget与基础组件'),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Text(
                'I am Test',
                style: textStyle,
              ),
              const Icon(
                Icons.android,
                size: 50,
                color: Colors.red,
              ),
              const CloseButton(),
              const BackButton(),
              const Chip(
                //材料设计中一个非常有趣的小部件，什么是Chip@https://material.io/design/components/chips.html
                label: Text("StatelessWidget与基组件"),
                avatar: Icon(Icons.people),
              ),
              const Divider(
                height: 20, //线距离容器的高度
                indent: 10, //左侧高度
                color: Colors.orange,
              ),
              Card(
                //带有圆角，阴影，边框等效果的卡片
                color: Colors.blue,
                elevation: 6,
                margin: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'I am Card',
                    style: textStyle,
                  ),
                ),
              ),
              const AlertDialog(
                title: Text('盘他'),
                titlePadding: EdgeInsets.all(10),
                content: Text('你这个糟老头子坏得很'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
