import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
    State类除了'build'之外还提供了很多方法让我们重写，这些方法会在不同状态下由Flutter进行回调，
    所以这些方法称之为'生命周期'方法。
 */
void main() {
  runApp(const MyApp());
}

//StatelessWidget 不支持状态的动态更新
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late bool isShowChild;

  //当Widget第一次插入到Widget树时会被调用，对于每一个State对象，Flutter framework只会调用一次该回调
  @override
  void initState() {
    super.initState();
    isShowChild = true;
    debugPrint("parent initState......");
  }

  //在initState()之后立刻调用,当依赖的InheritedWidget rebuild,会触发此接口被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("parent didChangeDependencies......");
  }

  //绘制界面，当setState触发的时候会再次被调用
  @override
  Widget build(BuildContext context) {
    debugPrint("parent build......");
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              setState(() {
                isShowChild = !isShowChild;
              });
            },
            //如果由` child: isShowChild ? Child() : Text("演示移除Child")`，改为` child: Child()`，点击按钮时
            //parent build......
            //child didUpdateWidget......
            //child build......
            child: isShowChild ? const Child() : const Text("演示移除Child"),
          ),
        ),
      ),
    );
  }

  //状态改变的时候会调用该方法,比如调用了setState
  @override
  void didUpdateWidget(covariant MyApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("parent didUpdateWidget......");
  }

  //当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    debugPrint('parent deactivate......');
  }

  //当State对象从树中被永久移除时调用；通常在此回调中释放资源,相当于onDestory()
  @override
  void dispose() {
    super.dispose();
    debugPrint('parent dispose......');
  }
}

class Child extends StatefulWidget {
  const Child({super.key});

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  void initState() {
    super.initState();
    debugPrint("child initState......");
  }

  //在initState()之后立刻调用,当依赖的InheritedWidget rebuild,会触发此接口被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("child didChangeDependencies......");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("child build......");
    return const Text('lifeCycle');
  }

  //父widget状态改变的时候会调用该方法,比如父节点调用了setState
  @override
  void didUpdateWidget(covariant Child oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("child didUpdateWidget......");
  }

  ///当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    debugPrint('child deactivate......');
  }

  ///当State对象从树中被永久移除时调用；通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
    debugPrint('child dispose......');
  }
}
