import 'package:flutter/material.dart';

import '3-UI组件/1.statelessWidget相关组件.dart';
import '3-UI组件/2.StatefulWidget相关组件.dart';
import '3-UI组件/3.Fullter布局组件.dart';
import '3-UI组件/4.Gesture检查用户手势以及处理点击事件.dart';
import '3-UI组件/5.如何导入和使用Flutter的资源文件.dart';
import '3-UI组件/6.Flutter如何打开第三方应用？.dart';

void main() {
  runApp(const DynamicTheme());
}

class DynamicTheme extends StatefulWidget {
  const DynamicTheme({super.key});

  @override
  State<DynamicTheme> createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("如何创建和使用Flutter的路由与导航？"),
        ),
        body: const Column(
          children: [RouteNavigator()],
        ),
      ),
      routes: {
        "less": (context) => const LessGroupPage(),
        "ful": (context) => const StatefulGroup(),
        "layout": (context) => const FlutterLayoutPage(),
        "gesture": (context) => const GesturePage(),
        "res": (context) => const ResPage(),
        "launch": (context) => const LauncherPage(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  const RouteNavigator({super.key});

  @override
  State<RouteNavigator> createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: Text(byName ? "通过路由名跳转" : "不通过路由名跳转"),
          value: byName,
          onChanged: (isChangedTitle) {
            setState(() {
              byName = isChangedTitle;
              print("byName = $byName");
            });
          },
        ),
        _item('StatelessWidget与基础组件', const LessGroupPage(), 'less'),
        _item('StatefulWidget与基础组件', const StatefulGroup(), 'ful'),
        _item('Flutter布局开发', const FlutterLayoutPage(), 'layout'),
        _item('如何检测用户手势以及处理点击事件？', const GesturePage(), 'gesture'),
        _item('如何导入和使用Flutter的资源文件？', const ResPage(), 'res'),
        _item('如何打开第三方应用？', const LauncherPage(), 'launch'),
      ],
    );
  }

  _item(String title, Widget page, String routeName) {
    return ElevatedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return page;
            }));
          }
        },
        child: Text(title));
  }
}
