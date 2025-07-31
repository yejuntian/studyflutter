import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/**
    Flutter Widget的生命周期重点讲解StatefulWidget的生命周期
    因为无状态的widget StatelessWidget 只有createElement与build两个生命周期方法。

    StatefulWidget的生命周期不同可以分为三组
    1.初始化时期
    createState、initState
    2.更新期
    didChangeDependencies、build、didUpdateWidget
    3.销毁期
    deactivate、dispose
    扩展阅读：
    http://www.devio.org/io/flutter_app/img/blog/flutter-widget-lifecycle.png
    https://flutterbyexample.com/stateful-widget-lifecycle/
 */
//Flutter页面生命周期
class WidgetLifecycle extends StatefulWidget {
  const WidgetLifecycle({super.key});

  //当我们创建一个新的StatefulWidget时,这个会立刻调用
  //并且这个方法必须被覆盖
  @override
  State<WidgetLifecycle> createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;

  //这是创建Widget时调用的除构造方法外的第一个方法：
  //类似于Android的OnCreate()与IOS的viewDidLoad()
  //在这个方法中通常会做一些初始化工作,比如channel的初始化，监听器的初始化等。
  @override
  void initState() {
    print('----initState----');
    super.initState();
  }

  //当依赖的State对象改变时会调用：
  //a.在第一次构建Widget时，在initState()之后立即调用此方法；
  //b.如果StatefulWidget依赖于InheritedWidget,那么当 当前State所依赖InheritedWidget中变量改变时会再次调用它
  //拓展：InheritedWidget可以高效的将数据在Widget树中向下传递、共享，可参考：https://book.flutterchina.club/chapter7/inherited_widget.html
  @override
  void didChangeDependencies() {
    print('---didChangeDependencies----');
    super.didChangeDependencies();
  }

  //这是一个必须实现的方法，在这里实现你要呈现的页面内容：
  //它会在didChangeDependencies()之后立即调用；
  //另外当调用setState()后也会再次调用该方法。
  @override
  Widget build(BuildContext context) {
    print('---build-----');
    return MaterialApp(
      title: "Flutter页面生命周期",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter页面生命周期"),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                },
                child: const Text(
                  "点我",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              Text(
                _count.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //这是一个不常用到的生命周期方法,当父组件需要重新绘制时才会调用；
  //改方法会携带一个oldWidget参数，可以将其与当前的Widget进行对比以便执行一些额外的逻辑，如：
  //if(oldWidget.xxx != widget.xxx)....
  @override
  void didUpdateWidget(covariant WidgetLifecycle oldWidget) {
    print('----didUpdateWidget-----');
    super.didUpdateWidget(oldWidget);
  }

  //很少使用，在组件被移除时调用，在dispose()之前调用。
  @override
  void deactivate() {
    print('-----deactivate------');
    super.deactivate();
  }

  //常用，组件被销毁时调用：
  //通常在该方法中执行一些资源的释放工作；比如：监听器的卸载，Channel的销毁等。
  @override
  void dispose() {
    print('-----dispose------');
    super.dispose();
  }
}
