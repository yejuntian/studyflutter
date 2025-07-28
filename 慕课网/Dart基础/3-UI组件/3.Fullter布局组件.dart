import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterLayoutPage());
}

//进行Flutter布局开发
class FlutterLayoutPage extends StatefulWidget {
  const FlutterLayoutPage({super.key});

  @override
  State<FlutterLayoutPage> createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "进行Flutter布局开发",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("进行Flutter布局开发"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "首页",
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              label: "首页",
              icon: Icon(
                Icons.list,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.list,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                onRefresh: _handleOnRefresh,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.network(
                                    "http://www.devio.org/img/avatar.png"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: ClipRRect(
                                child: Opacity(
                                  opacity: 0.3, //透明度
                                  child: Image.network(
                                    "http://www.devio.org/img/avatar.png",
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: TextField(
                                //输入文本的样式
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  hintText: "请输入：",
                                  hintStyle: TextStyle(fontSize: 15),
                                ),
                              ),
                            )
                          ],
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            hintText: "请输入：",
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          height: 100,
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            // color: Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                            clipBehavior: Clip.antiAlias, //抗锯齿
                            child: PageView(
                              children: [
                                _item("page1", Colors.lightBlueAccent),
                                _item("page2", Colors.yellow),
                                _item("page3", Colors.red),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            FractionallySizedBox(
                              //允许你指定子组件 在父容器尺寸的百分比 上占据多少空间
                              widthFactor: 1,
                              //子组件在剩余空间内的对齐方式，默认是 center
                              alignment: Alignment.center,
                              child: Container(
                                alignment: Alignment.centerRight,
                                decoration:
                                    const BoxDecoration(color: Colors.yellow),
                                child: const Text(
                                  "宽度撑满，内容在最右边",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              //Container 的尺寸是由子内容（Text）撑开的
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                  color: Colors.greenAccent),
                              child: const Text(' 左边内容部分 ',
                                  style: TextStyle(color: Colors.red)),
                            ),
                            Expanded(
                              //自动撑满 Row 剩余空间
                              child: Container(
                                color: Colors.red,
                                alignment: Alignment.center,
                                child: const Text(
                                  '右边撑满剩余的宽度',
                                  style: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Stack(
                          children: [
                            Image.network(
                              "http://www.devio.org/img/avatar.png",
                              width: 100,
                              height: 100,
                            ),
                            Positioned(
                                right: 0,
                                bottom: 0,
                                child: Stack(
                                  children: [
                                    Image.network(
                                      "http://www.devio.org/img/avatar.png",
                                      width: 50,
                                      height: 50,
                                    ),
                                    const Positioned(
                                      //Positioned(bottom: 0, left: 0, right: 0)把文字的父容器拉伸到小图底部的整个宽度
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      //底部居中的文字
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          "右下角",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                        Wrap(
                          //创建一个wrap布局，从左到右进行排列，会自动换行
                          spacing: 8, //水平间距
                          runSpacing: 6, //垂直间距
                          children: [
                            _chip('Flutter'),
                            _chip('进阶'),
                            _chip('实战'),
                            _chip('App'),
                            _chip('进行中...'),
                          ],
                        )
                      ],
                    )
                  ],
                ))
            : Column(
                children: [
                  const Text("列表"),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.red),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "拉伸铺满高度",
                          //文本居中
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _handleOnRefresh() async {
    await Future.delayed(const Duration(microseconds: 1300));
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.blue,
        ),
      ),
    );
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade100,
        child: Text(
          label.substring(0, 1),
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
