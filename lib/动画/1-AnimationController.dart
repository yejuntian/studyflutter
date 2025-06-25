import 'package:flutter/material.dart';

/**
    ## 动画

    Flutter中的动画系统基于`Animation`对象的，和之前的手势不同，它不是一个Widget，这是因为`Animation`对象本身和UI渲染没有任何关系。Animation是一个抽象类，就相当于一个定时器，它用于保存动画的插值和状态，并执行数值的变化。widget可以在`build`函数中读取`Animation`对象的当前值， 并且可以监听动画的状态改变。

    ### AnimationController

    AnimationController用于控制动画，它包含动画的启动`forward()`、停止`stop()` 、反向播放 `reverse()`等方法。AnimationController会在动画的每一帧，就会生成一个新的值。默认情况下，AnimationController在给定的时间段内线性的生成从0.0到1.0（默认区间）的数字。

    ```dart
    AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 2000), //动画时间
    lowerBound: 10.0,	//生成数字的区间
    upperBound: 20.0,	//10.0 - 20.0
    vsync: this  //TickerProvider 动画驱动器提供者
    );
    ```

    #### Ticker

    Ticker的作用是添加屏幕刷新回调，每次屏幕刷新都会调用`TickerCallback`。使用Ticker来驱动动画会防止屏幕外动画（动画的UI不在当前屏幕时，如锁屏时）消耗不必要的资源。因为Flutter中屏幕刷新时会通知Ticker，锁屏后屏幕会停止刷新，所以Ticker就不会再触发。最简单的做法为将`SingleTickerProviderStateMixin`添加到State的定义中。

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "animation",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('animation'),
        ),
        body: AnimWidget(),
      ),
    );
  }
}

class AnimWidget extends StatefulWidget {
  const AnimWidget({super.key});

  @override
  State<AnimWidget> createState() => _AnimWidgetState();
}

class _AnimWidgetState extends State<AnimWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Color?> animateColor;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      // 提供 vsync 最简单的方式，就是直接混入 SingleTickerProviderStateMixin
      // 如果有多个AnimationController，则使用TickerProviderStateMixin。
      vsync: this,
    );
    animationController.addListener(() {
      setState(() {});
      print("value = ${animationController.value}");
    });

    var tween = ColorTween(begin: Colors.red, end: Colors.yellow);
    animateColor = tween.animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "动画",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("动画"),
        ),
        body: Container(
          width: 100,
          height: 100,
          color: animateColor.value,
          child: const Text("11111111"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
