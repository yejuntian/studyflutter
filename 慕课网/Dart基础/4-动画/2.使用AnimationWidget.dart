import 'package:flutter/material.dart';

void main() {
  runApp(const LogoApp());
}

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    Tween<double> tween = Tween<double>(begin: 0, end: 200);
    animation = tween.animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedLogo(listenable: animation),
        ),
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required super.listenable});

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      width: animation.value,
      height: animation.value,
      child: const FlutterLogo(),
    );
  }
}
