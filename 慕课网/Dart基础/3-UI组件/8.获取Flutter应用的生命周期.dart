import 'package:flutter/material.dart';

//如何获取Flutter应用维度的生命周期
//WidgetsBindingObserver:是一个Widgets绑定观察器,通过它我们可以监听应用的生命周期、语言等的变化。
class AppLifecycle extends StatefulWidget {
  const AppLifecycle({super.key});

  @override
  State<AppLifecycle> createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter应用生命周期",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter应用生命周期"),
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("state = $state");
    if (state == AppLifecycleState.resumed) {
      print("APP进入前台");
    } else if (state == AppLifecycleState.paused) {
      print("APP进入后台");
    } else if (state == AppLifecycleState.inactive) {
      //不常用：应用处于非活动状态，并且未接收用户输入调用，比如：来了电话
    } else if (state == AppLifecycleState.detached) {
      //不常用：通常出现在原生 Android View 被销毁时（Flutter Engine 仍在运行）
    } else if (state == AppLifecycleState.hidden) {
      print("APP页面隐藏了");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
