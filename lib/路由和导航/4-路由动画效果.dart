import 'package:flutter/material.dart';

/**
    路由(Route)在移动开发中通常指页面（Page），在Android中通常指一个Activity。
    所谓路由管理，就是管理页面之间如何跳转，通常也可被称为导航管理。这和原生开发类似，
    无论是Android还是iOS，导航管理都会维护一个路由栈，路由入栈(push)操作对应打开一个新页面，
    路由出栈(pop)操作对应页面关闭操作，而路由管理主要是指如何来管理路由栈。
 */
void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "第一个页面", home: MainPageDetail());
  }
}

class MainPageDetail extends StatelessWidget {
  const MainPageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第一个页面"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              //导航到新路由
              var person = await Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(microseconds: 500),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        //平移动画
                        var animal = SlideTransition(
                          position: Tween(
                            begin: const Offset(1.0, 0.0),
                            end: const Offset(0.0, 0.0),
                          ).animate(animation),
                          child: const Page2(),
                        );
                        return animal;
                      }));
              debugPrint(person.toString());
            },
            child: const Text("跳转第一个页面"),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第二个界面"),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text("返回上个页面"),
            onPressed: () {
              //点击返回按钮，并传递数据
              Navigator.pop(context, Person("张三", 20));
            }),
      ),
    );
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() {
    return 'Person{name: $name, age: $age}';
  }
}
