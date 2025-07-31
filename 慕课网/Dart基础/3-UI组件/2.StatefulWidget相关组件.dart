import 'package:flutter/material.dart';

void main() {
  runApp(StatefulGroup());
}

class StatefulGroup extends StatefulWidget {
  const StatefulGroup({super.key});

  @override
  State<StatefulGroup> createState() => _StatefulGroupState();
}

class _StatefulGroupState extends State<StatefulGroup> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StatefulWidget与基础组件",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("StatefulWidget与基础组件"),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back),
            ),
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
                    tooltip: "首页",
                    label: "首页",
                    icon: Icon(
                      Icons.home,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      Icons.home,
                      color: Colors.blue,
                    )),
                BottomNavigationBarItem(
                    tooltip: "列表",
                    label: "列表",
                    icon: Icon(
                      Icons.list,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      Icons.list,
                      color: Colors.blue,
                    ))
              ]),
          body: _currentIndex == 0
              ? RefreshIndicator(
                  onRefresh: _handleOnRefresh,
                  child: ListView(
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Image.network(
                                width: 100,
                                height: 100,
                                'http://www.devio.org/img/avatar.png'),
                            const TextField(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  hintText: '请输入',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                  )),
                            ),
                            Container(
                              height: 100,
                              margin: const EdgeInsets.only(top: 10),
                              decoration: const BoxDecoration(
                                  color: Colors.lightBlueAccent),
                              child: PageView(
                                children: [
                                  _item("Page1", Colors.deepOrange),
                                  _item("Page2", Colors.green),
                                  _item("Page3", Colors.red),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
              : Text("列表")),
    );
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> _handleOnRefresh() async {
    await Future.delayed(const Duration(microseconds: 1000));
  }
}
