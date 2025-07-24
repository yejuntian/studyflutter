import 'package:flutter/material.dart';

/**
    Hero动画
    Hero动画就是在路由切换时，有一个共享的Widget可以在新旧路由间切换，由于共享的Widget在新旧路由页面上的位置、外观可能有所差异，
    所以在路由切换时会逐渐过渡，这样就会产生一个Hero动画。

    注意：共享元素TAG必须是唯一的，不能相同。
 */

void main() {
  runApp(const AnimationApp());
}

class AnimationApp extends StatefulWidget {
  const AnimationApp({super.key});

  @override
  State<AnimationApp> createState() => _AnimationAppState();
}

class _AnimationAppState extends State<AnimationApp> {
  GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: key,
      title: "animation",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('animation'),
        ),
        body: Row(
          children: [
            const Expanded(child: Text("1111")),
            InkWell(
              child: Container(
                  width: 120,
                  height: 120,
                  child: Hero(
                    tag: "aaa",
                    child: Image.network(
                        "https://inews.gtimg.com/om_bt/OuGNUQ8sk6fS1rpjsC5XWZQlDYmaVPFecpP7K61w1s6hgAA/1000"),
                  )),
              onTap: () {
                key.currentState?.push(MaterialPageRoute(builder: (_) {
                  return const NewPage();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "新页面",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("新页面"),
          ),
          body: Hero(
              tag: "aaa",
              child: Image.network(
                  "https://inews.gtimg.com/om_bt/OuGNUQ8sk6fS1rpjsC5XWZQlDYmaVPFecpP7K61w1s6hgAA/1000")),
        ));
  }
}
